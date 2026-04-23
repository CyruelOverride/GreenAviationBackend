import * as PreguntaRepo from '../models/Pregunta.repository.js';
import * as CapituloRepo from '../models/Capitulo.repository.js';

const validarPayloadPregunta = ({ enunciado, capituloId, opciones }) => {
  if (capituloId === undefined || capituloId === null || capituloId === '') {
    return 'capituloId es requerido';
  }
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

export const createPregunta = async (req, res) => {
  try {
    const { enunciado, capituloId: rawCid, activa, opciones } = req.body;

    let capituloId = rawCid != null ? parseInt(rawCid, 10) : null;
    if (Number.isNaN(capituloId)) capituloId = null;

    const errorValidacion = validarPayloadPregunta({ enunciado, capituloId, opciones });
    if (errorValidacion) {
      return res.status(400).json({
        success: false,
        message: errorValidacion
      });
    }

    const cap = await CapituloRepo.getCapituloById(capituloId);
    if (!cap) {
      return res.status(400).json({
        success: false,
        message: 'Capítulo no encontrado'
      });
    }

    const pregunta = await PreguntaRepo.createPregunta({
      enunciado: enunciado.trim(),
      capituloId,
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

export const getPreguntasByCapitulo = async (req, res) => {
  try {
    let capituloId = req.query.capituloId;
    if (capituloId != null) {
      capituloId = parseInt(capituloId, 10);
      if (Number.isNaN(capituloId)) {
        return res.status(400).json({
          success: false,
          message: 'capituloId inválido'
        });
      }
    }

    if (capituloId == null && req.query.capitulo != null) {
      const n = parseInt(String(req.query.capitulo), 10);
      if (!Number.isNaN(n)) {
        const c = await CapituloRepo.getCapituloByNumeroCurso(n);
        if (c) capituloId = c.id;
      }
    }

    if (capituloId == null) {
      return res.status(400).json({
        success: false,
        message: 'Indique capituloId (o capitulo 1–13 como compatibilidad)'
      });
    }

    const preguntas = await PreguntaRepo.getPreguntasByCapituloId(capituloId);

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
