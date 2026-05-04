import * as ClaseOnlineRepo from '../models/ClaseOnline.repository.js';
import * as UserRepo from '../models/User.repository.js';

// @desc    Obtener todas las clases online
// @route   GET /api/clases-online
// @access  Private
export const getAllClasesOnline = async (req, res) => {
  try {
    const { estado, instructorId, alumnoId, fechaDesde, fechaHasta } = req.query;
    const filters = {};

    // Si es alumno, solo puede ver las clases en las que está registrado
    if (req.user.role === 'alumno') {
      filters.alumnoId = req.user.id;
    } else {
      if (estado) filters.estado = estado;
      if (instructorId) filters.instructorId = instructorId;
      if (alumnoId) filters.alumnoId = alumnoId;
    }

    if (fechaDesde) filters.fechaDesde = fechaDesde;
    if (fechaHasta) filters.fechaHasta = fechaHasta;

    const clases = await ClaseOnlineRepo.findClasesOnline(filters);

    res.json({
      success: true,
      count: clases.length,
      data: { clases }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener clases online',
      error: error.message
    });
  }
};

// @desc    Obtener una clase online por ID
// @route   GET /api/clases-online/:id
// @access  Private
export const getClaseOnlineById = async (req, res) => {
  try {
    const clase = await ClaseOnlineRepo.findClaseOnlineById(req.params.id);

    if (!clase) {
      return res.status(404).json({
        success: false,
        message: 'Clase online no encontrada'
      });
    }

    // Verificar que el usuario tenga acceso
    // Si es alumno, solo puede ver si está registrado en la clase
    if (req.user.role === 'alumno') {
      const isRegistrado = await ClaseOnlineRepo.isAlumnoRegistrado(clase.id, req.user.id);
      if (!isRegistrado) {
        return res.status(403).json({
          success: false,
          message: 'No tienes permisos para ver esta clase'
        });
      }
    }

    res.json({
      success: true,
      data: { clase }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener clase online',
      error: error.message
    });
  }
};

// @desc    Crear nueva clase online
// @route   POST /api/clases-online
// @access  Private/Admin
export const createClaseOnline = async (req, res) => {
  try {
    const {
      link,
      linkGrabacion,
      fechaHoraInicio,
      fechaHoraFin,
      instructorId
    } = req.body;

    // Validar que se proporcione el link
    if (!link) {
      return res.status(400).json({
        success: false,
        message: 'El link de la clase es requerido'
      });
    }

    // El instructor por defecto es el usuario logueado (si es admin)
    // Si se proporciona instructorId, validar que existe
    let finalInstructorId = instructorId || req.user.id;

    if (instructorId) {
      const instructorExists = await UserRepo.findUserById(instructorId);
      if (!instructorExists) {
        return res.status(404).json({
          success: false,
          message: 'Instructor no encontrado'
        });
      }
      finalInstructorId = instructorId;
    }

    // Fecha y hora por defecto es hoy
    const fechaHoraInicioFinal = fechaHoraInicio 
      ? new Date(fechaHoraInicio) 
      : new Date();

    // Estado por defecto es "Pendiente"
    const estado = 'Pendiente';

    const clase = await ClaseOnlineRepo.createClaseOnline({
      link,
      linkGrabacion,
      fechaHoraInicio: fechaHoraInicioFinal,
      fechaHoraFin: fechaHoraFin ? new Date(fechaHoraFin) : null,
      estado,
      instructorId: finalInstructorId
    });

    res.status(201).json({
      success: true,
      message: 'Clase online creada exitosamente',
      data: { clase }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al crear clase online',
      error: error.message
    });
  }
};

