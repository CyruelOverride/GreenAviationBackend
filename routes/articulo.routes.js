import express from 'express';
import {
  getArticulos,
  getArticuloById,
  getArticuloBySlug,
  createArticulo,
  updateArticulo,
  deleteArticulo,
  getArticuloRecursos,
  addArticuloRecursos,
  removeArticuloRecurso
} from '../controllers/articulo.controller.js';
import { authenticate, optionalAuthenticate, isAdmin } from '../middleware/auth.middleware.js';

const router = express.Router();

// Lectura pública: listado y por slug (sin token solo ven publicados)
router.get('/', optionalAuthenticate, getArticulos);
router.get('/slug/:slug', optionalAuthenticate, getArticuloBySlug);

router.use(authenticate);

router.get('/:id', getArticuloById);

// Solo admin puede crear, editar y eliminar artículos (instructores = admin en este proyecto)
router.post('/', isAdmin, createArticulo);
router.put('/:id', updateArticulo); // el controlador verifica autor o admin
router.delete('/:id', deleteArticulo); // el controlador verifica autor o admin

// Recursos del artículo
router.get('/:id/recursos', getArticuloRecursos);
router.post('/:id/recursos', addArticuloRecursos);
router.delete('/:id/recursos/:recursoId', removeArticuloRecurso);

export default router;
