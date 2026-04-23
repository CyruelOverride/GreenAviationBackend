import * as PreguntaRepo from '../models/Pregunta.repository.js';

const validarPayloadPregunta = ({ enunciado, capitulo, opciones }) => {
  if (!capitulo) return 'El capítulo es requerido';
  if (!enunciado || !enunciado.trim()) return 'El enunciado es requerido';
  if (!Array.isArray(opciones) || opciones.length < 2) {
    return 'Debe incluir al menos 2 opciones';
  }

  const opcionesInvalidas = opciones.some((opcion) => !opcion?.texto || !opcion.texto.trim());
  if (opcionesInvalidas) return 'Todas las opciones deben tener texto';

  const correctas = opciones.filter((opcion) => opcion.esCorrecta === true).length;
  if (correctas !== 1) return 'Debe existir exactamente una opción correcta';

  return null;
};

// @desc    Crear una pregunta con opciones
// @route   POST /api/preguntas
// @access  Private/Admin
export const createPregunta = async (req, res) => {
  try {
    const { enunciado, capitulo, activa, opciones } = req.body;

    const errorValidacion = validarPayloadPregunta({ enunciado, capitulo, opciones });
    if (errorValidacion) {
      return res.status(400).json({
        success: false,
        message: errorValidacion
      });
    }

    const pregunta = await PreguntaRepo.createPregunta({
      enunciado: enunciado.trim(),
      capitulo: String(capitulo),
      activa: activa !== undefined ? Boolean(activa) : true,
      opciones: opciones.map((opcion) => ({
        texto: opcion.texto.trim(),
        esCorrecta: opcion.esCorrecta === true
      }))
    });

    res.status(201).json({
      success: true,
      message: 'Pregunta creada exitosamente',
      data: { pregunta }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al crear pregunta',
      error: error.message
    });
  }
};

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

