# GreenAviation Backend API

Backend API para el sistema de gestión de GreenAviation Campus. Desarrollado con Node.js, Express y PostgreSQL.

## 🚀 Características

- **Autenticación JWT**: Sistema seguro de autenticación con tokens
- **Gestión de Usuarios**: CRUD completo para alumnos y administradores
- **Gestión de Vuelos**: Registro y seguimiento de vuelos de alumnos
- **Roles y Permisos**: Sistema de roles (Admin/Alumno) con middleware de autorización
- **Validaciones**: Validación de datos en todas las rutas
- **Estadísticas**: Endpoints para obtener estadísticas del sistema

## 📋 Requisitos Previos

- Node.js (v18 o superior)
- PostgreSQL (v12 o superior)
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

3. Crear la base de datos en PostgreSQL:
```sql
CREATE DATABASE greenaviation;
```

4. Ejecutar el schema SQL:
```bash
# Ejecutar el archivo schema_postgresql.sql en tu base de datos
psql -U tu_usuario -d greenaviation -f database/schema_postgresql.sql
```

5. Editar `.env` con tus configuraciones:
```env
PORT=5000
DATABASE_URL=postgresql://usuario:contraseña@localhost:5432/greenaviation
JWT_SECRET=tu_secret_key_muy_segura_aqui
JWT_EXPIRE=7d
```

6. Poblar la base de datos con datos de ejemplo (opcional):
```bash
npm run seed
```

7. Iniciar servidor:
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
├── database/              # Configuración de base de datos
│   ├── connection.js     # Conexión a PostgreSQL
│   └── schema_postgresql.sql  # Schema SQL
├── models/               # Repositorios de datos
│   ├── User.repository.js
│   └── Flight.repository.js
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

La tabla `users` almacena la información de usuarios. Las calificaciones se almacenan en la tabla separada `calificaciones`.

**Tabla: users**
- `id`: UUID (PK)
- `email`: VARCHAR (único, requerido)
- `password`: VARCHAR (hasheado con bcrypt)
- `role`: VARCHAR ('admin' | 'alumno')
- `nombre`, `apellido`: VARCHAR
- `cedula`: VARCHAR (único)
- `numero_telefono`: VARCHAR
- `edad`: INT
- `fecha_inicio_curso`: DATE
- `estado`: VARCHAR ('Cursando' | 'Finalizado')
- `progreso`: INT (0-100)
- `curso`: VARCHAR
- `ultimo_acceso`: TIMESTAMP
- `created_at`, `updated_at`: TIMESTAMP

**Tabla: calificaciones**
- `id`: UUID (PK)
- `user_id`: UUID (FK a users)
- `tipo`: VARCHAR
- `calificacion`: INT (0-100)
- `fecha`: TIMESTAMP
- `observaciones`: TEXT

### Vuelo (Flight)

**Tabla: flights**
- `id`: UUID (PK)
- `alumno_id`: UUID (FK a users)
- `fecha`: DATE
- `duracion`: INT (minutos)
- `calificacion`: INT (0-100)
- `tipo_vuelo`: VARCHAR ('Solo' | 'Dual' | 'Chequeo' | 'Práctico' | 'Otro')
- `aeronave_tipo`, `aeronave_matricula`: VARCHAR
- `instructor_nombre`, `instructor_licencia`: VARCHAR
- `observaciones`: TEXT
- `horas_vuelo_tipo`: VARCHAR
- `horas_vuelo_cantidad`: DECIMAL
- `estado`: VARCHAR ('Completado' | 'Cancelado' | 'Reprogramado')
- `created_at`, `updated_at`: TIMESTAMP

**Tabla: maniobras**
- `id`: UUID (PK)
- `flight_id`: UUID (FK a flights)
- `nombre`: VARCHAR
- `calificacion`: INT (0-100)
- `observaciones`: TEXT
- `completada`: BOOLEAN

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
  "alumno": "uuid-del-alumno",
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
- La base de datos usa PostgreSQL con UUIDs como IDs primarios
- Las calificaciones y maniobras se almacenan en tablas separadas para mejor normalización

## 🚀 Próximos Pasos

- [ ] Agregar validación de datos con express-validator
- [ ] Implementar paginación en listados
- [ ] Agregar filtros avanzados
- [ ] Implementar logs de auditoría
- [ ] Agregar tests unitarios e integración

"# GreenAviationBackend" 
