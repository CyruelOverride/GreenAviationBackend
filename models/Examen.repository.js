import { query, getClient } from '../database/connection.js';

const mapRowToExamen = (row) => {
  if (!row) return null;

  return {
    id: row.id,
    usuarioId: row.usuario_id,
    nombre: row.nombre,
    capitulo: row.capitulo,
    capituloId: row.capitulo_id != null ? row.capitulo_id : null,
    numeroCurso:
      row.numero_curso != null && row.numero_curso !== undefined
        ? row.numero_curso
        : null,
    maxPreguntas:
      row.max_preguntas != null ? parseInt(row.max_preguntas, 10) : null,
    fechaCreacion: row.fecha_creacion,
    fechaFinalizacion: row.fecha_finalizacion,
    puntaje: row.puntaje ? parseFloat(row.puntaje) : null,
    estado: row.estado,
    tiempoLimite: row.tiempo_limite
  };
};

const mapRowToHabilitacion = (row) => ({
  capituloId: row.id,
  nombre: row.nombre,
  numeroCurso: row.numero_curso != null ? row.numero_curso : null,
  capitulo: row.numero_curso != null ? String(row.numero_curso) : null,
  habilitado: row.habilitado === true,
  maxPreguntas: parseInt(row.max_preguntas, 10),
  instancias: row.instancias != null ? parseInt(row.instancias, 10) : 1,
  intentosUsados: row.intentos_usados != null ? parseInt(row.intentos_usados, 10) : 0,
  ultimoExamenCompletadoId:
    row.ultimo_examen_completado_id != null ? parseInt(row.ultimo_examen_completado_id, 10) : null,
  updatedAt: row.habilitacion_updated_at
});

export const getHabilitacionesCapitulos = async (usuarioId = null) => {
  if (usuarioId != null) {
    const result = await query(
      `SELECT
         c.id,
         c.nombre,
         c.numero_curso,
         c.habilitado,
         c.max_preguntas,
         c.instancias,
         c.habilitacion_updated_at,
         COUNT(e.id) FILTER (WHERE e.estado = 'COMPLETADO') AS intentos_usados,
         MAX(e.id) FILTER (WHERE e.estado = 'COMPLETADO')   AS ultimo_examen_completado_id
       FROM capitulo c
       LEFT JOIN examen e ON e.capitulo_id = c.id AND e.usuario_id = $1
       GROUP BY c.id
       ORDER BY c.orden ASC, c.id ASC`,
      [usuarioId]
    );
    return result.rows.map((row) => mapRowToHabilitacion(row));
  }

  const result = await query(
    `SELECT id, nombre, numero_curso, habilitado, max_preguntas, instancias, habilitacion_updated_at
     FROM capitulo
     ORDER BY orden ASC, id ASC`
  );
  return result.rows.map((row) => mapRowToHabilitacion(row));
};

export const updateHabilitacionCapitulo = async (capituloId, habilitado) => {
  const result = await query(
    `UPDATE capitulo
     SET habilitado = $2, habilitacion_updated_at = CURRENT_TIMESTAMP, updated_at = CURRENT_TIMESTAMP
     WHERE id = $1
     RETURNING id, nombre, numero_curso, habilitado, max_preguntas, habilitacion_updated_at`,
    [capituloId, habilitado]
  );

  if (result.rows.length === 0) return null;
  return mapRowToHabilitacion(result.rows[0]);
};

/**
 * @param {Object} examenData
 * @param {number} examenData.usuarioId
 * @param {number} examenData.capituloId
 * @param {string} [examenData.nombre]
 * @param {number} [examenData.numPreguntas] — opcional; se limita a capitulo.max_preguntas
 * @param {number} [examenData.tiempoLimite]
 * @param {boolean} [examenData.esAdmin=false]
 */
