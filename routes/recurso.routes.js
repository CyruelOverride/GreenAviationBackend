import express from 'express';
import multer from 'multer';
import path from 'path';
import { fileURLToPath } from 'url';
import {
  getRecursos,
  getRecursoById,
  createRecurso,
  uploadRecurso,
  updateRecurso,
  deleteRecurso,
  getCategorias
} from '../controllers/recurso.controller.js';
import { authenticate, isAdmin } from '../middleware/auth.middleware.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const router = express.Router();

// Configuración de multer para subir archivos al public del frontend
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    // Ruta al directorio public/documentos del frontend
    const uploadPath = path.resolve(__dirname, '../../Front (plantilla)/public/documentos');
    cb(null, uploadPath);
  },
  filename: (req, file, cb) => {
    // Mantener el nombre original, pero sanitizar caracteres especiales
    const sanitizedName = file.originalname
      .replace(/[^a-zA-Z0-9.\-_\s]/g, '')
      .replace(/\s+/g, '_');
    
    // Si ya existe, agregar timestamp
    const uniqueName = `${Date.now()}-${sanitizedName}`;
    cb(null, uniqueName);
  }
});

const fileFilter = (req, file, cb) => {
  // Tipos de archivo permitidos
  const allowedTypes = [
    'application/pdf',
    'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'application/vnd.ms-excel',
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    'application/vnd.ms-powerpoint',
    'application/vnd.openxmlformats-officedocument.presentationml.presentation',
    'image/jpeg',
    'image/png',
    'image/gif',
    'text/plain'
  ];

  if (allowedTypes.includes(file.mimetype)) {
    cb(null, true);
  } else {
    cb(new Error('Tipo de archivo no permitido'), false);
  }
};

const upload = multer({
  storage,
  fileFilter,
  limits: {
    fileSize: 50 * 1024 * 1024 // 50MB máximo
  }
});

// Todas las rutas requieren autenticación
router.use(authenticate);

// Rutas públicas para usuarios autenticados
router.get('/', getRecursos);
router.get('/categorias', getCategorias);
router.get('/:id', getRecursoById);

// Rutas solo para admin
router.post('/', isAdmin, createRecurso);
router.post('/upload', isAdmin, upload.single('archivo'), uploadRecurso);
router.put('/:id', isAdmin, updateRecurso);
router.delete('/:id', isAdmin, deleteRecurso);

export default router;

