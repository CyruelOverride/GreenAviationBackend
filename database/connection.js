import pkg from 'pg';
import dotenv from 'dotenv';

// Cargar variables de entorno
dotenv.config();

const { Pool } = pkg;

// Verificar que DATABASE_URL esté configurada
if (!process.env.DATABASE_URL) {
  console.error('❌ Error: DATABASE_URL no está configurada en las variables de entorno');
  if (process.env.NODE_ENV !== 'production') {
    console.error('   Asegúrate de crear un archivo .env en la raíz del proyecto con:');
    console.error('   DATABASE_URL=postgresql://usuario:contraseña@host:puerto/database');
  }
  process.exit(1);
}

// Detectar si es una conexión remota (Render, Heroku, Supabase, etc.)
const isRemoteConnection = process.env.DATABASE_URL.includes('render.com') || 
                           process.env.DATABASE_URL.includes('herokuapp.com') ||
                           process.env.DATABASE_URL.includes('amazonaws.com') ||
                           process.env.DATABASE_URL.includes('supabase.co');

// Limpiar y validar DATABASE_URL
let databaseUrl = process.env.DATABASE_URL;

if (!databaseUrl) {
  console.error('❌ Error: DATABASE_URL no está configurada');
  process.exit(1);
}

// Eliminar espacios en blanco al inicio y final
databaseUrl = databaseUrl.trim();

// Verificar que la URL comience con postgresql:// o postgres://
if (!databaseUrl.startsWith('postgresql://') && !databaseUrl.startsWith('postgres://')) {
  console.error('❌ Error: DATABASE_URL debe comenzar con postgresql:// o postgres://');
  console.error('   URL recibida:', databaseUrl.substring(0, 50) + '...');
  process.exit(1);
}

// Parsear la URL manualmente para asegurar que la contraseña se maneje correctamente
let poolConfig;

try {
  // Normalizar postgres:// a postgresql://
  if (databaseUrl.startsWith('postgres://')) {
    databaseUrl = databaseUrl.replace('postgres://', 'postgresql://');
  }
  
  const url = new URL(databaseUrl);
  
  // Extraer componentes de la URL
  const config = {
    user: decodeURIComponent(url.username || ''),
    password: decodeURIComponent(url.password || ''),
    host: url.hostname,
    port: parseInt(url.port) || 5432,
    database: url.pathname.slice(1).replace(/\/$/, ''), // Remover el '/' inicial y final
    ssl: isRemoteConnection ? { rejectUnauthorized: false } : false
  };
  
  // Asegurar que la contraseña sea un string válido
  if (!config.password || typeof config.password !== 'string') {
    throw new Error('La contraseña no es válida');
  }
  
  poolConfig = config;
  
  // Solo mostrar información de conexión en desarrollo
  if (process.env.NODE_ENV !== 'production') {
    console.log('📡 Conectando a PostgreSQL:', `${config.user}@${config.host}:${config.port}/${config.database}`);
  }
} catch (error) {
  console.error('❌ Error parseando DATABASE_URL:', error.message);
  if (process.env.NODE_ENV !== 'production') {
    console.error('   URL (primeros 80 caracteres):', databaseUrl.substring(0, 80) + '...');
  }
  console.error('   Verifica que DATABASE_URL esté configurada correctamente en las variables de entorno');
  process.exit(1);
}

// Configuración de la conexión a PostgreSQL
const pool = new Pool(poolConfig);

// Eventos del pool
pool.on('connect', () => {
  if (process.env.NODE_ENV !== 'production') {
    console.log('✅ Conectado a PostgreSQL');
  }
});

pool.on('error', (err) => {
  console.error('❌ Error inesperado en la conexión a PostgreSQL:', err.message);
  if (process.env.NODE_ENV === 'production') {
    // En producción, no exponer detalles del error
    console.error('   Revisa la configuración de la base de datos');
  }
  process.exit(-1);
});

// Función helper para ejecutar queries
export const query = async (text, params) => {
  const start = Date.now();
  try {
    const res = await pool.query(text, params);
    const duration = Date.now() - start;
    
    // Solo loggear queries en desarrollo o si hay un error
    if (process.env.NODE_ENV !== 'production' && process.env.DEBUG_QUERIES === 'true') {
      console.log('Query ejecutado:', { text: text.substring(0, 100), duration, rows: res.rowCount });
    }
    
    return res;
  } catch (error) {
    // En producción, no exponer el texto completo del query por seguridad
    const errorInfo = process.env.NODE_ENV === 'production' 
      ? { error: error.message }
      : { text: text.substring(0, 200), error: error.message };
    console.error('Error en query:', errorInfo);
    throw error;
  }
};

// Función para obtener un cliente del pool (para transacciones)
export const getClient = async () => {
  const client = await pool.connect();
  const query = client.query.bind(client);
  const release = client.release.bind(client);
  
  // Monitorear errores del cliente (solo en desarrollo)
  const timeout = process.env.NODE_ENV !== 'production' 
    ? setTimeout(() => {
        console.warn('⚠️  Un cliente ha estado conectado por más de 5 segundos');
      }, 5000)
    : null;
  
  client.release = () => {
    if (timeout) clearTimeout(timeout);
    return release();
  };
  
  return client;
};

export default pool;