export const createExamenAleatorio = async (examenData) => {
  const client = await getClient();

  try {
    await client.query('BEGIN');

    const {
      usuarioId,
      capituloId,
      nombre,
      numPreguntas: numPreguntasPedidas,
      tiempoLimite,
      esAdmin = false
    } = examenData;

    const capResult = await client.query(
      `SELECT id, nombre, habilitado, max_preguntas, instancias, numero_curso
       FROM capitulo WHERE id = $1`,
      [capituloId]
    );

    if (capResult.rows.length === 0) {
      throw new Error('CAPITULO_NO_ENCONTRADO');
    }

    const cap = capResult.rows[0];
    const maxP = parseInt(cap.max_preguntas, 10) || 15;

    if (!esAdmin && cap.habilitado !== true) {
      throw new Error(`EXAMEN_CAPITULO_BLOQUEADO:${capituloId}`);
    }

    if (!esAdmin) {
      const instancias = cap.instancias != null ? parseInt(cap.instancias, 10) : 1;
      const intentosResult = await client.query(
        `SELECT COUNT(*)::INTEGER AS intentos_usados
         FROM examen
         WHERE usuario_id = $1 AND capitulo_id = $2 AND estado = 'COMPLETADO'`,
        [usuarioId, capituloId]
      );
      const intentosUsados = intentosResult.rows[0].intentos_usados ?? 0;
      if (intentosUsados >= instancias) {
        throw new Error('LIMITE_INSTANCIAS_ALCANZADO');
      }
    }

    let pedidas =
      numPreguntasPedidas != null && numPreguntasPedidas !== ''
        ? parseInt(numPreguntasPedidas, 10)
        : maxP;
    if (Number.isNaN(pedidas) || pedidas < 1) pedidas = maxP;
    const limit = Math.min(pedidas, maxP);

    const nombreFinal = nombre?.trim() || cap.nombre;

    const examenResult = await client.query(
      `INSERT INTO examen (usuario_id, nombre, capitulo, capitulo_id, estado, tiempo_limite)
       VALUES ($1, $2, $3, $4, 'PENDIENTE', $5)
       RETURNING *`,
      [usuarioId, nombreFinal, cap.nombre, capituloId, tiempoLimite || null]
    );

    const examen = mapRowToExamen(examenResult.rows[0]);
    const examenId = examen.id;

    const preguntasResult = await client.query(
      `SELECT id
       FROM pregunta
       WHERE capitulo_id = $1 AND activa = true
       ORDER BY RANDOM()
       LIMIT $2`,
      [capituloId, limit]
    );

    if (preguntasResult.rows.length === 0) {
      throw new Error(`No hay preguntas activas disponibles para este capítulo`);
    }

    for (const preguntaRow of preguntasResult.rows) {
      await client.query(
        `INSERT INTO examen_pregunta (examen_id, pregunta_id, respondida)
         VALUES ($1, $2, false)`,
        [examenId, preguntaRow.id]
      );
    }

    await client.query('COMMIT');

    return await getExamenById(examenId);
  } catch (error) {
    await client.query('ROLLBACK');
    throw error;
  } finally {
    client.release();
  }
};

export const getExamenById = async (examenId) => {
  const examenResult = await query(
    `SELECT e.*, c.numero_curso, c.max_preguntas
     FROM examen e
     JOIN capitulo c ON c.id = e.capitulo_id
     WHERE e.id = $1`,
    [examenId]
  );

  if (examenResult.rows.length === 0) {
    return null;
  }

  const examen = mapRowToExamen(examenResult.rows[0]);

  const preguntasResult = await query(
    `WITH preguntas_mezcladas AS (
      SELECT 
        p.id AS pregunta_id,
        p.enunciado,
        ep.opcion_seleccionada_id,
        ep.respondida,
        RANDOM() as pregunta_order
      FROM examen_pregunta ep
      JOIN pregunta p ON p.id = ep.pregunta_id
      WHERE ep.examen_id = $1
    ),
    opciones_mezcladas AS (
      SELECT 
        pm.pregunta_id,
        pm.enunciado,
        pm.opcion_seleccionada_id,
        pm.respondida,
        pm.pregunta_order,
        o.id AS opcion_id,
        o.texto,
        o.es_correcta,
        RANDOM() as opcion_order
      FROM preguntas_mezcladas pm
      JOIN opcion o ON o.pregunta_id = pm.pregunta_id
    )
    SELECT 
      pregunta_id,
      enunciado,
      opcion_seleccionada_id,
      respondida,
      opcion_id,
      texto,
      es_correcta
    FROM opciones_mezcladas
    ORDER BY pregunta_order, opcion_order`,
    [examenId]
  );

  const preguntasMap = new Map();

  preguntasResult.rows.forEach((row) => {
    const preguntaId = row.pregunta_id;

    if (!preguntasMap.has(preguntaId)) {
      preguntasMap.set(preguntaId, {
        id: preguntaId,
        enunciado: row.enunciado,
        opcionSeleccionadaId: row.opcion_seleccionada_id,
        respondida: row.respondida,
        opciones: []
      });
    }

    preguntasMap.get(preguntaId).opciones.push({
      id: row.opcion_id,
      texto: row.texto,
      esCorrecta: row.es_correcta
    });
  });

  examen.preguntas = Array.from(preguntasMap.values());

  return examen;
};

