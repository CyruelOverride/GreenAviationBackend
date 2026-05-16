import * as ExamenRepo from '../models/Examen.repository.js';
import * as CapituloRepo from '../models/Capitulo.repository.js';

export const createExamen = async (req, res) => {
  try {
    const { nombre, numPreguntas, tiempoLimite } = req.body;
    let capituloId =
      req.body.capituloId != null ? parseInt(req.body.capituloId, 10) : null;
    if (Number.isNaN(capituloId)) capituloId = null;

    if (capituloId == null && req.body.capitulo != null) {
      const n = parseInt(String(req.body.capitulo), 10);
      if (!Number.isNaN(n)) {
        const c = await CapituloRepo.getCapituloByNumeroCurso(n);
        if (c) capituloId = c.id;
      }
    }

    const usuarioId = req.user.id;

    if (capituloId == null) {
      return res.status(400).json({
        success: false,
        message: 'capituloId es requerido (o capitulo numérico 1–13 como compatibilidad)'
      });
    }

    if (numPreguntas != null && numPreguntas !== '') {
      const np = parseInt(numPreguntas, 10);
      if (Number.isNaN(np) || np < 1 || np > 100) {
        return res.status(400).json({
          success: false,
          message: 'El número de preguntas debe estar entre 1 y 100'
        });
      }
    }

    const cap = await CapituloRepo.getCapituloById(capituloId);
    if (!cap) {
      return res.status(400).json({
        success: false,
        message: 'Capítulo no encontrado'
      });
    }

    const examen = await ExamenRepo.createExamenAleatorio({
      usuarioId,
      capituloId,
      nombre: nombre || cap.nombre,
      numPreguntas,
      tiempoLimite,
      esAdmin: req.user.role === 'admin'
    });

    res.status(201).json({
      success: true,
      message: 'Examen creado exitosamente',
      data: { examen }
    });
  } catch (error) {
    if (error.message?.startsWith('EXAMEN_CAPITULO_BLOQUEADO:')) {
      return res.status(403).json({
        success: false,
        message: 'Este examen está bloqueado por administración'
      });
    }

    if (error.message === 'LIMITE_INSTANCIAS_ALCANZADO') {
      return res.status(403).json({
        success: false,
        message: 'Ya utilizaste todos los intentos disponibles para este examen'
      });
    }

    if (error.message === 'CAPITULO_NO_ENCONTRADO') {
      return res.status(400).json({
        success: false,
        message: 'Capítulo no encontrado'
      });
    }

    res.status(500).json({
      success: false,
      message: 'Error al crear examen',
      error: error.message
    });
  }
};

export const getHabilitaciones = async (req, res) => {
  try {
    const usuarioId = req.user?.id ?? null;
    const habilitaciones = await ExamenRepo.getHabilitacionesCapitulos(usuarioId);

    res.json({
      success: true,
      data: { habilitaciones }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener habilitaciones de exámenes',
      error: error.message
    });
  }
};

export const updateHabilitacion = async (req, res) => {
  try {
    const capituloId = parseInt(req.params.capituloId, 10);
    const { habilitado } = req.body;

    if (Number.isNaN(capituloId) || capituloId < 1) {
      return res.status(400).json({
        success: false,
        message: 'capituloId inválido'
      });
    }

    if (typeof habilitado !== 'boolean') {
      return res.status(400).json({
        success: false,
        message: 'El campo habilitado debe ser booleano'
      });
    }

    const configuracion = await ExamenRepo.updateHabilitacionCapitulo(capituloId, habilitado);

    if (!configuracion) {
      return res.status(404).json({
        success: false,
        message: 'Capítulo no encontrado'
      });
    }

    res.json({
      success: true,
      message: `${habilitado ? 'Habilitado' : 'Bloqueado'}: ${configuracion.nombre || capituloId}`,
      data: { configuracion }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al actualizar habilitación',
      error: error.message
    });
  }
};

export const getExamen = async (req, res) => {
  try {
    const examen = await ExamenRepo.getExamenById(req.params.id);

    if (!examen) {
      return res.status(404).json({
        success: false,
        message: 'Examen no encontrado'
      });
    }

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

export const getExamenes = async (req, res) => {
  try {
    const usuarioId =
      req.user.role === 'admin' && req.query.usuarioId ? req.query.usuarioId : req.user.id;

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

export const finalizarExamen = async (req, res) => {
  try {
    const examenId = req.params.id;

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

export const getEstadisticas = async (req, res) => {
  try {
    const usuarioId =
      req.user.role === 'admin' && req.query.usuarioId ? req.query.usuarioId : req.user.id;

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
