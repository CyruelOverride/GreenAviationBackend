import express from 'express';
import {
  getAllClasesOnline,
  getClaseOnlineById,
  createClaseOnline,
  updateClaseOnline,
  deleteClaseOnline,
  registrarAlumnoEnClase,
  eliminarAlumnoDeClase
} from '../controllers/claseOnline.controller.js';
import { authenticate, isAdmin } from '../middleware/auth.middleware.js';

const router = express.Router();

// Todas las rutas requieren autenticación
router.use(authenticate);

// Rutas CRUD (solo admin puede crear, actualizar y eliminar)
router.get('/', getAllClasesOnline);
router.get('/:id', getClaseOnlineById);
router.post('/', isAdmin, createClaseOnline);
router.put('/:id', isAdmin, updateClaseOnline);
router.delete('/:id', isAdmin, deleteClaseOnline);

// Rutas para gestión de alumnos
router.post('/:id/registrar-alumno', registrarAlumnoEnClase);
router.delete('/:id/alumnos/:alumnoId', isAdmin, eliminarAlumnoDeClase);

export default router;

