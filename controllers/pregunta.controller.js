import * as PreguntaRepo from '../models/Pregunta.repository.js';

// @desc    Obtener todas las preguntas de un capítulo
// @route   GET /api/preguntas?capitulo=X
// @access  Private
export const getPreguntasByCapitulo = async (req, res) => {
  try {
    const { capitulo } = req.query;

    if (!capitulo) {
      return res.status(400).json({
        success: false,
        message: 'El parámetro capitulo es requerido'
      });
    }

    const preguntas = await PreguntaRepo.getPreguntasByCapitulo(capitulo);

    res.json({
      success: true,
      count: preguntas.length,
      data: { preguntas }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener preguntas',
      error: error.message
    });
  }
};

// @desc    Actualizar una pregunta
// @route   PUT /api/preguntas/:id
// @access  Private/Admin
export const updatePregunta = async (req, res) => {
  try {
    const { enunciado, activa } = req.body;

    const pregunta = await PreguntaRepo.updatePregunta(req.params.id, {
      enunciado,
      activa
    });

    if (!pregunta) {
      return res.status(404).json({
        success: false,
        message: 'Pregunta no encontrada'
      });
    }

    res.json({
      success: true,
      message: 'Pregunta actualizada exitosamente',
      data: { pregunta }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al actualizar pregunta',
      error: error.message
    });
  }
};

// @desc    Actualizar una opción
// @route   PUT /api/opciones/:id
// @access  Private/Admin
export const updateOpcion = async (req, res) => {
  try {
    const { texto, esCorrecta } = req.body;

    const opcion = await PreguntaRepo.updateOpcion(req.params.id, {
      texto,
      esCorrecta
    });

    if (!opcion) {
      return res.status(404).json({
        success: false,
        message: 'Opción no encontrada'
      });
    }

    res.json({
      success: true,
      message: 'Opción actualizada exitosamente',
      data: { opcion }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al actualizar opción',
      error: error.message
    });
  }
};

