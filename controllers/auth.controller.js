import * as UserRepo from '../models/User.repository.js';
import jwt from 'jsonwebtoken';

// Generar token JWT
const generateToken = (id) => {
  return jwt.sign({ id }, process.env.JWT_SECRET, {
    expiresIn: process.env.JWT_EXPIRE || '7d'
  });
};

// @desc    Registrar nuevo usuario
// @route   POST /api/auth/register
// @access  Public
export const register = async (req, res) => {
  try {
    const { email, password, role, nombre, apellido, cedula, numeroTelefono, edad } = req.body;

    // Validar que el email no exista
    const userExists = await UserRepo.findUserByEmail(email);
    if (userExists) {
      return res.status(400).json({
        success: false,
        message: 'El email ya está registrado'
      });
    }

    // Validar cédula si es alumno
    if (role === 'alumno' && cedula) {
      const cedulaExists = await UserRepo.findUserByCedula(cedula);
      if (cedulaExists) {
        return res.status(400).json({
          success: false,
          message: 'La cédula ya está registrada'
        });
      }
    }

    // Crear usuario
    const user = await UserRepo.createUser({
      email: email.toLowerCase(),
      password,
      role: role || 'alumno',
      nombre,
      apellido,
      cedula,
      numeroTelefono,
      edad,
      fechaInicioCurso: new Date()
    });

    // Generar token
    const token = generateToken(user.id);

    res.status(201).json({
      success: true,
      message: 'Usuario registrado exitosamente',
      data: {
        user: {
          id: user.id,
          email: user.email,
          role: user.role,
          nombre: user.nombre,
          apellido: user.apellido
        },
        token
      }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al registrar usuario',
      error: error.message
    });
  }
};

// @desc    Iniciar sesión
// @route   POST /api/auth/login
// @access  Public
export const login = async (req, res) => {
  try {
    const { email, password } = req.body;

    if (!email || !password) {
      return res.status(400).json({
        success: false,
        message: 'Por favor proporciona email y contraseña'
      });
    }

    // Buscar usuario
    const user = await UserRepo.findUserByEmail(email);
    if (!user) {
      return res.status(401).json({
        success: false,
        message: 'Credenciales inválidas'
      });
    }

    // Verificar contraseña
    const isPasswordValid = await user.comparePassword(password);
    if (!isPasswordValid) {
      return res.status(401).json({
        success: false,
        message: 'Credenciales inválidas'
      });
    }

    // Actualizar último acceso
    await user.updateLastAccess();

    // Generar token
    const token = generateToken(user.id);

    res.json({
      success: true,
      message: 'Inicio de sesión exitoso',
      data: {
        user: {
          id: user.id,
          email: user.email,
          role: user.role,
          nombre: user.nombre,
          apellido: user.apellido,
          nombreCompleto: user.nombreCompleto,
          progreso: user.progreso,
          estado: user.estado
        },
        token
      }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al iniciar sesión',
      error: error.message
    });
  }
};

// @desc    Obtener usuario actual
// @route   GET /api/auth/me
// @access  Private
export const getMe = async (req, res) => {
  try {
    const user = await UserRepo.findUserById(req.user.id);
    
    if (!user) {
      return res.status(404).json({
        success: false,
        message: 'Usuario no encontrado'
      });
    }

    // Obtener calificaciones del usuario
    const calificaciones = await UserRepo.getUserCalificaciones(req.user.id);
    user.calificaciones = calificaciones;

    res.json({
      success: true,
      data: { user }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener información del usuario',
      error: error.message
    });
  }
};
