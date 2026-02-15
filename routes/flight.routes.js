import express from 'express';
import {
  getAllFlights,
  getFlightById,
  createFlight,
  updateFlight,
  deleteFlight,
  getFlightsByAlumno,
  getFlightStats
} from '../controllers/flight.controller.js';
import { authenticate, isAdmin } from '../middleware/auth.middleware.js';

const router = express.Router();

// Todas las rutas requieren autenticación
router.use(authenticate);

// Rutas de estadísticas (solo admin)
router.get('/stats/overview', isAdmin, getFlightStats);

// Rutas CRUD
router.get('/', getAllFlights);
router.get('/alumno/:alumnoId', getFlightsByAlumno);
router.get('/:id', getFlightById);
router.post('/', createFlight);
router.put('/:id', updateFlight);
router.delete('/:id', isAdmin, deleteFlight);

export default router;

