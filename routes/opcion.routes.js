import express from 'express';
import { updateOpcion } from '../controllers/pregunta.controller.js';
import { authenticate, isAdmin } from '../middleware/auth.middleware.js';

const router = express.Router();

// Todas las rutas requieren autenticación
router.use(authenticate);

// Actualizar opción (solo admin)
router.put('/:id', isAdmin, updateOpcion);

export default router;

