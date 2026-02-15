# Checklist de Producción

## ✅ Antes de Desplegar

### 1. Variables de Entorno

Asegúrate de configurar las siguientes variables de entorno en tu plataforma de hosting (Render, Heroku, Railway, etc.):

```env
NODE_ENV=production
PORT=5000
DATABASE_URL=postgresql://usuario:contraseña@host:puerto/database
JWT_SECRET=clave_secreta_muy_larga_y_aleatoria_minimo_32_caracteres
JWT_EXPIRE=7d
```

**⚠️ IMPORTANTE:**
- `JWT_SECRET` debe ser una cadena aleatoria y segura (mínimo 32 caracteres)
- `DATABASE_URL` debe ser la URL completa de tu base de datos PostgreSQL
- `NODE_ENV=production` activa el modo producción (menos logs, mejor seguridad)

### 2. Base de Datos

- [ ] Ejecutar el schema SQL: `database/schema_postgresql.sql`
- [ ] Ejecutar migraciones si es necesario: `npm run migrate:maniobras`
- [ ] Verificar que la conexión SSL esté configurada correctamente

### 3. Seguridad

- [ ] Verificar que `.env` esté en `.gitignore` (ya incluido)
- [ ] No commitear credenciales o tokens
- [ ] Usar HTTPS en producción
- [ ] Configurar CORS apropiadamente si es necesario

### 4. Dependencias

```bash
npm install --production
```

### 5. Scripts Disponibles

- `npm start` - Iniciar servidor en producción
- `npm run dev` - Desarrollo (solo local)
- `npm run seed` - Poblar base de datos (solo desarrollo)
- `npm run migrate:maniobras` - Ejecutar migración de maniobras

## 🚀 Comandos de Despliegue

### Render / Railway / Heroku

El servidor se inicia automáticamente con:
```bash
npm start
```

### Verificación Post-Despliegue

1. Verificar health check: `GET /api/health`
2. Probar autenticación: `POST /api/auth/login`
3. Verificar logs del servidor

## 📝 Notas de Producción

- Los logs en producción son mínimos (no se muestran queries, conexiones, etc.)
- Los errores no exponen información sensible
- La conexión a PostgreSQL usa SSL automáticamente para servicios remotos
- El servidor se reinicia automáticamente si hay errores de conexión

## 🔧 Troubleshooting

### Error de conexión a base de datos
- Verificar que `DATABASE_URL` esté correctamente configurada
- Verificar que la base de datos permita conexiones externas
- Verificar configuración SSL si es necesario

### Error de autenticación JWT
- Verificar que `JWT_SECRET` esté configurado
- Verificar que el mismo `JWT_SECRET` se use en todos los servicios

### Logs no aparecen
- En producción, los logs son mínimos por diseño
- Verificar logs en la plataforma de hosting

