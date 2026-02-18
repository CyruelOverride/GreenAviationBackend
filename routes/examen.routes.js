import express from 'express';
import {
  createExamen,
  getExamen,
  getExamenes,
  responderPregunta,
  finalizarExamen,
  getEstadisticas
} from '../controllers/examen.controller.js';
import { authenticate, isOwnerOrAdmin } from '../middleware/auth.middleware.js';

const router = express.Router();

// Todas las rutas requieren autenticación
router.use(authenticate);

// Rutas de estadísticas
router.get('/stats', getEstadisticas);

// Rutas CRUD
router.get('/', getExamenes);
router.get('/:id', getExamen);
router.post('/', createExamen);

// Ruta para responder pregunta
router.put('/:id/preguntas/:preguntaId', responderPregunta);

// Ruta para finalizar examen
router.post('/:id/finalizar', finalizarExamen);

export default router;

