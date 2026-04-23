import express from 'express';
import {
  createPregunta,
  getPreguntasByCapitulo,
  updatePregunta,
  updateOpcion
} from '../controllers/pregunta.controller.js';
import { authenticate, isAdmin } from '../middleware/auth.middleware.js';

const router = express.Router();

// Todas las rutas requieren autenticación
router.use(authenticate);

// Obtener preguntas por capítulo (todos los usuarios autenticados)
router.get('/', getPreguntasByCapitulo);

// Crear pregunta con opciones (solo admin)
router.post('/', isAdmin, createPregunta);

// Actualizar pregunta (solo admin)
router.put('/:id', isAdmin, updatePregunta);

export default router;

