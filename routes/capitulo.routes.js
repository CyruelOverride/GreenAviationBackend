import express from 'express';
import { listCapitulos, createCapitulo, patchCapitulo } from '../controllers/capitulo.controller.js';
import { authenticate, isAdmin } from '../middleware/auth.middleware.js';

const router = express.Router();

router.use(authenticate);
router.get('/', listCapitulos);
router.post('/', isAdmin, createCapitulo);
router.patch('/:id', isAdmin, patchCapitulo);

export default router;
