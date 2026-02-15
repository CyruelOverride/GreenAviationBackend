import express from 'express';
import {
  getAllUsers,
  getUserById,
  createUser,
  updateUser,
  deleteUser,
  addCalificacion,
  getStats
} from '../controllers/user.controller.js';
import { authenticate, isAdmin, isOwnerOrAdmin } from '../middleware/auth.middleware.js';

const router = express.Router();

// Todas las rutas requieren autenticación
router.use(authenticate);

// Rutas de estadísticas (solo admin)
router.get('/stats/overview', isAdmin, getStats);

// Rutas CRUD
router.get('/', isAdmin, getAllUsers);
router.get('/:id', getUserById);
router.post('/', isAdmin, createUser);
router.put('/:id', isOwnerOrAdmin, updateUser);
router.delete('/:id', isAdmin, deleteUser);

// Ruta para agregar calificaciones
router.post('/:id/calificaciones', isAdmin, addCalificacion);

export default router;

