import * as UserRepo from '../models/User.repository.js';
import { exportarAlumnoExcel } from '../utils/excelExporter.js';

// @desc    Obtener todos los usuarios (solo admin)
// @route   GET /api/users
// @access  Private/Admin
export const getAllUsers = async (req, res) => {
  try {
    const { role, estado, search } = req.query;
    const filters = { role, estado, search };

    const users = await UserRepo.findUsers(filters);

    res.json({
      success: true,
      count: users.length,
      data: { users }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener usuarios',
      error: error.message
    });
  }
};

// @desc    Obtener un usuario por ID
// @route   GET /api/users/:id
// @access  Private
export const getUserById = async (req, res) => {
  try {
    const user = await UserRepo.findUserById(req.params.id);

    if (!user) {
      return res.status(404).json({
        success: false,
        message: 'Usuario no encontrado'
      });
    }

    res.json({
      success: true,
      data: { user }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener usuario',
      error: error.message
    });
  }
};

// @desc    Crear nuevo usuario
// @route   POST /api/users
// @access  Private/Admin
export const createUser = async (req, res) => {
  try {
    const {
      email,
      password,
      role,
      nombre,
      apellido,
      cedula,
      numeroTelefono,
      telefono,
      celular,
      fechaNac,
      direccion,
      departamento,
      ciudad,
      sexo,
      contactoEmergencia,
      nombreEmergencia,
      emergenciaMedica,
      fechaInicioCurso,
      estado,
      entrenamientoPrevio,
      inscripcion
    } = req.body;

    // Validar email único
    const emailExists = await UserRepo.findUserByEmail(email);
    if (emailExists) {
      return res.status(400).json({
        success: false,
        message: 'El email ya está registrado'
      });
    }

    // Validar cédula única si es alumno
    if (role === 'alumno' && cedula) {
      const cedulaExists = await UserRepo.findUserByCedula(cedula);
      if (cedulaExists) {
        return res.status(400).json({
          success: false,
          message: 'La cédula ya está registrada'
        });
      }
    }

    const user = await UserRepo.createUser({
      email: email.toLowerCase(),
      password: password || 'password123',
      role: role || 'alumno',
      nombre,
      apellido,
      cedula,
      numeroTelefono,
      telefono,
      celular,
      fechaNac,
      direccion,
      departamento,
      ciudad,
      sexo,
      contactoEmergencia,
      nombreEmergencia,
      emergenciaMedica,
      fechaInicioCurso: fechaInicioCurso || new Date(),
      estado: estado || 'Cursando',
      entrenamientoPrevio,
      inscripcion
    });

    res.status(201).json({
      success: true,
      message: 'Usuario creado exitosamente',
      data: { user }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al crear usuario',
      error: error.message
    });
  }
};

// @desc    Actualizar usuario
// @route   PUT /api/users/:id
// @access  Private
export const updateUser = async (req, res) => {
  try {
    const {
      nombre,
      apellido,
      cedula,
      numeroTelefono,
      telefono,
      celular,
      fechaNac,
      direccion,
      departamento,
      ciudad,
      sexo,
      contactoEmergencia,
      nombreEmergencia,
      emergenciaMedica,
      estado,
      progreso,
      fechaInicioCurso
    } = req.body;

    const existingUser = await UserRepo.findUserById(req.params.id);
    if (!existingUser) {
      return res.status(404).json({
        success: false,
        message: 'Usuario no encontrado'
      });
    }

    // Validar cédula única si se está cambiando
    if (cedula && cedula !== existingUser.cedula) {
      const cedulaExists = await UserRepo.findUserByCedula(cedula);
      if (cedulaExists) {
        return res.status(400).json({
          success: false,
          message: 'La cédula ya está registrada'
        });
      }
    }

    const user = await UserRepo.updateUser(req.params.id, {
      nombre,
      apellido,
      cedula,
      numeroTelefono,
      telefono,
      celular,
      fechaNac,
      direccion,
      departamento,
      ciudad,
      sexo,
      contactoEmergencia,
      nombreEmergencia,
      emergenciaMedica,
      estado,
      progreso,
      fechaInicioCurso
    });

    res.json({
      success: true,
      message: 'Usuario actualizado exitosamente',
      data: { user }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al actualizar usuario',
      error: error.message
    });
  }
};

