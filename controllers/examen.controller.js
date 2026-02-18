import * as ExamenRepo from '../models/Examen.repository.js';

// @desc    Crear un examen aleatorio por capítulo
// @route   POST /api/examenes
// @access  Private
export const createExamen = async (req, res) => {
  try {
    const { nombre, capitulo, numPreguntas, tiempoLimite } = req.body;
    const usuarioId = req.user.id; // Del middleware de autenticación

    // Validaciones
    if (!capitulo) {
      return res.status(400).json({
        success: false,
        message: 'El capítulo es requerido'
      });
    }

    if (numPreguntas && (numPreguntas < 1 || numPreguntas > 50)) {
      return res.status(400).json({
        success: false,
        message: 'El número de preguntas debe estar entre 1 y 50'
      });
    }

    const examen = await ExamenRepo.createExamenAleatorio({
      usuarioId,
      nombre: nombre || `Examen Capítulo ${capitulo}`,
      capitulo: String(capitulo),
      numPreguntas: numPreguntas || 15,
      tiempoLimite
    });

    res.status(201).json({
      success: true,
      message: 'Examen creado exitosamente',
      data: { examen }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al crear examen',
      error: error.message
    });
  }
};

// @desc    Obtener un examen por ID
// @route   GET /api/examenes/:id
// @access  Private
export const getExamen = async (req, res) => {
  try {
    const examen = await ExamenRepo.getExamenById(req.params.id);

    if (!examen) {
      return res.status(404).json({
        success: false,
        message: 'Examen no encontrado'
      });
    }

    // Verificar que el examen pertenezca al usuario (o sea admin)
    if (examen.usuarioId !== req.user.id && req.user.role !== 'admin') {
      return res.status(403).json({
        success: false,
        message: 'No tienes permiso para acceder a este examen'
      });
    }

    res.json({
      success: true,
      data: { examen }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener examen',
      error: error.message
    });
  }
};

// @desc    Obtener todos los exámenes del usuario
// @route   GET /api/examenes
// @access  Private
export const getExamenes = async (req, res) => {
  try {
    const usuarioId = req.user.role === 'admin' && req.query.usuarioId 
      ? req.query.usuarioId 
      : req.user.id;

    const examenes = await ExamenRepo.getExamenesByUsuario(usuarioId);

    res.json({
      success: true,
      count: examenes.length,
      data: { examenes }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener exámenes',
      error: error.message
    });
  }
};

// @desc    Responder una pregunta del examen
// @route   PUT /api/examenes/:id/preguntas/:preguntaId
// @access  Private
export const responderPregunta = async (req, res) => {
  try {
    const examenId = req.params.id;
    const preguntaId = req.params.preguntaId;
    const { opcionSeleccionadaId } = req.body;

    if (!opcionSeleccionadaId) {
      return res.status(400).json({
        success: false,
        message: 'La opción seleccionada es requerida'
      });
    }

    // Verificar que el examen pertenezca al usuario
    const examen = await ExamenRepo.getExamenById(examenId);
    if (!examen) {
      return res.status(404).json({
        success: false,
        message: 'Examen no encontrado'
      });
    }

    if (examen.usuarioId !== req.user.id && req.user.role !== 'admin') {
      return res.status(403).json({
        success: false,
        message: 'No tienes permiso para modificar este examen'
      });
    }

    if (examen.estado === 'COMPLETADO') {
      return res.status(400).json({
        success: false,
        message: 'No se puede modificar un examen completado'
      });
    }

    const resultado = await ExamenRepo.responderPregunta(
      examenId,
      preguntaId,
      opcionSeleccionadaId
    );

    res.json({
      success: true,
      message: 'Respuesta guardada exitosamente',
      data: { resultado }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al guardar respuesta',
      error: error.message
    });
  }
};

// @desc    Finalizar un examen
// @route   POST /api/examenes/:id/finalizar
// @access  Private
export const finalizarExamen = async (req, res) => {
  try {
    const examenId = req.params.id;

    // Verificar que el examen pertenezca al usuario
    const examen = await ExamenRepo.getExamenById(examenId);
    if (!examen) {
      return res.status(404).json({
        success: false,
        message: 'Examen no encontrado'
      });
    }

    if (examen.usuarioId !== req.user.id && req.user.role !== 'admin') {
      return res.status(403).json({
        success: false,
        message: 'No tienes permiso para finalizar este examen'
      });
    }

    if (examen.estado === 'COMPLETADO') {
      return res.status(400).json({
        success: false,
        message: 'El examen ya está completado'
      });
    }

    const examenFinalizado = await ExamenRepo.finalizarExamen(examenId);

    res.json({
      success: true,
      message: 'Examen finalizado exitosamente',
      data: { examen: examenFinalizado }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al finalizar examen',
      error: error.message
    });
  }
};

// @desc    Obtener estadísticas de exámenes
// @route   GET /api/examenes/stats
// @access  Private
export const getEstadisticas = async (req, res) => {
  try {
    const usuarioId = req.user.role === 'admin' && req.query.usuarioId 
      ? req.query.usuarioId 
      : req.user.id;

    const estadisticas = await ExamenRepo.getEstadisticasExamenes(usuarioId);

    res.json({
      success: true,
      data: { estadisticas }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener estadísticas',
      error: error.message
    });
  }
};

