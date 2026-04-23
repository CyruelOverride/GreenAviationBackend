import * as CapituloRepo from '../models/Capitulo.repository.js';

export const listCapitulos = async (req, res) => {
  try {
    const capitulos = await CapituloRepo.listCapitulos({ soloActivos: false });
    res.json({ success: true, data: { capitulos } });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al listar capítulos',
      error: error.message
    });
  }
};

export const createCapitulo = async (req, res) => {
  try {
    const { nombre, numeroCurso, orden, maxPreguntas, habilitado } = req.body;
    if (!nombre || !String(nombre).trim()) {
      return res.status(400).json({
        success: false,
        message: 'El nombre es requerido'
      });
    }

    let nc = null;
    if (numeroCurso !== undefined && numeroCurso !== null && numeroCurso !== '') {
      nc = parseInt(numeroCurso, 10);
      if (Number.isNaN(nc) || nc < 1 || nc > 13) {
        return res.status(400).json({
          success: false,
          message: 'numeroCurso debe estar entre 1 y 13 u omitirse'
        });
      }
    }

    let mp = 15;
    if (maxPreguntas !== undefined && maxPreguntas !== null && maxPreguntas !== '') {
      mp = parseInt(maxPreguntas, 10);
      if (Number.isNaN(mp) || mp < 1 || mp > 100) {
        return res.status(400).json({
          success: false,
          message: 'maxPreguntas debe estar entre 1 y 100'
        });
      }
    }

    const capitulo = await CapituloRepo.createCapitulo({
      nombre: String(nombre).trim(),
      numeroCurso: nc,
      orden: orden != null ? parseInt(orden, 10) : null,
      maxPreguntas: mp,
      habilitado: habilitado === true
    });

    res.status(201).json({
      success: true,
      message: 'Capítulo creado',
      data: { capitulo }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al crear capítulo',
      error: error.message
    });
  }
};

export const patchCapitulo = async (req, res) => {
  try {
    const id = parseInt(req.params.id, 10);
    if (Number.isNaN(id)) {
      return res.status(400).json({ success: false, message: 'Id inválido' });
    }

    const { nombre, numeroCurso, orden, activo, maxPreguntas, habilitado } = req.body;
    const payload = {};

    if (nombre !== undefined) payload.nombre = nombre;
    if (numeroCurso !== undefined) {
      if (numeroCurso === null || numeroCurso === '') payload.numeroCurso = null;
      else {
        const nc = parseInt(numeroCurso, 10);
        if (Number.isNaN(nc) || nc < 1 || nc > 13) {
          return res.status(400).json({
            success: false,
            message: 'numeroCurso debe estar entre 1 y 13 o ser null'
          });
        }
        payload.numeroCurso = nc;
      }
    }
    if (orden !== undefined) payload.orden = parseInt(orden, 10);
    if (activo !== undefined) payload.activo = Boolean(activo);
    if (maxPreguntas !== undefined) {
      const mp = parseInt(maxPreguntas, 10);
      if (Number.isNaN(mp) || mp < 1 || mp > 100) {
        return res.status(400).json({
          success: false,
          message: 'maxPreguntas debe estar entre 1 y 100'
        });
      }
      payload.maxPreguntas = mp;
    }
    if (habilitado !== undefined) payload.habilitado = Boolean(habilitado);

    const capitulo = await CapituloRepo.updateCapitulo(id, payload);
    if (!capitulo) {
      return res.status(404).json({ success: false, message: 'Capítulo no encontrado' });
    }

    res.json({ success: true, data: { capitulo } });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al actualizar capítulo',
      error: error.message
    });
  }
};
