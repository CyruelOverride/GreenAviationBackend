import { query } from '../database/connection.js';

// Genera slug desde título: minúsculas, espacios a guiones, sin caracteres raros
function slugify(text) {
  return String(text)
    .trim()
    .toLowerCase()
    .replace(/\s+/g, '-')
    .replace(/[^a-z0-9\-]/g, '')
    .replace(/-+/g, '-')
    .replace(/^-|-$/g, '') || 'articulo';
}

const mapRowToArticulo = (row, autor = null, recursos = null) => {
  if (!row) return null;
  const articulo = {
    id: row.id,
    titulo: row.titulo,
    slug: row.slug,
    cuerpo: row.cuerpo,
    resumen: row.resumen,
    imagenPortadaUrl: row.imagen_portada_url,
    estado: row.estado,
    autorId: row.autor_id,
    createdAt: row.created_at,
    updatedAt: row.updated_at
  };
  if (autor) articulo.autor = autor;
  if (recursos) articulo.recursos = recursos;
  return articulo;
};

const mapRowToRecurso = (row) => {
  if (!row) return null;
  return {
    id: row.id,
    nombre: row.nombre,
    descripcion: row.descripcion,
    tipo: row.tipo,
    categoria: row.categoria,
    rutaOUrl: row.ruta_o_url,
    tamano: row.tamano,
    extension: row.extension,
    activo: row.activo,
    orden: row.orden,
    esParaBlog: row.es_para_blog,
    creadoPor: row.creado_por,
    createdAt: row.created_at,
    updatedAt: row.updated_at
  };
};

// @desc    Listar artículos
// @route   GET /api/articulos
export const getArticulos = async (req, res) => {
  try {
    const { estado, autor_id, limit, offset } = req.query;
    const isAdmin = req.user?.role === 'admin';

    let sql = `
      SELECT a.*,
        u.nombre as autor_nombre, u.apellido as autor_apellido, u.email as autor_email
      FROM articulos a
      JOIN users u ON a.autor_id = u.id
      WHERE 1=1
    `;
    const params = [];
    let paramCount = 1;

    if (!req.user || (!isAdmin && estado !== 'borrador')) {
      sql += ` AND a.estado = 'publicado'`;
    } else if (estado) {
      sql += ` AND a.estado = $${paramCount}`;
      params.push(estado);
      paramCount++;
    }

    if (autor_id) {
      sql += ` AND a.autor_id = $${paramCount}`;
      params.push(autor_id);
      paramCount++;
    }

    sql += ' ORDER BY a.created_at DESC';

    const limitNum = Math.min(parseInt(limit, 10) || 100, 100);
    const offsetNum = Math.max(0, parseInt(offset, 10) || 0);
    sql += ` LIMIT $${paramCount} OFFSET $${paramCount + 1}`;
    params.push(limitNum, offsetNum);

    const result = await query(sql, params);
    const articulos = result.rows.map((row) => {
      const autor = {
        id: row.autor_id,
        nombre: row.autor_nombre,
        apellido: row.autor_apellido,
        email: row.autor_email
      };
      return mapRowToArticulo(row, autor);
    });

    res.json({
      success: true,
      count: articulos.length,
      data: { articulos }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener artículos',
      error: error.message
    });
  }
};

