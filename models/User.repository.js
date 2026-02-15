import { query } from '../database/connection.js';
import bcrypt from 'bcryptjs';

// Helper para mapear fila de DB a objeto User
const mapRowToUser = (row) => {
  if (!row) return null;
  
  return {
    id: row.id,
    _id: row.id, // Para compatibilidad con código existente
    email: row.email,
    role: row.role,
    nombre: row.nombre,
    apellido: row.apellido,
    cedula: row.cedula,
    numeroTelefono: row.numero_telefono,
    edad: row.edad,
    fechaInicioCurso: row.fecha_inicio_curso,
    estado: row.estado,
    progreso: row.progreso,
    curso: row.curso,
    ultimoAcceso: row.ultimo_acceso,
    createdAt: row.created_at,
    updatedAt: row.updated_at,
    nombreCompleto: `${row.nombre || ''} ${row.apellido || ''}`.trim(),
    // Métodos para compatibilidad
    comparePassword: async function(candidatePassword) {
      return await bcrypt.compare(candidatePassword, row.password);
    },
    updateLastAccess: async function() {
      await query(
        'UPDATE users SET ultimo_acceso = CURRENT_TIMESTAMP WHERE id = $1',
        [this.id]
      );
      this.ultimoAcceso = new Date();
    },
    getPromedioCalificaciones: async function() {
      const result = await query(
        `SELECT AVG(calificacion) as promedio 
         FROM calificaciones 
         WHERE user_id = $1`,
        [this.id]
      );
      return result.rows[0]?.promedio ? Math.round(parseFloat(result.rows[0].promedio)) : 0;
    }
  };
};

// Obtener usuario por email
export const findUserByEmail = async (email) => {
  const result = await query(
    'SELECT * FROM users WHERE LOWER(email) = LOWER($1)',
    [email]
  );
  if (result.rows.length === 0) return null;
  
  const user = mapRowToUser(result.rows[0]);
  // Agregar password para comparación (no se expone en mapRowToUser)
  user.password = result.rows[0].password;
  return user;
};

// Obtener usuario por ID
export const findUserById = async (id) => {
  const result = await query(
    'SELECT * FROM users WHERE id = $1',
    [id]
  );
  return result.rows.length > 0 ? mapRowToUser(result.rows[0]) : null;
};

// Obtener usuario por cédula
export const findUserByCedula = async (cedula) => {
  const result = await query(
    'SELECT * FROM users WHERE cedula = $1',
    [cedula]
  );
  return result.rows.length > 0 ? mapRowToUser(result.rows[0]) : null;
};

// Crear usuario
export const createUser = async (userData) => {
  const {
    email,
    password,
    role = 'alumno',
    nombre,
    apellido,
    cedula,
    numeroTelefono,
    edad,
    fechaInicioCurso,
    estado = 'Cursando',
    progreso = 0,
    curso = 'Piloto Privado'
  } = userData;

  // Hash de contraseña
  const salt = await bcrypt.genSalt(10);
  const hashedPassword = await bcrypt.hash(password, salt);

  const result = await query(
    `INSERT INTO users (
      email, password, role, nombre, apellido, cedula, 
      numero_telefono, edad, fecha_inicio_curso, estado, 
      progreso, curso
    ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12)
    RETURNING *`,
    [
      email.toLowerCase(),
      hashedPassword,
      role,
      nombre,
      apellido,
      cedula,
      numeroTelefono,
      edad,
      fechaInicioCurso || new Date(),
      estado,
      progreso,
      curso
    ]
  );

  return mapRowToUser(result.rows[0]);
};

// Actualizar usuario
export const updateUser = async (id, userData) => {
  const fields = [];
  const values = [];
  let paramCount = 1;

  const allowedFields = {
    nombre: 'nombre',
    apellido: 'apellido',
    cedula: 'cedula',
    numeroTelefono: 'numero_telefono',
    edad: 'edad',
    estado: 'estado',
    progreso: 'progreso',
    fechaInicioCurso: 'fecha_inicio_curso',
    curso: 'curso'
  };

  for (const [key, dbField] of Object.entries(allowedFields)) {
    if (userData[key] !== undefined) {
      fields.push(`${dbField} = $${paramCount}`);
      values.push(userData[key]);
      paramCount++;
    }
  }

  if (fields.length === 0) {
    return await findUserById(id);
  }

  values.push(id);
  const result = await query(
    `UPDATE users SET ${fields.join(', ')}, updated_at = CURRENT_TIMESTAMP
     WHERE id = $${paramCount}
     RETURNING *`,
    values
  );

  return result.rows.length > 0 ? mapRowToUser(result.rows[0]) : null;
};

// Eliminar usuario
export const deleteUser = async (id) => {
  const result = await query(
    'DELETE FROM users WHERE id = $1 RETURNING id',
    [id]
  );
  return result.rows.length > 0;
};

// Buscar usuarios con filtros
export const findUsers = async (filters = {}) => {
  const { role, estado, search } = filters;
  let sql = 'SELECT * FROM users WHERE 1=1';
  const params = [];
  let paramCount = 1;

  if (role) {
    sql += ` AND role = $${paramCount}`;
    params.push(role);
    paramCount++;
  }

  if (estado) {
    sql += ` AND estado = $${paramCount}`;
    params.push(estado);
    paramCount++;
  }

  if (search) {
    sql += ` AND (
      nombre ILIKE $${paramCount} OR 
      apellido ILIKE $${paramCount} OR 
      email ILIKE $${paramCount} OR 
      cedula ILIKE $${paramCount}
    )`;
    params.push(`%${search}%`);
    paramCount++;
  }

  sql += ' ORDER BY created_at DESC';

  const result = await query(sql, params);
  return result.rows.map(mapRowToUser);
};

// Contar usuarios
export const countUsers = async (filters = {}) => {
  const { role, estado } = filters;
  let sql = 'SELECT COUNT(*) as count FROM users WHERE 1=1';
  const params = [];
  let paramCount = 1;

  if (role) {
    sql += ` AND role = $${paramCount}`;
    params.push(role);
    paramCount++;
  }

  if (estado) {
    sql += ` AND estado = $${paramCount}`;
    params.push(estado);
    paramCount++;
  }

  const result = await query(sql, params);
  return parseInt(result.rows[0].count);
};

// Obtener calificaciones de un usuario
export const getUserCalificaciones = async (userId) => {
  const result = await query(
    'SELECT * FROM calificaciones WHERE user_id = $1 ORDER BY fecha DESC',
    [userId]
  );
  return result.rows.map(row => ({
    id: row.id,
    tipo: row.tipo,
    calificacion: row.calificacion,
    fecha: row.fecha,
    observaciones: row.observaciones
  }));
};

// Agregar calificación a un usuario
export const addCalificacion = async (userId, calificacionData) => {
  const { tipo, calificacion, observaciones } = calificacionData;
  const result = await query(
    `INSERT INTO calificaciones (user_id, tipo, calificacion, observaciones)
     VALUES ($1, $2, $3, $4)
     RETURNING *`,
    [userId, tipo, calificacion, observaciones]
  );
  return result.rows[0];
};

