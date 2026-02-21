import { query } from '../database/connection.js';
import path from 'path';
import fs from 'fs';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Helper para mapear fila de DB a objeto Recurso
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
    creadoPor: row.creado_por,
    createdAt: row.created_at,
    updatedAt: row.updated_at
  };
};

// @desc    Obtener todos los recursos
// @route   GET /api/recursos
// @access  Public (para usuarios autenticados)
export const getRecursos = async (req, res) => {
  try {
    const { categoria, tipo, soloActivos } = req.query;
    
    let sql = 'SELECT * FROM recursos WHERE 1=1';
    const params = [];
    let paramCount = 1;

    // Solo mostrar activos para no-admins
    if (soloActivos === 'true' || req.user.role !== 'admin') {
      sql += ` AND activo = true`;
    }

    if (categoria) {
      sql += ` AND categoria = $${paramCount}`;
      params.push(categoria);
      paramCount++;
    }

    if (tipo) {
      sql += ` AND tipo = $${paramCount}`;
      params.push(tipo);
      paramCount++;
    }

    sql += ' ORDER BY categoria, orden, nombre';

    const result = await query(sql, params);
    const recursos = result.rows.map(mapRowToRecurso);

    res.json({
      success: true,
      count: recursos.length,
      data: { recursos }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener recursos',
      error: error.message
    });
  }
};

// @desc    Obtener un recurso por ID
// @route   GET /api/recursos/:id
// @access  Private
export const getRecursoById = async (req, res) => {
  try {
    const result = await query(
      'SELECT * FROM recursos WHERE id = $1',
      [req.params.id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Recurso no encontrado'
      });
    }

    res.json({
      success: true,
      data: { recurso: mapRowToRecurso(result.rows[0]) }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener recurso',
      error: error.message
    });
  }
};

// @desc    Crear nuevo recurso (link)
// @route   POST /api/recursos
// @access  Private/Admin
export const createRecurso = async (req, res) => {
  try {
    const { nombre, descripcion, tipo, categoria, rutaOUrl, tamano, extension, orden } = req.body;

    if (!nombre || !tipo || !rutaOUrl) {
      return res.status(400).json({
        success: false,
        message: 'Nombre, tipo y URL/ruta son requeridos'
      });
    }

    const result = await query(
      `INSERT INTO recursos (nombre, descripcion, tipo, categoria, ruta_o_url, tamano, extension, orden, creado_por)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
       RETURNING *`,
      [
        nombre,
        descripcion || null,
        tipo,
        categoria || 'general',
        rutaOUrl,
        tamano || null,
        extension || null,
        orden || 0,
        req.user.id
      ]
    );

    res.status(201).json({
      success: true,
      message: 'Recurso creado exitosamente',
      data: { recurso: mapRowToRecurso(result.rows[0]) }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al crear recurso',
      error: error.message
    });
  }
};

// @desc    Subir archivo como recurso
// @route   POST /api/recursos/upload
// @access  Private/Admin
export const uploadRecurso = async (req, res) => {
  try {
    if (!req.file) {
      return res.status(400).json({
        success: false,
        message: 'No se proporcionó ningún archivo'
      });
    }

    const { nombre, descripcion, categoria } = req.body;
    const file = req.file;

    // La ruta relativa para el frontend
    const rutaRelativa = `/documentos/${file.filename}`;
    const extension = path.extname(file.originalname).toLowerCase().replace('.', '');
    const tamano = formatFileSize(file.size);

    const result = await query(
      `INSERT INTO recursos (nombre, descripcion, tipo, categoria, ruta_o_url, tamano, extension, creado_por)
       VALUES ($1, $2, 'archivo', $3, $4, $5, $6, $7)
       RETURNING *`,
      [
        nombre || file.originalname,
        descripcion || null,
        categoria || 'documentos',
        rutaRelativa,
        tamano,
        extension,
        req.user.id
      ]
    );

    res.status(201).json({
      success: true,
      message: 'Archivo subido exitosamente',
      data: { recurso: mapRowToRecurso(result.rows[0]) }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al subir archivo',
      error: error.message
    });
  }
};

// @desc    Actualizar recurso
// @route   PUT /api/recursos/:id
// @access  Private/Admin
export const updateRecurso = async (req, res) => {
  try {
    const { nombre, descripcion, tipo, categoria, rutaOUrl, activo, orden } = req.body;

    const existing = await query('SELECT * FROM recursos WHERE id = $1', [req.params.id]);
    if (existing.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Recurso no encontrado'
      });
    }

    const result = await query(
      `UPDATE recursos SET 
        nombre = COALESCE($1, nombre),
        descripcion = COALESCE($2, descripcion),
        tipo = COALESCE($3, tipo),
        categoria = COALESCE($4, categoria),
        ruta_o_url = COALESCE($5, ruta_o_url),
        activo = COALESCE($6, activo),
        orden = COALESCE($7, orden),
        updated_at = CURRENT_TIMESTAMP
       WHERE id = $8
       RETURNING *`,
      [nombre, descripcion, tipo, categoria, rutaOUrl, activo, orden, req.params.id]
    );

    res.json({
      success: true,
      message: 'Recurso actualizado exitosamente',
      data: { recurso: mapRowToRecurso(result.rows[0]) }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al actualizar recurso',
      error: error.message
    });
  }
};

// @desc    Eliminar recurso
// @route   DELETE /api/recursos/:id
// @access  Private/Admin
export const deleteRecurso = async (req, res) => {
  try {
    const existing = await query('SELECT * FROM recursos WHERE id = $1', [req.params.id]);
    if (existing.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Recurso no encontrado'
      });
    }

    const recurso = existing.rows[0];

    // Si es un archivo, intentar eliminarlo del sistema de archivos
    if (recurso.tipo === 'archivo' && recurso.ruta_o_url) {
      // La ruta del archivo en el frontend
      const frontendPublicPath = path.resolve(__dirname, '../../Front (plantilla)/public');
      const filePath = path.join(frontendPublicPath, recurso.ruta_o_url);
      
      if (fs.existsSync(filePath)) {
        fs.unlinkSync(filePath);
      }
    }

    await query('DELETE FROM recursos WHERE id = $1', [req.params.id]);

    res.json({
      success: true,
      message: 'Recurso eliminado exitosamente'
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al eliminar recurso',
      error: error.message
    });
  }
};

// @desc    Obtener categorías disponibles
// @route   GET /api/recursos/categorias
// @access  Private
export const getCategorias = async (req, res) => {
  try {
    const result = await query(
      `SELECT DISTINCT categoria, COUNT(*) as count 
       FROM recursos 
       WHERE activo = true 
       GROUP BY categoria 
       ORDER BY categoria`
    );

    res.json({
      success: true,
      data: { categorias: result.rows }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener categorías',
      error: error.message
    });
  }
};

// Helper para formatear tamaño de archivo
const formatFileSize = (bytes) => {
  if (bytes === 0) return '0 Bytes';
  const k = 1024;
  const sizes = ['Bytes', 'KB', 'MB', 'GB'];
  const i = Math.floor(Math.log(bytes) / Math.log(k));
  return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
};