// @desc    Eliminar usuario
// @route   DELETE /api/users/:id
// @access  Private/Admin
export const deleteUser = async (req, res) => {
  try {
    const user = await UserRepo.findUserById(req.params.id);
    if (!user) {
      return res.status(404).json({
        success: false,
        message: 'Usuario no encontrado'
      });
    }

    await UserRepo.deleteUser(req.params.id);

    res.json({
      success: true,
      message: 'Usuario eliminado exitosamente'
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al eliminar usuario',
      error: error.message
    });
  }
};

// @desc    Agregar calificación a usuario
// @route   POST /api/users/:id/calificaciones
// @access  Private
export const addCalificacion = async (req, res) => {
  try {
    const { tipo, calificacion, observaciones } = req.body;

    const user = await UserRepo.findUserById(req.params.id);
    if (!user) {
      return res.status(404).json({
        success: false,
        message: 'Usuario no encontrado'
      });
    }

    const nuevaCalificacion = await UserRepo.addCalificacion(req.params.id, {
      tipo,
      calificacion,
      observaciones
    });

    // Obtener usuario actualizado con calificaciones
    const calificaciones = await UserRepo.getUserCalificaciones(req.params.id);
    const userUpdated = await UserRepo.findUserById(req.params.id);
    userUpdated.calificaciones = calificaciones;

    res.json({
      success: true,
      message: 'Calificación agregada exitosamente',
      data: { user: userUpdated }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al agregar calificación',
      error: error.message
    });
  }
};

// @desc    Obtener estadísticas de usuarios
// @route   GET /api/users/stats/overview
// @access  Private/Admin
export const getStats = async (req, res) => {
  try {
    const totalAlumnos = await UserRepo.countUsers({ role: 'alumno' });
    const alumnosCursando = await UserRepo.countUsers({ role: 'alumno', estado: 'Cursando' });
    const alumnosFinalizados = await UserRepo.countUsers({ role: 'alumno', estado: 'Finalizado' });
    
    const alumnos = await UserRepo.findUsers({ role: 'alumno' });
    const promedioProgreso = alumnos.length > 0
      ? Math.round(alumnos.reduce((acc, a) => acc + (a.progreso || 0), 0) / alumnos.length)
      : 0;

    res.json({
      success: true,
      data: {
        totalAlumnos,
        alumnosCursando,
        alumnosFinalizados,
        promedioProgreso
      }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener estadísticas',
      error: error.message
    });
  }
};

// @desc    Exportar historial de alumno a Excel
// @route   GET /api/users/:id/export-excel
// @access  Private
export const exportAlumnoExcel = async (req, res) => {
  try {
    const { id } = req.params;

    // Verificar que el usuario existe
    const user = await UserRepo.findUserById(id);
    if (!user) {
      return res.status(404).json({
        success: false,
        message: 'Usuario no encontrado'
      });
    }

    // Verificar permisos: solo el mismo usuario o admin puede exportar
    if (req.user.role !== 'admin' && req.user.id !== id) {
      return res.status(403).json({
        success: false,
        message: 'No tienes permisos para exportar este historial'
      });
    }

    // Generar el archivo Excel
    const workbook = await exportarAlumnoExcel(id);

    // Configurar headers para descarga
    const nombreArchivo = `${user.nombre || 'alumno'}_${user.apellido || ''}`.replace(/\s+/g, '_').toLowerCase();
    const fileName = `historial_${nombreArchivo}_${new Date().toISOString().split('T')[0]}.xlsx`;

    res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    res.setHeader('Content-Disposition', `attachment; filename="${fileName}"`);

    // Enviar el archivo
    await workbook.xlsx.write(res);
    res.end();
  } catch (error) {
    console.error('Error al exportar Excel:', error);
    res.status(500).json({
      success: false,
      message: 'Error al exportar historial a Excel',
      error: error.message
    });
  }
};
