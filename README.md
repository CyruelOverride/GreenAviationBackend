# GreenAviation Backend API

Backend API para el sistema de gestión de GreenAviation Campus. Desarrollado con Node.js, Express y MongoDB.

## 🚀 Características

- **Autenticación JWT**: Sistema seguro de autenticación con tokens
- **Gestión de Usuarios**: CRUD completo para alumnos y administradores
- **Gestión de Vuelos**: Registro y seguimiento de vuelos de alumnos
- **Roles y Permisos**: Sistema de roles (Admin/Alumno) con middleware de autorización
- **Validaciones**: Validación de datos en todas las rutas
- **Estadísticas**: Endpoints para obtener estadísticas del sistema

## 📋 Requisitos Previos

- Node.js (v18 o superior)
- MongoDB (local o remoto)
- npm o yarn

## 🔧 Instalación

1. Instalar dependencias:
```bash
npm install
```

2. Configurar variables de entorno:
```bash
# Crear archivo .env manualmente
```

3. Editar `.env` con tus configuraciones:
```env
PORT=5000
DATABASE_URL=mongodb://localhost:27017/greenaviation
JWT_SECRET=tu_secret_key_muy_segura_aqui
JWT_EXPIRE=7d
```

4. Iniciar servidor:
```bash
# Desarrollo
npm run dev

# Producción
npm start
```

## 📚 Estructura del Proyecto

```
Back (plantilla)/
├── controllers/          # Controladores de lógica de negocio
│   ├── auth.controller.js
│   ├── user.controller.js
│   └── flight.controller.js
├── models/               # Modelos de MongoDB
│   ├── User.model.js
│   └── Flight.model.js
├── routes/               # Rutas de la API
│   ├── auth.routes.js
│   ├── user.routes.js
│   └── flight.routes.js
├── middleware/           # Middleware personalizado
│   └── auth.middleware.js
├── server.js            # Archivo principal
├── package.json
└── README.md
```

## 🔌 Endpoints de la API

### Autenticación

- `POST /api/auth/register` - Registrar nuevo usuario
- `POST /api/auth/login` - Iniciar sesión
- `GET /api/auth/me` - Obtener usuario actual (requiere token)

### Usuarios

- `GET /api/users` - Obtener todos los usuarios (Admin)
- `GET /api/users/:id` - Obtener usuario por ID
- `POST /api/users` - Crear nuevo usuario (Admin)
- `PUT /api/users/:id` - Actualizar usuario
- `DELETE /api/users/:id` - Eliminar usuario (Admin)
- `POST /api/users/:id/calificaciones` - Agregar calificación (Admin)
- `GET /api/users/stats/overview` - Estadísticas de usuarios (Admin)

### Vuelos

- `GET /api/flights` - Obtener todos los vuelos
- `GET /api/flights/:id` - Obtener vuelo por ID
- `GET /api/flights/alumno/:alumnoId` - Obtener vuelos de un alumno
- `POST /api/flights` - Crear nuevo vuelo
- `PUT /api/flights/:id` - Actualizar vuelo
- `DELETE /api/flights/:id` - Eliminar vuelo (Admin)
- `GET /api/flights/stats/overview` - Estadísticas de vuelos (Admin)

## 📝 Modelos de Datos

### Usuario (User)

```javascript
{
  email: String (único, requerido),
  password: String (requerido, hasheado),
  role: 'admin' | 'alumno',
  nombre: String,
  apellido: String,
  cedula: String (único),
  numeroTelefono: String,
  edad: Number,
  fechaInicioCurso: Date,
  estado: 'Cursando' | 'Finalizado',
  progreso: Number (0-100),
  calificaciones: [{
    tipo: String,
    calificacion: Number,
    fecha: Date,
    observaciones: String
  }],
  ultimoAcceso: Date,
  curso: String
}
```

### Vuelo (Flight)

```javascript
{
  alumno: ObjectId (referencia a User),
  fecha: Date,
  duracion: Number (minutos),
  calificacion: Number (0-100),
  maniobras: [{
    nombre: String,
    calificacion: Number,
    observaciones: String,
    completada: Boolean
  }],
  tipoVuelo: 'Solo' | 'Dual' | 'Chequeo' | 'Práctico' | 'Otro',
  aeronave: {
    tipo: String,
    matricula: String
  },
  instructor: {
    nombre: String,
    licencia: String
  },
  observaciones: String,
  horasVuelo: {
    tipo: 'Solo' | 'Dual' | 'Instrumental' | 'Noche',
    cantidad: Number
  },
  estado: 'Completado' | 'Cancelado' | 'Reprogramado'
}
```

## 🔐 Autenticación

Todas las rutas protegidas requieren un token JWT en el header:

```
Authorization: Bearer <token>
```

## 🛡️ Roles y Permisos

- **Admin**: Acceso completo a todas las funcionalidades
- **Alumno**: Puede ver y editar solo su propia información y vuelos

## 📊 Ejemplos de Uso

### Registrar Usuario
```bash
POST /api/auth/register
{
  "email": "alumno@example.com",
  "password": "password123",
  "role": "alumno",
  "nombre": "Juan",
  "apellido": "Pérez",
  "cedula": "12345678",
  "numeroTelefono": "099123456",
  "edad": 25
}
```

### Iniciar Sesión
```bash
POST /api/auth/login
{
  "email": "alumno@example.com",
  "password": "password123"
}
```

### Crear Vuelo
```bash
POST /api/flights
Authorization: Bearer <token>
{
  "alumno": "507f1f77bcf86cd799439011",
  "fecha": "2024-01-15",
  "duracion": 90,
  "calificacion": 85,
  "maniobras": [
    {
      "nombre": "Despegue",
      "calificacion": 90,
      "completada": true
    }
  ],
  "tipoVuelo": "Dual"
}
```

## 🧪 Testing

Para probar la API, puedes usar herramientas como:
- Postman
- Insomnia
- curl
- Thunder Client (VS Code)

## 📝 Notas

- Las contraseñas se hashean automáticamente con bcrypt
- Los tokens JWT expiran según la configuración en `.env`
- Los alumnos solo pueden ver sus propios datos y vuelos
- Los administradores tienen acceso completo

## 🚀 Próximos Pasos

- [ ] Agregar validación de datos con express-validator
- [ ] Implementar paginación en listados
- [ ] Agregar filtros avanzados
- [ ] Implementar logs de auditoría
- [ ] Agregar tests unitarios e integración

"# GreenAviationBackend" 
