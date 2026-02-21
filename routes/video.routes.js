import express from 'express';
import {
  getVideoProgress,
  startVideo,
  checkExamUnlock
} from '../controllers/video.controller.js';
import { authenticate } from '../middleware/auth.middleware.js';

const router = express.Router();

// Todas las rutas requieren autenticación
router.use(authenticate);

// Obtener progreso de videos del usuario
router.get('/progress', getVideoProgress);

// Registrar inicio de visualización de un video
router.post('/start/:videoNumero', startVideo);

// Verificar si un examen está desbloqueado
router.get('/exam-unlock/:capitulo', checkExamUnlock);

export default router;

