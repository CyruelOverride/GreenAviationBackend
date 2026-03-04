import pkg from 'pg';
import dotenv from 'dotenv';
import dns from 'dns';

dotenv.config();

const { Pool } = pkg;

if (!process.env.DATABASE_URL) {
  console.error('❌ Error: DATABASE_URL no está configurada en las variables de entorno');
  process.exit(1);
}

const isRemoteConnection = process.env.DATABASE_URL.includes('render.com') ||
  process.env.DATABASE_URL.includes('herokuapp.com') ||
  process.env.DATABASE_URL.includes('amazonaws.com') ||
  process.env.DATABASE_URL.includes('supabase.co') ||
  process.env.DATABASE_URL.includes('supabase.com') ||
  process.env.DATABASE_URL.includes('pooler.supabase');

let databaseUrl = process.env.DATABASE_URL.trim();

if (!databaseUrl.startsWith('postgresql://') && !databaseUrl.startsWith('postgres://')) {
  console.error('❌ Error: DATABASE_URL debe comenzar con postgresql:// o postgres://');
  process.exit(1);
}

if (databaseUrl.startsWith('postgres://')) {
  databaseUrl = databaseUrl.replace('postgres://', 'postgresql://');
}

let poolConfig;
try {
  const url = new URL(databaseUrl);
  poolConfig = {
    user: decodeURIComponent(url.username || ''),
    password: decodeURIComponent(url.password || ''),
    host: url.hostname,
    port: parseInt(url.port) || 5432,
    database: url.pathname.slice(1).replace(/\/$/, ''),
    ssl: isRemoteConnection ? { rejectUnauthorized: false } : false
  };
  if (!poolConfig.password || typeof poolConfig.password !== 'string') {
    throw new Error('La contraseña no es válida');
  }
} catch (err) {
  console.error('❌ Error parseando DATABASE_URL:', err.message);
  process.exit(1);
}

let pool = null;

/**
 * Inicializa la conexión: fuerza uso de IPv4 para evitar ENETUNREACH en redes sin IPv6.
 * Debe llamarse antes de levantar el servidor.
 */
export async function initConnection() {
  if (pool) return pool;

  // En Node 17+ el resolver prefiere IPv6; muchas redes no tienen IPv6 → ENETUNREACH.
  // Forzar IPv4 primero para que pg use una IP alcanzable.
  if (typeof dns.setDefaultResultOrder === 'function') {
    dns.setDefaultResultOrder('ipv4first');
  }

  const hostname = poolConfig.host;
  if (isRemoteConnection) {
    try {
      const ips = await dns.promises.resolve4(hostname);
      if (ips.length) {
        poolConfig.host = ips[0];
        if (process.env.NODE_ENV !== 'production') {
          console.log('📡 Host resuelto a IPv4:', poolConfig.host);
        }
      }
    } catch (e) {
      try {
        const [{ address }] = await dns.promises.lookup(hostname, { family: 4 });
        if (address) poolConfig.host = address;
      } catch (e2) {
        if (hostname.includes('supabase.co') && !hostname.includes('pooler')) {
          console.error('');
          console.error('❌ Este host de Supabase (conexión directa) solo tiene IPv6 y tu red no soporta IPv6.');
          console.error('   Solución: usa la URL del SESSION POOLER (IPv4 compatible):');
          console.error('   1. Supabase Dashboard → tu proyecto → Project Settings → Database');
          console.error('   2. En "Connection pooling" elige "Session" y copia la URI.');
          console.error('   3. Reemplaza DATABASE_URL en .env por esa URI (puerto 6543, host tipo ...pooler.supabase.com).');
          console.error('');
          throw new Error('Usa Session Pooler de Supabase para redes IPv4. Ver instrucciones arriba.');
        }
        console.warn('⚠️ No se pudo resolver IPv4 para', hostname, '- se usará hostname (puede fallar si tu red solo tiene IPv6).');
      }
    }
  }

  if (process.env.NODE_ENV !== 'production') {
    console.log('📡 Conectando a PostgreSQL:', `${poolConfig.user}@${poolConfig.host}:${poolConfig.port}/${poolConfig.database}`);
  }

  pool = new Pool(poolConfig);

  pool.on('error', (err) => {
    console.error('❌ Error en la conexión a PostgreSQL:', err.message);
    process.exit(-1);
  });

  await pool.query('SELECT NOW()');
  if (process.env.NODE_ENV !== 'production') {
    console.log('✅ Conectado a PostgreSQL');
  }
  return pool;
}

export const query = async (text, params) => {
  const start = Date.now();
  try {
    const res = await pool.query(text, params);
    if (process.env.NODE_ENV !== 'production' && process.env.DEBUG_QUERIES === 'true') {
      console.log('Query:', { text: text.substring(0, 100), duration: Date.now() - start, rows: res.rowCount });
    }
    return res;
  } catch (error) {
    console.error('Error en query:', process.env.NODE_ENV === 'production' ? error.message : { text: text.substring(0, 200), error: error.message });
    throw error;
  }
};

export const getClient = async () => {
  const client = await pool.connect();
  const q = client.query.bind(client);
  const release = client.release.bind(client);
  const timeout = process.env.NODE_ENV !== 'production' ? setTimeout(() => console.warn('⚠️ Cliente conectado >5s'), 5000) : null;
  client.release = () => {
    if (timeout) clearTimeout(timeout);
    return release();
  };
  return client;
};

export function getPool() {
  return pool;
}

export default { initConnection, query, getClient, getPool };