// @desc    Obtener artículo por ID
// @route   GET /api/articulos/:id
export const getArticuloById = async (req, res) => {
  try {
    const id = req.params.id;
    const isAdmin = req.user.role === 'admin';

    const artResult = await query(
      `SELECT a.*, u.nombre as autor_nombre, u.apellido as autor_apellido, u.email as autor_email
       FROM articulos a
       JOIN users u ON a.autor_id = u.id
       WHERE a.id = $1`,
      [id]
    );

    if (artResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Artículo no encontrado'
      });
    }

    const row = artResult.rows[0];
    if (row.estado === 'borrador' && !isAdmin && row.autor_id !== req.user.id) {
      return res.status(404).json({
        success: false,
        message: 'Artículo no encontrado'
      });
    }

    const recursosResult = await query(
      `SELECT r.* FROM recursos r
       JOIN articulo_recursos ar ON ar.recurso_id = r.id
       WHERE ar.articulo_id = $1
       ORDER BY ar.orden, r.nombre`,
      [id]
    );

    const autor = {
      id: row.autor_id,
      nombre: row.autor_nombre,
      apellido: row.autor_apellido,
      email: row.autor_email
    };
    const recursos = recursosResult.rows.map(mapRowToRecurso);
    const articulo = mapRowToArticulo(row, autor, recursos);

    res.json({
      success: true,
      data: { articulo }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener artículo',
      error: error.message
    });
  }
};

// @desc    Obtener artículo por slug
// @route   GET /api/articulos/slug/:slug
export const getArticuloBySlug = async (req, res) => {
  try {
    const slug = req.params.slug;
    const isAdmin = req.user?.role === 'admin';

    const artResult = await query(
      `SELECT a.*, u.nombre as autor_nombre, u.apellido as autor_apellido, u.email as autor_email
       FROM articulos a
       JOIN users u ON a.autor_id = u.id
       WHERE a.slug = $1`,
      [slug]
    );

    if (artResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Artículo no encontrado'
      });
    }

    const row = artResult.rows[0];
    if (row.estado === 'borrador' && (!req.user || (!isAdmin && row.autor_id !== req.user.id))) {
      return res.status(404).json({
        success: false,
        message: 'Artículo no encontrado'
      });
    }

    const recursosResult = await query(
      `SELECT r.* FROM recursos r
       JOIN articulo_recursos ar ON ar.recurso_id = r.id
       WHERE ar.articulo_id = $1
       ORDER BY ar.orden, r.nombre`,
      [row.id]
    );

    const autor = {
      id: row.autor_id,
      nombre: row.autor_nombre,
      apellido: row.autor_apellido,
      email: row.autor_email
    };
    const recursos = recursosResult.rows.map(mapRowToRecurso);
    const articulo = mapRowToArticulo(row, autor, recursos);

    res.json({
      success: true,
      data: { articulo }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener artículo',
      error: error.message
    });
  }
};

// @desc    Crear artículo
// @route   POST /api/articulos
export const createArticulo = async (req, res) => {
  try {
    const { titulo, slug, cuerpo, resumen, imagenPortadaUrl, estado } = req.body;

    if (!titulo || !String(titulo).trim()) {
      return res.status(400).json({
        success: false,
        message: 'El título es requerido'
      });
    }

    const finalSlug = (slug && String(slug).trim()) ? slugify(slug) : slugify(titulo);

    const result = await query(
      `INSERT INTO articulos (titulo, slug, cuerpo, resumen, imagen_portada_url, estado, autor_id)
       VALUES ($1, $2, $3, $4, $5, $6, $7)
       RETURNING *`,
      [
        titulo.trim(),
        finalSlug,
        cuerpo || null,
        resumen || null,
        imagenPortadaUrl || null,
        estado === 'publicado' ? 'publicado' : 'borrador',
        req.user.id
      ]
    );

    const row = result.rows[0];
    const articulo = mapRowToArticulo(row);
    articulo.autor = { id: req.user.id, nombre: req.user.nombre, apellido: req.user.apellido, email: req.user.email };

    res.status(201).json({
      success: true,
      message: 'Artículo creado exitosamente',
      data: { articulo }
    });
  } catch (error) {
    if (error.code === '23505') {
      return res.status(409).json({
        success: false,
        message: 'Ya existe un artículo con ese slug. Indica otro slug o modifica el título.'
      });
    }
    res.status(500).json({
      success: false,
      message: 'Error al crear artículo',
      error: error.message
    });
  }
};

