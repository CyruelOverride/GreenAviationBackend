import { query, getClient } from '../database/connection.js';

const mapRowToExamen = (row) => {
  if (!row) return null;
  
  return {
    id: row.id,
    usuarioId: row.usuario_id,
    nombre: row.nombre,
    capitulo: row.capitulo,
    fechaCreacion: row.fecha_creacion,
    fechaFinalizacion: row.fecha_finalizacion,
    puntaje: row.puntaje ? parseFloat(row.puntaje) : null,
    estado: row.estado,
    tiempoLimite: row.tiempo_limite
  };
};

const mapRowToPregunta = (row) => {
  if (!row) return null;
  
  return {
    preguntaId: row.pregunta_id,
    enunciado: row.enunciado,
    opcionId: row.opcion_id,
    texto: row.texto,
    esCorrecta: row.es_correcta
  };
};

/**
 * @param {Object} examenData 
 * @param {number} examenData.usuarioId 
 * @param {string} examenData.nombre 
 * @param {string} examenData.capitulo 
 * @param {number} [examenData.numPreguntas=15] 
 * @param {number} [examenData.tiempoLimite] 
 * @returns {Promise<Object>} 
 */
export const createExamenAleatorio = async (examenData) => {
  const client = await getClient();
  
  try {
    await client.query('BEGIN');
    
    const { usuarioId, nombre, capitulo, numPreguntas = 15, tiempoLimite } = examenData;
    
    const examenResult = await client.query(
      `INSERT INTO examen (usuario_id, nombre, capitulo, estado, tiempo_limite)
       VALUES ($1, $2, $3, 'PENDIENTE', $4)
       RETURNING *`,
      [usuarioId, nombre, capitulo, tiempoLimite || null]
    );
    
    const examen = mapRowToExamen(examenResult.rows[0]);
    const examenId = examen.id;
    
    const preguntasResult = await client.query(
      `SELECT id
       FROM pregunta
       WHERE capitulo = $1 AND activa = true
       ORDER BY RANDOM()
       LIMIT $2`,
      [capitulo, numPreguntas]
    );
    
    if (preguntasResult.rows.length === 0) {
      throw new Error(`No hay preguntas activas disponibles para el capítulo ${capitulo}`);
    }
    
    for (const preguntaRow of preguntasResult.rows) {
      await client.query(
        `INSERT INTO examen_pregunta (examen_id, pregunta_id, respondida)
         VALUES ($1, $2, false)`,
        [examenId, preguntaRow.id]
      );
    }
    
    await client.query('COMMIT');
    
    const examenCompleto = await getExamenById(examenId);
    
    return examenCompleto;
  } catch (error) {
    await client.query('ROLLBACK');
    throw error;
  } finally {
    client.release();
  }
};

/**
 * @param {number} examenId 
 * @returns {Promise<Object>} 
 */
export const getExamenById = async (examenId) => {
  const examenResult = await query(
    `SELECT * FROM examen WHERE id = $1`,
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
        RANDOM() as pregunta_order
      FROM examen_pregunta ep
      JOIN pregunta p ON p.id = ep.pregunta_id
      WHERE ep.examen_id = $1
    ),
    opciones_mezcladas AS (
      SELECT 
        pm.pregunta_id,
        pm.enunciado,
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
      opcion_id,
      texto,
      es_correcta
    FROM opciones_mezcladas
    ORDER BY pregunta_order, opcion_order`,
    [examenId]
  );
  
  const preguntasMap = new Map();
  
  preguntasResult.rows.forEach(row => {
    const preguntaId = row.pregunta_id;
    
    if (!preguntasMap.has(preguntaId)) {
      preguntasMap.set(preguntaId, {
        id: preguntaId,
        enunciado: row.enunciado,
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

/**
 * @param {number} usuarioId 
 * @returns {Promise<Array>} 
 */
export const getExamenesByUsuario = async (usuarioId) => {
  const result = await query(
    `SELECT * FROM examen 
     WHERE usuario_id = $1 
     ORDER BY fecha_creacion DESC`,
    [usuarioId]
  );
  
  return result.rows.map(row => mapRowToExamen(row));
};

/**
 * @param {number} examenId 
 * @param {number} preguntaId 
 * @param {number} opcionSeleccionadaId 
 * @returns {Promise<Object>} 
 */
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

/**
 * @param {number} examenId - ID del examen
 * @returns {Promise<Object>} Examen finalizado con puntaje
 */
export const finalizarExamen = async (examenId) => {
  const client = await getClient();
  
  try {
    await client.query('BEGIN');
    
    // Calcular puntaje: respuestas correctas / total de preguntas * 100
    // PostgreSQL: usar COUNT con filtro y SUM con CASE
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
    const puntaje = total_preguntas > 0 
      ? Math.round((respuestas_correctas / total_preguntas) * 100 * 100) / 100
      : 0;
    
    // Actualizar examen
    const updateResult = await client.query(
      `UPDATE examen 
       SET estado = 'COMPLETADO',
           fecha_finalizacion = CURRENT_TIMESTAMP,
           puntaje = $1
       WHERE id = $2
       RETURNING *`,
      [puntaje, examenId]
    );
    
    await client.query('COMMIT');
    
    return mapRowToExamen(updateResult.rows[0]);
  } catch (error) {
    await client.query('ROLLBACK');
    throw error;
  } finally {
    client.release();
  }
};

/**
 * Obtener estadísticas de exámenes de un usuario
 * @param {number} usuarioId - ID del usuario
 * @returns {Promise<Object>} Estadísticas
 */
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
    promedioPuntaje: stats.promedio_puntaje ? Math.round(parseFloat(stats.promedio_puntaje) * 100) / 100 : null,
    mejorPuntaje: stats.mejor_puntaje ? parseFloat(stats.mejor_puntaje) : null
  };
};

