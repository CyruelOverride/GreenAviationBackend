import { query } from '../database/connection.js';

/**
 * Obtener el progreso de videos del usuario actual
 * @route GET /api/videos/progress
 */
export const getVideoProgress = async (req, res) => {
  try {
    const userId = req.user.id;

    // Obtener todos los registros de video del usuario
    const videoResult = await query(
      `SELECT video_numero, started_at 
       FROM video_progress 
       WHERE user_id = $1 
       ORDER BY video_numero`,
      [userId]
    );

    // Obtener los exámenes completados con sus puntajes por capítulo
    const examenesResult = await query(
      `SELECT DISTINCT ON (capitulo) 
        capitulo, 
        puntaje, 
        estado,
        fecha_finalizacion
       FROM examen 
       WHERE usuario_id = $1 
         AND estado = 'COMPLETADO'
         AND puntaje IS NOT NULL
       ORDER BY capitulo, puntaje DESC`,
      [userId]
    );

    // Crear mapa de exámenes por capítulo
    const examenesPorCapitulo = {};
    examenesResult.rows.forEach(row => {
      examenesPorCapitulo[row.capitulo] = {
        puntaje: parseFloat(row.puntaje),
        estado: row.estado,
        fechaFinalizacion: row.fecha_finalizacion
      };
    });

    // Crear mapa de videos vistos
    const videosVistos = {};
    videoResult.rows.forEach(row => {
      videosVistos[row.video_numero] = {
        startedAt: row.started_at,
        // El video cuenta como "visto" si pasaron 20 minutos desde que se empezó
        completado: new Date() - new Date(row.started_at) >= 20 * 60 * 1000
      };
    });

    res.json({
      success: true,
      data: {
        videosVistos,
        examenesPorCapitulo
      }
    });
  } catch (error) {
    console.error('Error al obtener progreso de videos:', error);
    res.status(500).json({
      success: false,
      message: 'Error al obtener progreso de videos',
      error: error.message
    });
  }
};

/**
 * Registrar que el usuario empezó a ver un video
 * @route POST /api/videos/start/:videoNumero
 */
export const startVideo = async (req, res) => {
  try {
    const userId = req.user.id;
    const videoNumero = parseInt(req.params.videoNumero);

    if (isNaN(videoNumero) || videoNumero < 1 || videoNumero > 50) {
      return res.status(400).json({
        success: false,
        message: 'Número de video inválido'
      });
    }

    // Verificar si ya existe un registro para este video
    const existingResult = await query(
      `SELECT id, started_at FROM video_progress 
       WHERE user_id = $1 AND video_numero = $2`,
      [userId, videoNumero]
    );

    if (existingResult.rows.length > 0) {
      // Ya existe, devolver el registro existente
      return res.json({
        success: true,
        message: 'Video ya registrado previamente',
        data: {
          videoNumero,
          startedAt: existingResult.rows[0].started_at,
          alreadyStarted: true
        }
      });
    }

    // Insertar nuevo registro
    const result = await query(
      `INSERT INTO video_progress (user_id, video_numero, started_at)
       VALUES ($1, $2, CURRENT_TIMESTAMP)
       RETURNING id, video_numero, started_at`,
      [userId, videoNumero]
    );

    res.status(201).json({
      success: true,
      message: 'Video registrado correctamente',
      data: {
        videoNumero: result.rows[0].video_numero,
        startedAt: result.rows[0].started_at,
        alreadyStarted: false
      }
    });
  } catch (error) {
    console.error('Error al registrar video:', error);
    res.status(500).json({
      success: false,
      message: 'Error al registrar video',
      error: error.message
    });
  }
};

/**
 * Verificar si un examen específico está desbloqueado para el usuario
 * @route GET /api/videos/exam-unlock/:capitulo
 */
export const checkExamUnlock = async (req, res) => {
  try {
    const userId = req.user.id;
    const capitulo = parseInt(req.params.capitulo);

    if (isNaN(capitulo) || capitulo < 1 || capitulo > 13) {
      return res.status(400).json({
        success: false,
        message: 'Capítulo inválido'
      });
    }

    // Obtener el video correspondiente a este capítulo
    // (Se asume que cada capítulo tiene videos asociados)
    const videoResult = await query(
      `SELECT started_at FROM video_progress 
       WHERE user_id = $1 AND video_numero = $2`,
      [userId, capitulo]
    );

    if (videoResult.rows.length === 0) {
      return res.json({
        success: true,
        data: {
          desbloqueado: false,
          razon: 'VIDEO_NO_VISTO',
          mensaje: 'Debes ver el video del capítulo primero'
        }
      });
    }

    const startedAt = new Date(videoResult.rows[0].started_at);
    const ahora = new Date();
    const minutosTranscurridos = (ahora - startedAt) / (1000 * 60);

    if (minutosTranscurridos < 20) {
      const minutosRestantes = Math.ceil(20 - minutosTranscurridos);
      return res.json({
        success: true,
        data: {
          desbloqueado: false,
          razon: 'TIEMPO_INSUFICIENTE',
          mensaje: `Espera ${minutosRestantes} minuto(s) más para desbloquear el examen`,
          minutosRestantes
        }
      });
    }

    res.json({
      success: true,
      data: {
        desbloqueado: true,
        mensaje: 'El examen está desbloqueado'
      }
    });
  } catch (error) {
    console.error('Error al verificar desbloqueo de examen:', error);
    res.status(500).json({
      success: false,
      message: 'Error al verificar desbloqueo',
      error: error.message
    });
  }
};