// @desc    Actualizar artículo
// @route   PUT /api/articulos/:id
export const updateArticulo = async (req, res) => {
  try {
    const id = req.params.id;
    const { titulo, slug, cuerpo, resumen, imagenPortadaUrl, estado } = req.body;
    const isAdmin = req.user.role === 'admin';

    const existing = await query('SELECT * FROM articulos WHERE id = $1', [id]);
    if (existing.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Artículo no encontrado'
      });
    }

    const art = existing.rows[0];
    if (!isAdmin && art.autor_id !== req.user.id) {
      return res.status(403).json({
        success: false,
        message: 'Solo el autor o un administrador pueden editar este artículo'
      });
    }

    const finalTitulo = titulo !== undefined ? titulo.trim() : art.titulo;
    const finalSlug = slug !== undefined ? slugify(slug) : (titulo !== undefined ? slugify(titulo) : art.slug);
    const finalEstado = estado === 'publicado' ? 'publicado' : (estado === 'borrador' ? 'borrador' : art.estado);

    await query(
      `UPDATE articulos SET
        titulo = COALESCE($1, titulo),
        slug = COALESCE($2, slug),
        cuerpo = COALESCE($3, cuerpo),
        resumen = COALESCE($4, resumen),
        imagen_portada_url = COALESCE($5, imagen_portada_url),
        estado = COALESCE($6, estado),
        updated_at = CURRENT_TIMESTAMP
       WHERE id = $7`,
      [
        finalTitulo,
        finalSlug,
        cuerpo !== undefined ? cuerpo : art.cuerpo,
        resumen !== undefined ? resumen : art.resumen,
        imagenPortadaUrl !== undefined ? imagenPortadaUrl : art.imagen_portada_url,
        finalEstado,
        id
      ]
    );

    const updated = await query(
      `SELECT a.*, u.nombre as autor_nombre, u.apellido as autor_apellido, u.email as autor_email
       FROM articulos a JOIN users u ON a.autor_id = u.id WHERE a.id = $1`,
      [id]
    );
    const row = updated.rows[0];
    const autor = { id: row.autor_id, nombre: row.autor_nombre, apellido: row.autor_apellido, email: row.autor_email };
    const articulo = mapRowToArticulo(row, autor);

    res.json({
      success: true,
      message: 'Artículo actualizado exitosamente',
      data: { articulo }
    });
  } catch (error) {
    if (error.code === '23505') {
      return res.status(409).json({
        success: false,
        message: 'Ya existe un artículo con ese slug.'
      });
    }
    res.status(500).json({
      success: false,
      message: 'Error al actualizar artículo',
      error: error.message
    });
  }
};

// @desc    Eliminar artículo
// @route   DELETE /api/articulos/:id
export const deleteArticulo = async (req, res) => {
  try {
    const id = req.params.id;
    const isAdmin = req.user.role === 'admin';

    const existing = await query('SELECT * FROM articulos WHERE id = $1', [id]);
    if (existing.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Artículo no encontrado'
      });
    }

    const art = existing.rows[0];
    if (!isAdmin && art.autor_id !== req.user.id) {
      return res.status(403).json({
        success: false,
        message: 'Solo el autor o un administrador pueden eliminar este artículo'
      });
    }

    await query('DELETE FROM articulos WHERE id = $1', [id]);

    res.json({
      success: true,
      message: 'Artículo eliminado exitosamente'
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al eliminar artículo',
      error: error.message
    });
  }
};

