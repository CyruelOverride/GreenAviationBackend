import { query, getClient } from '../database/connection.js';

const mapPreguntaConOpciones = (rows) => {
  if (!rows || rows.length === 0) return null;

  const pregunta = {
    id: rows[0].pregunta_id,
    enunciado: rows[0].enunciado,
    capituloId: rows[0].capitulo_id,
    activa: rows[0].activa,
    fechaCreacion: rows[0].fecha_creacion,
    opciones: []
  };

  rows.forEach((row) => {
    if (row.opcion_id) {
      pregunta.opciones.push({
        id: row.opcion_id,
        texto: row.texto,
        esCorrecta: row.es_correcta
      });
    }
  });

  return pregunta;
};

export const createPregunta = async (data) => {
  const client = await getClient();

  try {
    await client.query('BEGIN');

    const { enunciado, capituloId, activa = true, opciones } = data;

    const preguntaResult = await client.query(
      `INSERT INTO pregunta (enunciado, capitulo_id, activa)
       VALUES ($1, $2, $3)
       RETURNING id`,
      [enunciado, capituloId, activa]
    );

    const preguntaId = preguntaResult.rows[0].id;

    for (const opcion of opciones) {
      await client.query(
        `INSERT INTO opcion (pregunta_id, texto, es_correcta)
         VALUES ($1, $2, $3)`,
        [preguntaId, opcion.texto, opcion.esCorrecta]
      );
    }

    const preguntaConOpcionesResult = await client.query(
      `SELECT
        p.id AS pregunta_id,
        p.enunciado,
        p.capitulo_id,
        p.activa,
        p.fecha_creacion,
        o.id AS opcion_id,
        o.texto,
        o.es_correcta
      FROM pregunta p
      LEFT JOIN opcion o ON o.pregunta_id = p.id
      WHERE p.id = $1
      ORDER BY o.id`,
      [preguntaId]
    );

    await client.query('COMMIT');

    return mapPreguntaConOpciones(preguntaConOpcionesResult.rows);
  } catch (error) {
    await client.query('ROLLBACK');
    throw error;
  } finally {
    client.release();
  }
};

export const getPreguntasByCapituloId = async (capituloId) => {
  const result = await query(
    `SELECT 
      p.id AS pregunta_id,
      p.enunciado,
      p.capitulo_id,
      p.activa,
      p.fecha_creacion,
      o.id AS opcion_id,
      o.texto,
      o.es_correcta
    FROM pregunta p
    LEFT JOIN opcion o ON o.pregunta_id = p.id
    WHERE p.capitulo_id = $1
    ORDER BY p.id, o.id`,
    [capituloId]
  );

  const preguntasMap = new Map();

  result.rows.forEach((row) => {
    const preguntaId = row.pregunta_id;

    if (!preguntasMap.has(preguntaId)) {
      preguntasMap.set(preguntaId, {
        id: preguntaId,
        enunciado: row.enunciado,
        capituloId: row.capitulo_id,
        activa: row.activa,
        fechaCreacion: row.fecha_creacion,
        opciones: []
      });
    }

    if (row.opcion_id) {
      preguntasMap.get(preguntaId).opciones.push({
        id: row.opcion_id,
        texto: row.texto,
        esCorrecta: row.es_correcta
      });
    }
  });

  return Array.from(preguntasMap.values());
};

export const updatePregunta = async (preguntaId, data) => {
  const { enunciado, activa } = data;
  const updates = [];
  const values = [];
  let paramCount = 1;

  if (enunciado !== undefined) {
    updates.push(`enunciado = $${paramCount++}`);
    values.push(enunciado);
  }

  if (activa !== undefined) {
    updates.push(`activa = $${paramCount++}`);
    values.push(activa);
  }

  if (updates.length === 0) {
    const result = await query(`SELECT * FROM pregunta WHERE id = $1`, [preguntaId]);
    return result.rows[0] || null;
  }

  values.push(preguntaId);
  const result = await query(
    `UPDATE pregunta 
     SET ${updates.join(', ')}, fecha_creacion = fecha_creacion
     WHERE id = $${paramCount}
     RETURNING *`,
    values
  );

  return result.rows[0] || null;
};

export const updateOpcion = async (opcionId, data) => {
  const { texto, esCorrecta } = data;
  const updates = [];
  const values = [];
  let paramCount = 1;

  if (texto !== undefined) {
    updates.push(`texto = $${paramCount++}`);
    values.push(texto);
  }

  if (esCorrecta !== undefined) {
    updates.push(`es_correcta = $${paramCount++}`);
    values.push(esCorrecta);
  }

  if (updates.length === 0) {
    const result = await query(`SELECT * FROM opcion WHERE id = $1`, [opcionId]);
    return result.rows[0] || null;
  }

  values.push(opcionId);
  const result = await query(
    `UPDATE opcion 
     SET ${updates.join(', ')}
     WHERE id = $${paramCount}
     RETURNING *`,
    values
  );

  return result.rows[0] || null;
};
