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
    telefono: row.telefono,
    celular: row.celular,
    edad: row.edad,
    fechaNac: row.fecha_nac,
    direccion: row.direccion,
    departamento: row.departamento,
    ciudad: row.ciudad,
    sexo: row.sexo,
    contactoEmergencia: row.contacto_emergencia,
    nombreEmergencia: row.nombre_emergencia,
    emergenciaMedica: row.emergencia_medica,
    fechaInicioCurso: row.fecha_inicio_curso,
    estado: row.estado,
    progreso: row.progreso,
    curso: row.curso,
    ultimoAcceso: row.ultimo_acceso,
    entrenamientoPrevioId: row.entrenamiento_previo_id,
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
      telefono,
      celular,
      fechaNac,
      direccion,
    departamento,
    ciudad,
    sexo,
    contactoEmergencia,
    nombreEmergencia,
    emergenciaMedica,
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
      numero_telefono, telefono, celular, fecha_nac,
      direccion, departamento, ciudad, sexo,
      contacto_emergencia, nombre_emergencia, emergencia_medica,
      fecha_inicio_curso, estado, progreso, curso
    ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21)
    RETURNING *`,
    [
      email.toLowerCase(),
      hashedPassword,
      role,
      nombre,
      apellido,
      cedula,
      numeroTelefono,
      telefono,
      celular,
      fechaNac,
      direccion,
      departamento,
      ciudad,
      sexo,
      contactoEmergencia,
      nombreEmergencia,
      emergenciaMedica,
      fechaInicioCurso || new Date(),
      estado,
      progreso,
      curso
    ]
  );

  const newUser = mapRowToUser(result.rows[0]);

  // Si el usuario es un alumno, crear entrenamiento previo si se proporciona
  if (role === 'alumno' && newUser.id && userData.entrenamientoPrevio) {
    try {
      const ep = userData.entrenamientoPrevio;
      const entrenamientoResult = await query(
        `INSERT INTO entrenamiento_previo (
          dual, nav_dual, solo, nav_solo, nocturno_solo, noct_solo, aterrizajes_noct,
          instruccion_teorica, instruccion_tierra, instruccion_vuelo,
          chequeo_fases_comp, ciac_instructor, carte_de_transferencia
        ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13) RETURNING id`,
        [
          ep.dual || null,
          ep.navDual || null,
          ep.solo || null,
          ep.navSolo || null,
          ep.nocturnoSolo || null,
          ep.noctSolo || null,
          ep.aterrizajesNoct || null,
          ep.instruccionTeorica || null,
          ep.instruccionTierra || null,
          ep.instruccionVuelo || null,
          ep.chequeoFasesComp || null,
          ep.ciacInstructor || null,
          ep.carteDeTransferencia || false
        ]
      );

      // Vincular entrenamiento previo al usuario
      await query(
        `UPDATE users SET entrenamiento_previo_id = $1 WHERE id = $2`,
        [entrenamientoResult.rows[0].id, newUser.id]
      );
    } catch (error) {
      console.error('Error al crear entrenamiento previo:', error);
    }
  }

  // Si el usuario es un alumno, crear inscripción automáticamente
  if (role === 'alumno' && newUser.id) {
    try {
      // Obtener la primera inscripción activa o crear una por defecto
      const inscripcionResult = await query(
        `SELECT id FROM inscripcion WHERE estado = 'Activa' ORDER BY created_at LIMIT 1`
      );

      let inscripcionId;
      if (inscripcionResult.rows.length > 0) {
        inscripcionId = inscripcionResult.rows[0].id;
      } else {
        // Crear una inscripción por defecto si no existe ninguna
        const nuevaInscripcion = await query(
          `INSERT INTO inscripcion (nombre, descripcion, estado) 
           VALUES ($1, $2, $3) RETURNING id`,
          ['Inscripción General', 'Inscripción por defecto para nuevos alumnos', 'Activa']
        );
        inscripcionId = nuevaInscripcion.rows[0].id;
      }

      // Crear inscripcion_user con datos proporcionados o valores por defecto
      const inscripcionData = userData.inscripcion || {};
      await query(
        `INSERT INTO inscripcion_user (
          user_id, inscripcion_id, fecha,
          certificado_medico, licencia_alumno,
          fecha_emitido_certificado_medico, vencimiento_certificado_medico,
          fecha_emitido_licencia_alumno, vencimiento_licencia_alumno,
          total_desde_inscripcion, hs_teorico, hs_vuelo_total,
          total_fase_teorica, total_fase_vuelo, otros
        ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)`,
        [
          newUser.id,
          inscripcionId,
          inscripcionData.fecha || fechaInicioCurso || new Date(),
          inscripcionData.certificadoMedico || null,
          inscripcionData.licenciaAlumno || null,
          inscripcionData.fechaEmitidoCertificadoMedico || null,
          inscripcionData.vencimientoCertificadoMedico || null,
          inscripcionData.fechaEmitidoLicenciaAlumno || null,
          inscripcionData.vencimientoLicenciaAlumno || null,
          inscripcionData.totalDesdeInscripcion || 0,
          inscripcionData.hsTeorico || 0,
          inscripcionData.hsVueloTotal || 0,
          inscripcionData.totalFaseTeorica || 0,
          inscripcionData.totalFaseVuelo || 0,
          inscripcionData.otros || null
        ]
      );
    } catch (error) {
      // Si falla la creación de inscripción, no fallar la creación del usuario
      console.error('Error al crear inscripción para el usuario:', error);
    }
  }

  return newUser;
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
    telefono: 'telefono',
    celular: 'celular',
    edad: 'edad',
    fechaNac: 'fecha_nac',
    direccion: 'direccion',
    departamento: 'departamento',
    ciudad: 'ciudad',
    sexo: 'sexo',
    contactoEmergencia: 'contacto_emergencia',
    nombreEmergencia: 'nombre_emergencia',
    emergenciaMedica: 'emergencia_medica',
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

/**
 * Obtener historial completo del alumno con todos sus datos relacionados
 * @param {string} userId - ID del usuario
 * @returns {Promise<Object>} Objeto con todos los datos del alumno
 */
export const getHistorialAlumno = async (userId) => {
  // 1. Obtener datos del usuario
  const userResult = await query(
    'SELECT * FROM users WHERE id = $1',
    [userId]
  );

  if (userResult.rows.length === 0) {
    return null;
  }

  const user = mapRowToUser(userResult.rows[0]);

  // 2. Obtener entrenamiento previo si existe
  let entrenamientoPrevio = null;
  if (user.entrenamientoPrevioId) {
    const entrenamientoResult = await query(
      'SELECT * FROM entrenamiento_previo WHERE id = $1',
      [user.entrenamientoPrevioId]
    );
    
    if (entrenamientoResult.rows.length > 0) {
      const ep = entrenamientoResult.rows[0];
      entrenamientoPrevio = {
        id: ep.id,
        dual: ep.dual !== null && ep.dual !== undefined ? parseFloat(ep.dual) : null,
        navDual: ep.nav_dual !== null && ep.nav_dual !== undefined ? parseFloat(ep.nav_dual) : null,
        solo: ep.solo !== null && ep.solo !== undefined ? parseFloat(ep.solo) : null,
        navSolo: ep.nav_solo !== null && ep.nav_solo !== undefined ? parseFloat(ep.nav_solo) : null,
        nocturnoSolo: ep.nocturno_solo !== null && ep.nocturno_solo !== undefined ? parseFloat(ep.nocturno_solo) : null,
        noctSolo: ep.noct_solo !== null && ep.noct_solo !== undefined ? parseFloat(ep.noct_solo) : null,
        aterrizajesNoct: ep.aterrizajes_noct !== null && ep.aterrizajes_noct !== undefined ? parseFloat(ep.aterrizajes_noct) : null,
        instruccionTeorica: ep.instruccion_teorica !== null && ep.instruccion_teorica !== undefined ? parseFloat(ep.instruccion_teorica) : null,
        instruccionTierra: ep.instruccion_tierra !== null && ep.instruccion_tierra !== undefined ? parseFloat(ep.instruccion_tierra) : null,
        instruccionVuelo: ep.instruccion_vuelo !== null && ep.instruccion_vuelo !== undefined ? parseFloat(ep.instruccion_vuelo) : null,
        chequeoFasesComp: ep.chequeo_fases_comp,
        ciacInstructor: ep.ciac_instructor,
        carteDeTransferencia: ep.carte_de_transferencia !== null && ep.carte_de_transferencia !== undefined ? ep.carte_de_transferencia : null,
        createdAt: ep.created_at,
        updatedAt: ep.updated_at
      };
    }
  }

  // 3. Obtener inscripciones del usuario
  const inscripcionesResult = await query(
    `SELECT 
      iu.*,
      i.nombre as inscripcion_nombre,
      i.descripcion as inscripcion_descripcion,
      i.fecha_inicio as inscripcion_fecha_inicio,
      i.fecha_fin as inscripcion_fecha_fin,
      i.estado as inscripcion_estado
    FROM inscripcion_user iu
    LEFT JOIN inscripcion i ON i.id = iu.inscripcion_id
    WHERE iu.user_id = $1
    ORDER BY iu.fecha DESC`,
    [userId]
  );

  const inscripciones = inscripcionesResult.rows.map(row => ({
    id: row.id,
    fecha: row.fecha,
    certificadoMedico: row.certificado_medico,
    licenciaAlumno: row.licencia_alumno,
    fechaEmitidoCertificadoMedico: row.fecha_emitido_certificado_medico,
    vencimientoCertificadoMedico: row.vencimiento_certificado_medico,
    fechaEmitidoLicenciaAlumno: row.fecha_emitido_licencia_alumno,
    vencimientoLicenciaAlumno: row.vencimiento_licencia_alumno,
    totalDesdeInscripcion: parseFloat(row.total_desde_inscripcion) || 0,
    hsTeorico: parseFloat(row.hs_teorico) || 0,
    hsVueloTotal: parseFloat(row.hs_vuelo_total) || 0,
    totalFaseTeorica: parseFloat(row.total_fase_teorica) || 0,
    totalFaseVuelo: parseFloat(row.total_fase_vuelo) || 0,
    otros: row.otros,
    inscripcion: {
      id: row.inscripcion_id,
      nombre: row.inscripcion_nombre,
      descripcion: row.inscripcion_descripcion,
      fechaInicio: row.inscripcion_fecha_inicio,
      fechaFin: row.inscripcion_fecha_fin,
      estado: row.inscripcion_estado
    },
    createdAt: row.created_at,
    updatedAt: row.updated_at
  }));

  // 4. Obtener vuelos con maniobras
  const vuelosResult = await query(
    `SELECT 
      f.*,
      COALESCE(
        json_agg(
          json_build_object(
            'id', m.id,
            'nombre', m.nombre,
            'calificacion', m.calificacion,
            'observaciones', m.observaciones,
            'completada', m.completada,
            'createdAt', m.created_at
          )
        ) FILTER (WHERE m.id IS NOT NULL),
        '[]'::json
      ) as maniobras
    FROM flights f
    LEFT JOIN maniobras m ON m.flight_id = f.id
    WHERE f.alumno_id = $1
    GROUP BY f.id
    ORDER BY f.fecha DESC`,
    [userId]
  );

  const vuelos = vuelosResult.rows.map(row => ({
    id: row.id,
    fecha: row.fecha,
    duracion: row.duracion,
    calificacion: row.calificacion !== null && row.calificacion !== undefined ? parseFloat(row.calificacion) : null,
    tipoVuelo: row.tipo_vuelo,
    tipo: row.tipo,
    matricula: row.matricula,
    modelo: row.modelo,
    aerod: row.aerod,
    inspectorDinacia: row.inspector_dinacia,
    aeronave: {
      tipo: row.aeronave_tipo,
      matricula: row.aeronave_matricula || row.matricula
    },
    instructor: {
      nombre: row.instructor_nombre,
      licencia: row.instructor_licencia
    },
    observaciones: row.observaciones,
    horasVuelo: {
      tipo: row.horas_vuelo_tipo,
      cantidad: parseFloat(row.horas_vuelo_cantidad) || 0
    },
    estado: row.estado,
    maniobras: Array.isArray(row.maniobras) ? row.maniobras : [],
    createdAt: row.created_at,
    updatedAt: row.updated_at
  }));

  // 5. Obtener calificaciones
  const calificaciones = await getUserCalificaciones(userId);

  // 6. Obtener exámenes
  const examenesResult = await query(
    `SELECT 
      e.*,
      COUNT(DISTINCT ep.pregunta_id) as total_preguntas,
      COUNT(DISTINCT CASE WHEN ep.respondida = true THEN ep.pregunta_id END) as preguntas_respondidas
    FROM examen e
    LEFT JOIN examen_pregunta ep ON ep.examen_id = e.id
    WHERE e.usuario_id = $1
    GROUP BY e.id
    ORDER BY e.fecha_creacion DESC`,
    [userId]
  );

  const examenes = examenesResult.rows.map(row => ({
    id: row.id,
    nombre: row.nombre,
    capitulo: row.capitulo,
    fechaCreacion: row.fecha_creacion,
    fechaFinalizacion: row.fecha_finalizacion,
    puntaje: row.puntaje ? parseFloat(row.puntaje) : null,
    estado: row.estado,
    tiempoLimite: row.tiempo_limite,
    totalPreguntas: parseInt(row.total_preguntas) || 0,
    preguntasRespondidas: parseInt(row.preguntas_respondidas) || 0
  }));

  // 7. Calcular estadísticas
  const totalHorasVuelo = vuelos.reduce((sum, v) => sum + (v.horasVuelo.cantidad || 0), 0);
  const promedioCalificaciones = calificaciones.length > 0
    ? calificaciones.reduce((sum, c) => sum + c.calificacion, 0) / calificaciones.length
    : 0;
  const promedioExamenes = examenes.filter(e => e.puntaje !== null).length > 0
    ? examenes.filter(e => e.puntaje !== null).reduce((sum, e) => sum + e.puntaje, 0) / examenes.filter(e => e.puntaje !== null).length
    : null;

  return {
    usuario: user,
    entrenamientoPrevio,
    inscripciones,
    vuelos,
    calificaciones,
    examenes,
    estadisticas: {
      totalVuelos: vuelos.length,
      totalHorasVuelo: Math.round(totalHorasVuelo * 100) / 100,
      totalCalificaciones: calificaciones.length,
      promedioCalificaciones: Math.round(promedioCalificaciones * 100) / 100,
      totalExamenes: examenes.length,
      examenesCompletados: examenes.filter(e => e.estado === 'COMPLETADO').length,
      promedioExamenes: promedioExamenes ? Math.round(promedioExamenes * 100) / 100 : null,
      totalInscripciones: inscripciones.length
    }
  };
};