// @desc    Listar recursos de un artículo
// @route   GET /api/articulos/:id/recursos
export const getArticuloRecursos = async (req, res) => {
  try {
    const articuloId = req.params.id;

    const artCheck = await query('SELECT id, autor_id, estado FROM articulos WHERE id = $1', [articuloId]);
    if (artCheck.rows.length === 0) {
      return res.status(404).json({ success: false, message: 'Artículo no encontrado' });
    }
    const art = artCheck.rows[0];
    const isAdmin = req.user.role === 'admin';
    if (art.estado === 'borrador' && !isAdmin && art.autor_id !== req.user.id) {
      return res.status(404).json({ success: false, message: 'Artículo no encontrado' });
    }

    const result = await query(
      `SELECT r.*, ar.orden
       FROM recursos r
       JOIN articulo_recursos ar ON ar.recurso_id = r.id
       WHERE ar.articulo_id = $1
       ORDER BY ar.orden, r.nombre`,
      [articuloId]
    );

    const recursos = result.rows.map((row) => ({
      ...mapRowToRecurso(row),
      orden: row.orden
    }));

    res.json({ success: true, data: { recursos } });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener recursos del artículo',
      error: error.message
    });
  }
};

// @desc    Asociar recursos a un artículo
// @route   POST /api/articulos/:id/recursos
export const addArticuloRecursos = async (req, res) => {
  try {
    const articuloId = req.params.id;
    const { recursoIds, orden } = req.body;
    const isAdmin = req.user.role === 'admin';

    const artCheck = await query('SELECT id, autor_id FROM articulos WHERE id = $1', [articuloId]);
    if (artCheck.rows.length === 0) {
      return res.status(404).json({ success: false, message: 'Artículo no encontrado' });
    }
    const art = artCheck.rows[0];
    if (!isAdmin && art.autor_id !== req.user.id) {
      return res.status(403).json({
        success: false,
        message: 'Solo el autor o un administrador pueden modificar los recursos del artículo'
      });
    }

    const ids = Array.isArray(recursoIds) ? recursoIds : (recursoIds ? [recursoIds] : []);
    if (ids.length === 0) {
      return res.status(400).json({
        success: false,
        message: 'Se requiere recursoIds (array de UUIDs)'
      });
    }

    const ordenBase = typeof orden === 'number' ? orden : 0;
    for (let i = 0; i < ids.length; i++) {
      await query(
        `INSERT INTO articulo_recursos (articulo_id, recurso_id, orden)
         VALUES ($1, $2, $3)
         ON CONFLICT (articulo_id, recurso_id) DO UPDATE SET orden = $3`,
        [articuloId, ids[i], ordenBase + i]
      );
    }

    const result = await query(
      `SELECT r.*, ar.orden FROM recursos r
       JOIN articulo_recursos ar ON ar.recurso_id = r.id
       WHERE ar.articulo_id = $1 ORDER BY ar.orden, r.nombre`,
      [articuloId]
    );
    const recursos = result.rows.map((row) => ({ ...mapRowToRecurso(row), orden: row.orden }));

    res.status(201).json({
      success: true,
      message: 'Recursos asociados al artículo',
      data: { recursos }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al asociar recursos',
      error: error.message
    });
  }
};

// @desc    Desasociar un recurso de un artículo
// @route   DELETE /api/articulos/:id/recursos/:recursoId
export const removeArticuloRecurso = async (req, res) => {
  try {
    const { id: articuloId, recursoId } = req.params;
    const isAdmin = req.user.role === 'admin';

    const artCheck = await query('SELECT id, autor_id FROM articulos WHERE id = $1', [articuloId]);
    if (artCheck.rows.length === 0) {
      return res.status(404).json({ success: false, message: 'Artículo no encontrado' });
    }
    const art = artCheck.rows[0];
    if (!isAdmin && art.autor_id !== req.user.id) {
      return res.status(403).json({
        success: false,
        message: 'Solo el autor o un administrador pueden modificar los recursos del artículo'
      });
    }

    const result = await query(
      'DELETE FROM articulo_recursos WHERE articulo_id = $1 AND recurso_id = $2 RETURNING articulo_id',
      [articuloId, recursoId]
    );

    if (result.rowCount === 0) {
      return res.status(404).json({
        success: false,
        message: 'El recurso no estaba asociado a este artículo'
      });
    }

    res.json({
      success: true,
      message: 'Recurso desasociado del artículo'
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al desasociar recurso',
      error: error.message
    });
  }
};
