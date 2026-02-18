import * as FlightRepo from '../models/Flight.repository.js';
import * as UserRepo from '../models/User.repository.js';

// @desc    Obtener todos los vuelos
// @route   GET /api/flights
// @access  Private
export const getAllFlights = async (req, res) => {
  try {
    const { alumnoId, fechaDesde, fechaHasta, tipoVuelo } = req.query;
    const filters = {};

    // Si es alumno, solo puede ver sus vuelos
    if (req.user.role === 'alumno') {
      filters.alumnoId = req.user.id;
    } else if (alumnoId) {
      filters.alumnoId = alumnoId;
    }

    if (fechaDesde) filters.fechaDesde = fechaDesde;
    if (fechaHasta) filters.fechaHasta = fechaHasta;
    if (tipoVuelo) filters.tipoVuelo = tipoVuelo;

    const flights = await FlightRepo.findFlights(filters);

    res.json({
      success: true,
      count: flights.length,
      data: { flights }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener vuelos',
      error: error.message
    });
  }
};

// @desc    Obtener un vuelo por ID
// @route   GET /api/flights/:id
// @access  Private
export const getFlightById = async (req, res) => {
  try {
    const flight = await FlightRepo.findFlightById(req.params.id);

    if (!flight) {
      return res.status(404).json({
        success: false,
        message: 'Vuelo no encontrado'
      });
    }

    // Verificar que el usuario tenga acceso
    if (req.user.role === 'alumno' && flight.alumnoId !== req.user.id) {
      return res.status(403).json({
        success: false,
        message: 'No tienes permisos para ver este vuelo'
      });
    }

    res.json({
      success: true,
      data: { flight }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener vuelo',
      error: error.message
    });
  }
};

// @desc    Crear nuevo vuelo
// @route   POST /api/flights
// @access  Private
export const createFlight = async (req, res) => {
  try {
    const {
      alumno,
      fecha,
      duracion,
      calificacion,
      maniobras,
      tipoVuelo,
      tipo,
      matricula,
      modelo,
      aerod,
      inspectorDinacia,
      aeronave,
      instructor,
      observaciones,
      horasVuelo,
      estado
    } = req.body;

    // Si es alumno, solo puede crear vuelos para sí mismo
    const alumnoId = req.user.role === 'admin' ? alumno : req.user.id;

    // Verificar que el alumno existe
    const alumnoExists = await UserRepo.findUserById(alumnoId);
    if (!alumnoExists) {
      return res.status(404).json({
        success: false,
        message: 'Alumno no encontrado'
      });
    }

    const flight = await FlightRepo.createFlight({
      alumnoId,
      fecha: fecha || new Date(),
      duracion,
      calificacion,
      maniobras: maniobras || [],
      tipoVuelo: tipoVuelo || 'Dual',
      tipo,
      matricula,
      modelo,
      aerod,
      inspectorDinacia,
      aeronave,
      instructor,
      observaciones,
      horasVuelo,
      estado: estado || 'Completado'
    });

    res.status(201).json({
      success: true,
      message: 'Vuelo creado exitosamente',
      data: { flight }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al crear vuelo',
      error: error.message
    });
  }
};

// @desc    Actualizar vuelo
// @route   PUT /api/flights/:id
// @access  Private
export const updateFlight = async (req, res) => {
  try {
    const flight = await FlightRepo.findFlightById(req.params.id);

    if (!flight) {
      return res.status(404).json({
        success: false,
        message: 'Vuelo no encontrado'
      });
    }

    // Verificar permisos
    if (req.user.role === 'alumno' && flight.alumnoId !== req.user.id) {
      return res.status(403).json({
        success: false,
        message: 'No tienes permisos para editar este vuelo'
      });
    }

    const {
      fecha,
      duracion,
      calificacion,
      maniobras,
      tipoVuelo,
      tipo,
      matricula,
      modelo,
      aerod,
      inspectorDinacia,
      aeronave,
      instructor,
      observaciones,
      horasVuelo,
      estado
    } = req.body;

    const updatedFlight = await FlightRepo.updateFlight(req.params.id, {
      fecha,
      duracion,
      calificacion,
      maniobras,
      tipoVuelo,
      tipo,
      matricula,
      modelo,
      aerod,
      inspectorDinacia,
      aeronave,
      instructor,
      observaciones,
      horasVuelo,
      estado
    });

    res.json({
      success: true,
      message: 'Vuelo actualizado exitosamente',
      data: { flight: updatedFlight }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al actualizar vuelo',
      error: error.message
    });
  }
};

// @desc    Eliminar vuelo
// @route   DELETE /api/flights/:id
// @access  Private/Admin
export const deleteFlight = async (req, res) => {
  try {
    const flight = await FlightRepo.findFlightById(req.params.id);
    if (!flight) {
      return res.status(404).json({
        success: false,
        message: 'Vuelo no encontrado'
      });
    }

    await FlightRepo.deleteFlight(req.params.id);

    res.json({
      success: true,
      message: 'Vuelo eliminado exitosamente'
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al eliminar vuelo',
      error: error.message
    });
  }
};

// @desc    Obtener vuelos de un alumno específico
// @route   GET /api/flights/alumno/:alumnoId
// @access  Private
export const getFlightsByAlumno = async (req, res) => {
  try {
    const { alumnoId } = req.params;

    // Verificar permisos
    if (req.user.role === 'alumno' && alumnoId !== req.user.id) {
      return res.status(403).json({
        success: false,
        message: 'No tienes permisos para ver estos vuelos'
      });
    }

    const flights = await FlightRepo.findFlights({ alumnoId });

    res.json({
      success: true,
      count: flights.length,
      data: { flights }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener vuelos del alumno',
      error: error.message
    });
  }
};

// @desc    Obtener estadísticas de vuelos
// @route   GET /api/flights/stats/overview
// @access  Private/Admin
export const getFlightStats = async (req, res) => {
  try {
    const stats = await FlightRepo.getFlightStats();

    res.json({
      success: true,
      data: stats
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error al obtener estadísticas de vuelos',
      error: error.message
    });
  }
};
