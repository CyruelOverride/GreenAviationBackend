import express from 'express';
import { register, login, getMe, changePassword } from '../controllers/auth.controller.js';
import { authenticate } from '../middleware/auth.middleware.js';

const router = express.Router();

// Rutas públicas
router.post('/register', register);
router.post('/login', login);

// Rutas protegidas
router.get('/me', authenticate, getMe);
router.put('/change-password', authenticate, changePassword);

export default router;

