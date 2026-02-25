import { query } from '../database/connection.js';

// Helper para mapear fila de DB a objeto ClaseOnline
const mapRowToClaseOnline = async (row) => {
  if (!row) return null;

  // Obtener información del instructor
  const instructorResult = await query(
    'SELECT id, nombre, apellido, email FROM users WHERE id = $1',
    [row.instructor_id]
  );

  const instructor = instructorResult.rows[0] ? {
    id: instructorResult.rows[0].id,
    nombre: instructorResult.rows[0].nombre,
    apellido: instructorResult.rows[0].apellido,
    email: instructorResult.rows[0].email
  } : null;

  // Obtener alumnos de la clase
  const alumnosResult = await query(
    `SELECT u.id, u.nombre, u.apellido, u.email, u.cedula, coa.fecha_registro
     FROM clases_online_alumnos coa
     JOIN users u ON coa.alumno_id = u.id
     WHERE coa.clase_online_id = $1
     ORDER BY coa.fecha_registro`,
    [row.id]
  );

  const alumnos = alumnosResult.rows.map(a => ({
    id: a.id,
    nombre: a.nombre,
    apellido: a.apellido,
    email: a.email,
    cedula: a.cedula,
    fechaRegistro: a.fecha_registro
  }));

  return {
    id: row.id,
    link: row.link,
    linkGrabacion: row.link_grabacion,
    fechaHoraInicio: row.fecha_hora_inicio,
    fechaHoraFin: row.fecha_hora_fin,
    estado: row.estado,
    instructor: instructor,
    instructorId: row.instructor_id,
    alumnos: alumnos,
    createdAt: row.created_at,
    updatedAt: row.updated_at
  };
};

// Obtener clase online por ID
export const findClaseOnlineById = async (id) => {
  const result = await query(
    'SELECT * FROM clases_online WHERE id = $1',
    [id]
  );
  if (result.rows.length === 0) return null;
  return await mapRowToClaseOnline(result.rows[0]);
};

// Buscar clases online con filtros
export const findClasesOnline = async (filters = {}) => {
  const { estado, instructorId, alumnoId, fechaDesde, fechaHasta } = filters;
  let sql = 'SELECT DISTINCT co.* FROM clases_online co';
  const params = [];
  let paramCount = 1;

  // Si se filtra por alumno, necesitamos hacer JOIN con la tabla de alumnos
  if (alumnoId) {
    sql += ' INNER JOIN clases_online_alumnos coa ON co.id = coa.clase_online_id';
    sql += ` WHERE coa.alumno_id = $${paramCount}`;
    params.push(alumnoId);
    paramCount++;
  } else {
    sql += ' WHERE 1=1';
  }

  if (estado) {
    sql += ` AND co.estado = $${paramCount}`;
    params.push(estado);
    paramCount++;
  }

  if (instructorId) {
    sql += ` AND co.instructor_id = $${paramCount}`;
    params.push(instructorId);
    paramCount++;
  }

  if (fechaDesde) {
    sql += ` AND co.fecha_hora_inicio >= $${paramCount}`;
    params.push(fechaDesde);
    paramCount++;
  }

  if (fechaHasta) {
    sql += ` AND co.fecha_hora_inicio <= $${paramCount}`;
    params.push(fechaHasta);
    paramCount++;
  }

  sql += ' ORDER BY co.fecha_hora_inicio DESC';

  const result = await query(sql, params);
  
  // Mapear todas las clases
  const clases = [];
  for (const row of result.rows) {
    clases.push(await mapRowToClaseOnline(row));
  }
  
  return clases;
};

// Crear clase online
export const createClaseOnline = async (claseData) => {
  const {
    link,
    linkGrabacion,
    fechaHoraInicio,
    fechaHoraFin,
    estado = 'Pendiente',
    instructorId
  } = claseData;

  // Insertar clase online
  const result = await query(
    `INSERT INTO clases_online (
      link, link_grabacion, fecha_hora_inicio, fecha_hora_fin, estado, instructor_id
    ) VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING *`,
    [
      link,
      linkGrabacion || null,
      fechaHoraInicio || new Date(),
      fechaHoraFin || null,
      estado,
      instructorId
    ]
  );

  return await findClaseOnlineById(result.rows[0].id);
};

// Actualizar clase online
export const updateClaseOnline = async (id, claseData) => {
  const fields = [];
  const values = [];
  let paramCount = 1;

  const allowedFields = {
    link: 'link',
    linkGrabacion: 'link_grabacion',
    fechaHoraInicio: 'fecha_hora_inicio',
    fechaHoraFin: 'fecha_hora_fin',
    estado: 'estado',
    instructorId: 'instructor_id'
  };

  for (const [key, dbField] of Object.entries(allowedFields)) {
    if (claseData[key] !== undefined) {
      fields.push(`${dbField} = $${paramCount}`);
      values.push(claseData[key]);
      paramCount++;
    }
  }

  if (fields.length > 0) {
    values.push(id);
    await query(
      `UPDATE clases_online SET ${fields.join(', ')}, updated_at = CURRENT_TIMESTAMP
       WHERE id = $${paramCount}`,
      values
    );
  }

  return await findClaseOnlineById(id);
};

// Eliminar clase online
export const deleteClaseOnline = async (id) => {
  const result = await query(
    'DELETE FROM clases_online WHERE id = $1 RETURNING id',
    [id]
  );
  return result.rows.length > 0;
};

// Registrar alumno en clase online
export const registrarAlumnoEnClase = async (claseOnlineId, alumnoId) => {
  // Verificar si el alumno ya está registrado
  const existingResult = await query(
    'SELECT id FROM clases_online_alumnos WHERE clase_online_id = $1 AND alumno_id = $2',
    [claseOnlineId, alumnoId]
  );

  if (existingResult.rows.length > 0) {
    // Ya está registrado, retornar la información existente
    return await findClaseOnlineById(claseOnlineId);
  }

  // Registrar al alumno
  await query(
    `INSERT INTO clases_online_alumnos (clase_online_id, alumno_id)
     VALUES ($1, $2)
     ON CONFLICT (clase_online_id, alumno_id) DO NOTHING`,
    [claseOnlineId, alumnoId]
  );

  return await findClaseOnlineById(claseOnlineId);
};

// Eliminar alumno de clase online
export const eliminarAlumnoDeClase = async (claseOnlineId, alumnoId) => {
  await query(
    'DELETE FROM clases_online_alumnos WHERE clase_online_id = $1 AND alumno_id = $2',
    [claseOnlineId, alumnoId]
  );
  return await findClaseOnlineById(claseOnlineId);
};

// Verificar si un alumno está registrado en una clase
export const isAlumnoRegistrado = async (claseOnlineId, alumnoId) => {
  const result = await query(
    'SELECT id FROM clases_online_alumnos WHERE clase_online_id = $1 AND alumno_id = $2',
    [claseOnlineId, alumnoId]
  );
  return result.rows.length > 0;
};