// @desc    Actualizar clase online
// @route   PUT /api/clases-online/:id
// @access  Private/Admin
export const updateClaseOnline = async (req, res) => {
  try {
    const clase = await ClaseOnlineRepo.findClaseOnlineById(req.params.id);

    if (!clase) {
      return res.status(404).json({
        success: false,
        message: 'Clase online no encontrada'
      });
    }

    // Solo se puede modificar si NO está en estado "Terminada"
    // EXCEPTO si se quiere cambiar a "Grabacion" (modificación especial)
    const { estado, linkGrabacion, ...otherFields } = req.body;

    // Si se intenta cambiar el estado a "Grabacion" y la clase está "Terminada", permitirlo
    if (estado === 'Grabacion' && clase.estado === 'Terminada') {
      // Permitir cambio a Grabacion y actualizar link de grabación si se proporciona
      const updateData = {
        estado: 'Grabacion',
        ...otherFields
      };
      
      if (linkGrabacion) {
        updateData.linkGrabacion = linkGrabacion;
      }

      const updatedClase = await ClaseOnlineRepo.updateClaseOnline(req.params.id, updateData);

      return res.json({
        success: true,
        message: 'Clase online actualizada exitosamente',
        data: { clase: updatedClase }
      });
    }

    // Si la clase está "Terminada" y no se está cambiando a "Grabacion", no permitir modificación
    if (clase.estado === 'Terminada' && estado !== 'Grabacion') {
      return res.status(400).json({
        success: false,
        message: 'No se puede modificar una clase que está en estado "Terminada". Solo se puede cambiar a "Grabacion"'
      });
    }

    // Para otros estados, permitir modificación
    const updateData = {
      ...otherFields
    };

    if (estado) {
      updateData.estado = estado;
    }

    if (linkGrabacion) {
      updateData.linkGrabacion = linkGrabacion;
    }

    const updatedClase = await ClaseOnlineRepo.updateClaseOnline(req.params.id, updateData);

    res.json({
      success: true,
      message: 'Clase online actualizada exitosamente',
      data: { clase: updatedClase }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al actualizar clase online',
      error: error.message
    });
  }
};

// @desc    Eliminar clase online
// @route   DELETE /api/clases-online/:id
// @access  Private/Admin
export const deleteClaseOnline = async (req, res) => {
  try {
    const clase = await ClaseOnlineRepo.findClaseOnlineById(req.params.id);
    if (!clase) {
      return res.status(404).json({
        success: false,
        message: 'Clase online no encontrada'
      });
    }

    // El admin puede borrar clases en cualquier estado
    await ClaseOnlineRepo.deleteClaseOnline(req.params.id);

    res.json({
      success: true,
      message: 'Clase online eliminada exitosamente'
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al eliminar clase online',
      error: error.message
    });
  }
};

// @desc    Registrar alumno en clase online
// @route   POST /api/clases-online/:id/registrar-alumno
// @access  Private
export const registrarAlumnoEnClase = async (req, res) => {
  try {
    const { id } = req.params;
    const clase = await ClaseOnlineRepo.findClaseOnlineById(id);

    if (!clase) {
      return res.status(404).json({
        success: false,
        message: 'Clase online no encontrada'
      });
    }

    // Si es admin, puede registrar cualquier alumno (se pasa en body)
    // Si no es admin, se registra a sí mismo
    const alumnoId = req.user.role === 'admin' && req.body.alumnoId 
      ? req.body.alumnoId 
      : req.user.id;

    // Verificar que el usuario existe
    const alumno = await UserRepo.findUserById(alumnoId);
    if (!alumno) {
      return res.status(404).json({
        success: false,
        message: 'Alumno no encontrado'
      });
    }

    // Verificar que no sea admin o instructor (según tu lógica de negocio)
    // Por ahora, cualquier usuario puede registrarse

    // Registrar al alumno
    const claseActualizada = await ClaseOnlineRepo.registrarAlumnoEnClase(id, alumnoId);

    res.json({
      success: true,
      message: 'Alumno registrado en la clase exitosamente',
      data: { clase: claseActualizada }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al registrar alumno en la clase',
      error: error.message
    });
  }
};

// @desc    Eliminar alumno de clase online
// @route   DELETE /api/clases-online/:id/alumnos/:alumnoId
// @access  Private/Admin
export const eliminarAlumnoDeClase = async (req, res) => {
  try {
    const { id, alumnoId } = req.params;
    const clase = await ClaseOnlineRepo.findClaseOnlineById(id);

    if (!clase) {
      return res.status(404).json({
        success: false,
        message: 'Clase online no encontrada'
      });
    }

    await ClaseOnlineRepo.eliminarAlumnoDeClase(id, alumnoId);

    const claseActualizada = await ClaseOnlineRepo.findClaseOnlineById(id);

    res.json({
      success: true,
      message: 'Alumno eliminado de la clase exitosamente',
      data: { clase: claseActualizada }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al eliminar alumno de la clase',
      error: error.message
    });
  }
};

