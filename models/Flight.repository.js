import { query } from '../database/connection.js';

// Helper para mapear fila de DB a objeto Flight
const mapRowToFlight = async (row) => {
  if (!row) return null;

  // Obtener maniobras del vuelo
  const maniobrasResult = await query(
    'SELECT * FROM maniobras WHERE flight_id = $1 ORDER BY created_at',
    [row.id]
  );

  // Obtener información del alumno
  const alumnoResult = await query(
    'SELECT id, nombre, apellido, email, cedula FROM users WHERE id = $1',
    [row.alumno_id]
  );

  const alumno = alumnoResult.rows[0] ? {
    id: alumnoResult.rows[0].id,
    _id: alumnoResult.rows[0].id,
    nombre: alumnoResult.rows[0].nombre,
    apellido: alumnoResult.rows[0].apellido,
    email: alumnoResult.rows[0].email,
    cedula: alumnoResult.rows[0].cedula
  } : null;

  return {
    id: row.id,
    _id: row.id, // Para compatibilidad
    alumno: alumno,
    alumnoId: row.alumno_id,
    fecha: row.fecha,
    duracion: row.duracion,
    calificacion: row.calificacion,
    maniobras: maniobrasResult.rows.map(m => ({
      id: m.id,
      nombre: m.nombre,
      calificacion: m.calificacion ? String(m.calificacion) : null, // Asegurar que sea string
      observaciones: m.observaciones,
      completada: m.completada
    })),
    tipoVuelo: row.tipo_vuelo,
    aeronave: {
      tipo: row.aeronave_tipo,
      matricula: row.aeronave_matricula
    },
    instructor: {
      nombre: row.instructor_nombre,
      licencia: row.instructor_licencia
    },
    observaciones: row.observaciones,
    horasVuelo: {
      tipo: row.horas_vuelo_tipo,
      cantidad: row.horas_vuelo_cantidad ? parseFloat(row.horas_vuelo_cantidad) : 0
    },
    estado: row.estado,
    createdAt: row.created_at,
    updatedAt: row.updated_at
  };
};

// Obtener vuelo por ID
export const findFlightById = async (id) => {
  const result = await query(
    'SELECT * FROM flights WHERE id = $1',
    [id]
  );
  if (result.rows.length === 0) return null;
  return await mapRowToFlight(result.rows[0]);
};

// Buscar vuelos con filtros
export const findFlights = async (filters = {}) => {
  const { alumnoId, fechaDesde, fechaHasta, tipoVuelo } = filters;
  let sql = 'SELECT * FROM flights WHERE 1=1';
  const params = [];
  let paramCount = 1;

  if (alumnoId) {
    sql += ` AND alumno_id = $${paramCount}`;
    params.push(alumnoId);
    paramCount++;
  }

  if (fechaDesde) {
    sql += ` AND fecha >= $${paramCount}`;
    params.push(fechaDesde);
    paramCount++;
  }

  if (fechaHasta) {
    sql += ` AND fecha <= $${paramCount}`;
    params.push(fechaHasta);
    paramCount++;
  }

  if (tipoVuelo) {
    sql += ` AND tipo_vuelo = $${paramCount}`;
    params.push(tipoVuelo);
    paramCount++;
  }

  sql += ' ORDER BY fecha DESC';

  const result = await query(sql, params);
  
  // Mapear todos los vuelos
  const flights = [];
  for (const row of result.rows) {
    flights.push(await mapRowToFlight(row));
  }
  
  return flights;
};

// Crear vuelo
export const createFlight = async (flightData) => {
  const {
    alumnoId,
    fecha,
    duracion,
    calificacion,
    maniobras = [],
    tipoVuelo = 'Dual',
    tipo,
    matricula,
    modelo,
    aerod,
    inspectorDinacia,
    aeronave = {},
    instructor = {},
    observaciones,
    horasVuelo = {},
    estado = 'Completado'
  } = flightData;

  // Insertar vuelo
  const flightResult = await query(
    `INSERT INTO flights (
      alumno_id, fecha, duracion, calificacion, tipo_vuelo, tipo,
      matricula, modelo, aerod, inspector_dinacia,
      aeronave_tipo, aeronave_matricula,
      instructor_nombre, instructor_licencia, instructor,
      observaciones,
      horas_vuelo_tipo, horas_vuelo_cantidad,
      estado
    ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19)
    RETURNING *`,
    [
      alumnoId,
      fecha || new Date(),
      duracion,
      calificacion,
      tipoVuelo,
      tipo,
      matricula || aeronave.matricula || null,
      modelo || null,
      aerod || null,
      inspectorDinacia || null,
      aeronave.tipo || null,
      aeronave.matricula || matricula || null,
      instructor.nombre || null,
      instructor.licencia || null,
      instructor.nombre || null, // Campo instructor (VARCHAR) - puede ser diferente de instructor_nombre
      observaciones || null,
      horasVuelo.tipo || 'Dual',
      horasVuelo.cantidad || 0,
      estado
    ]
  );

  const flightId = flightResult.rows[0].id;

  // Insertar maniobras
  if (maniobras.length > 0) {
      for (const maniobra of maniobras) {
        await query(
          `INSERT INTO maniobras (flight_id, nombre, calificacion, observaciones, completada)
           VALUES ($1, $2, $3, $4, $5)`,
          [
            flightId,
            maniobra.nombre,
            maniobra.calificacion ? String(maniobra.calificacion) : null, // Convertir a string
            maniobra.observaciones || null,
            maniobra.completada !== undefined ? maniobra.completada : true
          ]
        );
      }
  }

  return await findFlightById(flightId);
};