export const getExamenesByUsuario = async (usuarioId) => {
  const result = await query(
    `SELECT e.*, c.numero_curso, c.max_preguntas
     FROM examen e
     JOIN capitulo c ON c.id = e.capitulo_id
     WHERE e.usuario_id = $1 
     ORDER BY e.fecha_creacion DESC`,
    [usuarioId]
  );

  return result.rows.map((row) => mapRowToExamen(row));
};

export const responderPregunta = async (examenId, preguntaId, opcionSeleccionadaId) => {
  const result = await query(
    `UPDATE examen_pregunta 
     SET respondida = true, opcion_seleccionada_id = $3
     WHERE examen_id = $1 AND pregunta_id = $2
     RETURNING *`,
    [examenId, preguntaId, opcionSeleccionadaId]
  );

  return result.rows[0];
};

export const finalizarExamen = async (examenId) => {
  const client = await getClient();

  try {
    await client.query('BEGIN');

    const puntajeResult = await client.query(
      `SELECT 
        COUNT(*)::INTEGER as total_preguntas,
        SUM(CASE WHEN o.es_correcta = true THEN 1 ELSE 0 END)::INTEGER as respuestas_correctas
      FROM examen_pregunta ep
      JOIN pregunta p ON p.id = ep.pregunta_id
      JOIN opcion o ON o.id = ep.opcion_seleccionada_id
      WHERE ep.examen_id = $1 AND ep.respondida = true`,
      [examenId]
    );

    const { total_preguntas, respuestas_correctas } = puntajeResult.rows[0];
    const puntaje =
      total_preguntas > 0
        ? Math.round((respuestas_correctas / total_preguntas) * 100 * 100) / 100
        : 0;

    await client.query(
      `UPDATE examen 
       SET estado = 'COMPLETADO',
           fecha_finalizacion = CURRENT_TIMESTAMP,
           puntaje = $1
       WHERE id = $2`,
      [puntaje, examenId]
    );

    const usuarioResult = await client.query(`SELECT usuario_id FROM examen WHERE id = $1`, [
      examenId
    ]);
    const usuarioId = usuarioResult.rows[0].usuario_id;

    const progressResult = await client.query(
      `SELECT COUNT(DISTINCT c.numero_curso)::INTEGER as capitulos_aprobados
       FROM examen e
       JOIN capitulo c ON c.id = e.capitulo_id
       WHERE e.usuario_id = $1
         AND e.estado = 'COMPLETADO'
         AND e.puntaje >= 90
         AND c.numero_curso IS NOT NULL`,
      [usuarioId]
    );
    const capitulosAprobados = progressResult.rows[0].capitulos_aprobados;
    const progreso = Math.min(100, Math.round((capitulosAprobados / 13) * 100));
    await client.query(
      'UPDATE users SET progreso = $1, updated_at = CURRENT_TIMESTAMP WHERE id = $2',
      [progreso, usuarioId]
    );

    await client.query('COMMIT');

    return await getExamenById(examenId);
  } catch (error) {
    await client.query('ROLLBACK');
    throw error;
  } finally {
    client.release();
  }
};

export const getEstadisticasExamenes = async (usuarioId) => {
  const result = await query(
    `SELECT 
      COUNT(*)::INTEGER as total_examenes,
      COUNT(CASE WHEN estado = 'COMPLETADO' THEN 1 END)::INTEGER as examenes_completados,
      COUNT(CASE WHEN estado = 'PENDIENTE' THEN 1 END)::INTEGER as examenes_pendientes,
      ROUND(AVG(CASE WHEN estado = 'COMPLETADO' THEN puntaje END)::NUMERIC, 2) as promedio_puntaje,
      MAX(CASE WHEN estado = 'COMPLETADO' THEN puntaje END)::NUMERIC as mejor_puntaje
    FROM examen
    WHERE usuario_id = $1`,
    [usuarioId]
  );

  const stats = result.rows[0];

  return {
    totalExamenes: parseInt(stats.total_examenes) || 0,
    examenesCompletados: parseInt(stats.examenes_completados) || 0,
    examenesPendientes: parseInt(stats.examenes_pendientes) || 0,
    promedioPuntaje: stats.promedio_puntaje
      ? Math.round(parseFloat(stats.promedio_puntaje) * 100) / 100
      : null,
    mejorPuntaje: stats.mejor_puntaje ? parseFloat(stats.mejor_puntaje) : null
  };
};
