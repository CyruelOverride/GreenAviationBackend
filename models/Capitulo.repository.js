import { query } from '../database/connection.js';

const mapRow = (row) => ({
  id: row.id,
  nombre: row.nombre,
  numeroCurso: row.numero_curso != null ? row.numero_curso : null,
  orden: row.orden,
  activo: row.activo === true,
  habilitado: row.habilitado === true,
  maxPreguntas: row.max_preguntas != null ? parseInt(row.max_preguntas, 10) : 15,
  habilitacionUpdatedAt: row.habilitacion_updated_at,
  updatedAt: row.updated_at,
  createdAt: row.created_at
});

export const listCapitulos = async ({ soloActivos = false } = {}) => {
  const sql = soloActivos
    ? `SELECT id, nombre, numero_curso, orden, activo, habilitado, max_preguntas,
              habilitacion_updated_at, updated_at, created_at
       FROM capitulo WHERE activo = TRUE ORDER BY orden ASC, id ASC`
    : `SELECT id, nombre, numero_curso, orden, activo, habilitado, max_preguntas,
              habilitacion_updated_at, updated_at, created_at
       FROM capitulo ORDER BY orden ASC, id ASC`;
  const result = await query(sql);
  return result.rows.map(mapRow);
};

export const getCapituloById = async (id) => {
  const result = await query(
    `SELECT id, nombre, numero_curso, orden, activo, habilitado, max_preguntas,
            habilitacion_updated_at, updated_at, created_at
     FROM capitulo WHERE id = $1`,
    [id]
  );
  return result.rows[0] ? mapRow(result.rows[0]) : null;
};

export const getCapituloByNumeroCurso = async (numeroCurso) => {
  const result = await query(
    `SELECT id, nombre, numero_curso, orden, activo, habilitado, max_preguntas,
            habilitacion_updated_at, updated_at, created_at
     FROM capitulo WHERE numero_curso = $1 LIMIT 1`,
    [numeroCurso]
  );
  return result.rows[0] ? mapRow(result.rows[0]) : null;
};

export const createCapitulo = async ({
  nombre,
  numeroCurso = null,
  orden = null,
  maxPreguntas = 15,
  habilitado = false
}) => {
  const ord =
    orden != null
      ? orden
      : (await query(`SELECT COALESCE(MAX(orden), 0) + 1 AS n FROM capitulo`)).rows[0].n;

  const result = await query(
    `INSERT INTO capitulo (nombre, numero_curso, orden, activo, habilitado, max_preguntas, habilitacion_updated_at, updated_at)
     VALUES ($1, $2, $3, TRUE, $4, $5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
     RETURNING id, nombre, numero_curso, orden, activo, habilitado, max_preguntas,
               habilitacion_updated_at, updated_at, created_at`,
    [nombre.trim(), numeroCurso, ord, habilitado, maxPreguntas]
  );
  return mapRow(result.rows[0]);
};

export const updateCapitulo = async (id, data) => {
  const { nombre, numeroCurso, orden, activo, maxPreguntas, habilitado } = data;
  const updates = [];
  const values = [];
  let n = 1;

  if (nombre !== undefined) {
    updates.push(`nombre = $${n++}`);
    values.push(nombre.trim());
  }
  if (numeroCurso !== undefined) {
    updates.push(`numero_curso = $${n++}`);
    values.push(numeroCurso);
  }
  if (orden !== undefined) {
    updates.push(`orden = $${n++}`);
    values.push(orden);
  }
  if (activo !== undefined) {
    updates.push(`activo = $${n++}`);
    values.push(activo);
  }
  if (maxPreguntas !== undefined) {
    updates.push(`max_preguntas = $${n++}`);
    values.push(maxPreguntas);
  }
  if (habilitado !== undefined) {
    updates.push(`habilitado = $${n++}`);
    values.push(habilitado);
    updates.push(`habilitacion_updated_at = CURRENT_TIMESTAMP`);
  }

  if (updates.length === 0) {
    return getCapituloById(id);
  }

  updates.push(`updated_at = CURRENT_TIMESTAMP`);
  values.push(id);

  const result = await query(
    `UPDATE capitulo SET ${updates.join(', ')} WHERE id = $${n}
     RETURNING id, nombre, numero_curso, orden, activo, habilitado, max_preguntas,
               habilitacion_updated_at, updated_at, created_at`,
    values
  );

  return result.rows[0] ? mapRow(result.rows[0]) : null;
};