// Actualizar vuelo
export const updateFlight = async (id, flightData) => {
  const fields = [];
  const values = [];
  let paramCount = 1;

  const allowedFields = {
    fecha: 'fecha',
    duracion: 'duracion',
    calificacion: 'calificacion',
    tipoVuelo: 'tipo_vuelo',
    tipo: 'tipo',
    matricula: 'matricula',
    modelo: 'modelo',
    aerod: 'aerod',
    inspectorDinacia: 'inspector_dinacia',
    observaciones: 'observaciones',
    estado: 'estado'
  };

  // Campos de aeronave
  if (flightData.aeronave) {
    if (flightData.aeronave.tipo !== undefined) {
      fields.push(`aeronave_tipo = $${paramCount}`);
      values.push(flightData.aeronave.tipo);
      paramCount++;
    }
    if (flightData.aeronave.matricula !== undefined) {
      fields.push(`aeronave_matricula = $${paramCount}`);
      values.push(flightData.aeronave.matricula);
      paramCount++;
    }
  }

  // Campos de instructor
  if (flightData.instructor) {
    if (flightData.instructor.nombre !== undefined) {
      fields.push(`instructor_nombre = $${paramCount}`);
      values.push(flightData.instructor.nombre);
      paramCount++;
      // Campo instructor (VARCHAR) - mismo valor que instructor_nombre
      fields.push(`instructor = $${paramCount}`);
      values.push(flightData.instructor.nombre);
      paramCount++;
    }
    if (flightData.instructor.licencia !== undefined) {
      fields.push(`instructor_licencia = $${paramCount}`);
      values.push(flightData.instructor.licencia);
      paramCount++;
    }
  }
  
  // Campos nuevos de vuelo (si vienen directamente, no en objetos anidados)
  if (flightData.tipo !== undefined) {
    fields.push(`tipo = $${paramCount}`);
    values.push(flightData.tipo);
    paramCount++;
  }
  if (flightData.matricula !== undefined) {
    fields.push(`matricula = $${paramCount}`);
    values.push(flightData.matricula);
    paramCount++;
  }
  if (flightData.modelo !== undefined) {
    fields.push(`modelo = $${paramCount}`);
    values.push(flightData.modelo);
    paramCount++;
  }
  if (flightData.aerod !== undefined) {
    fields.push(`aerod = $${paramCount}`);
    values.push(flightData.aerod);
    paramCount++;
  }
  if (flightData.inspectorDinacia !== undefined) {
    fields.push(`inspector_dinacia = $${paramCount}`);
    values.push(flightData.inspectorDinacia);
    paramCount++;
  }

  // Campos de horas de vuelo
  if (flightData.horasVuelo) {
    if (flightData.horasVuelo.tipo !== undefined) {
      fields.push(`horas_vuelo_tipo = $${paramCount}`);
      values.push(flightData.horasVuelo.tipo);
      paramCount++;
    }
    if (flightData.horasVuelo.cantidad !== undefined) {
      fields.push(`horas_vuelo_cantidad = $${paramCount}`);
      values.push(flightData.horasVuelo.cantidad);
      paramCount++;
    }
  }

  // Campos simples
  for (const [key, dbField] of Object.entries(allowedFields)) {
    if (flightData[key] !== undefined) {
      fields.push(`${dbField} = $${paramCount}`);
      values.push(flightData[key]);
      paramCount++;
    }
  }

  if (fields.length > 0) {
    values.push(id);
    await query(
      `UPDATE flights SET ${fields.join(', ')}, updated_at = CURRENT_TIMESTAMP
       WHERE id = $${paramCount}`,
      values
    );
  }

  // Actualizar maniobras si se proporcionan
  if (flightData.maniobras !== undefined) {
    // Eliminar maniobras existentes
    await query('DELETE FROM maniobras WHERE flight_id = $1', [id]);
    
    // Insertar nuevas maniobras
    if (flightData.maniobras.length > 0) {
      for (const maniobra of flightData.maniobras) {
        await query(
          `INSERT INTO maniobras (flight_id, nombre, calificacion, observaciones, completada)
           VALUES ($1, $2, $3, $4, $5)`,
          [
            id,
            maniobra.nombre,
            maniobra.calificacion ? String(maniobra.calificacion) : null, // Convertir a string
            maniobra.observaciones || null,
            maniobra.completada !== undefined ? maniobra.completada : true
          ]
        );
      }
    }
  }

  return await findFlightById(id);
};

// Eliminar vuelo
export const deleteFlight = async (id) => {
  const result = await query(
    'DELETE FROM flights WHERE id = $1 RETURNING id',
    [id]
  );
  return result.rows.length > 0;
};

// Contar vuelos
export const countFlights = async (filters = {}) => {
  const { estado } = filters;
  let sql = 'SELECT COUNT(*) as count FROM flights WHERE 1=1';
  const params = [];
  let paramCount = 1;

  if (estado) {
    sql += ` AND estado = $${paramCount}`;
    params.push(estado);
    paramCount++;
  }

  const result = await query(sql, params);
  return parseInt(result.rows[0].count);
};

// Obtener estadísticas de vuelos
export const getFlightStats = async () => {
  const totalResult = await query('SELECT COUNT(*) as count FROM flights');
  const completadosResult = await query("SELECT COUNT(*) as count FROM flights WHERE estado = 'Completado'");
  const horasResult = await query('SELECT SUM(duracion) as total FROM flights');
  const promedioResult = await query('SELECT AVG(calificacion) as promedio FROM flights');

  return {
    totalFlights: parseInt(totalResult.rows[0].count),
    flightsCompletados: parseInt(completadosResult.rows[0].count),
    totalHoras: parseInt(horasResult.rows[0].total || 0),
    promedioCalificacion: promedioResult.rows[0].promedio 
      ? Math.round(parseFloat(promedioResult.rows[0].promedio))
      : 0
  };
};

