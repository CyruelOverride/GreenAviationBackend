import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import pool from './database/connection.js';
import authRoutes from './routes/auth.routes.js';
import userRoutes from './routes/user.routes.js';
import flightRoutes from './routes/flight.routes.js';

// Cargar variables de entorno
dotenv.config();

const app = express();

// Middlewares
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Rutas
app.use('/api/auth', authRoutes);
app.use('/api/users', userRoutes);
app.use('/api/flights', flightRoutes);

// Ruta de prueba
app.get('/api/health', (req, res) => {
  res.json({ 
    status: 'OK', 
    message: 'GreenAviation API está funcionando',
    timestamp: new Date().toISOString()
  });
});

// Manejo de errores
app.use((err, req, res, next) => {
  // En producción, no loggear el stack completo
  if (process.env.NODE_ENV === 'production') {
    console.error('Error:', err.message);
  } else {
    console.error('Error completo:', err.stack);
  }
  
  res.status(500).json({ 
    success: false, 
    message: 'Error interno del servidor',
    error: process.env.NODE_ENV === 'development' ? err.message : undefined
  });
});

// Iniciar servidor
const PORT = process.env.PORT || 5000;

// Probar conexión a PostgreSQL antes de iniciar el servidor
pool.query('SELECT NOW()')
  .then(() => {
    if (process.env.NODE_ENV !== 'production') {
      console.log('✅ Conectado a PostgreSQL');
    }
    app.listen(PORT, () => {
      console.log(`🚀 Servidor corriendo en puerto ${PORT}`);
      if (process.env.NODE_ENV !== 'production') {
        console.log(`📡 API disponible en http://localhost:${PORT}/api`);
      }
    });
  })
  .catch((error) => {
    console.error('❌ Error conectando a PostgreSQL:', error.message);
    if (process.env.NODE_ENV === 'production') {
      console.error('   Verifica la configuración de DATABASE_URL');
    }
    process.exit(1);
  });

export default app;

