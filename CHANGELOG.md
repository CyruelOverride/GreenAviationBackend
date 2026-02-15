# Changelog

## [1.0.0] - 2026-02-14

### Migración a PostgreSQL
- ✅ Migrado de MongoDB a PostgreSQL
- ✅ Creados repositorios para User y Flight
- ✅ Actualizado schema SQL para PostgreSQL
- ✅ Configurada conexión SSL para servicios remotos

### Cambios en Base de Datos
- ✅ Cambiado tipo de `calificacion` en tabla `maniobras` de INT a VARCHAR(50)
- ✅ Script de migración creado: `npm run migrate:maniobras`

### Limpieza para Producción
- ✅ Eliminados modelos antiguos de MongoDB (User.model.js, Flight.model.js)
- ✅ Eliminado schema SQL de MySQL (solo se mantiene PostgreSQL)
- ✅ Eliminados archivos de prueba (test-env.js)
- ✅ Optimizados logs para producción (menos verbosos)
- ✅ Mejorado manejo de errores (no expone información sensible)
- ✅ Creado .gitignore completo
- ✅ Documentación de producción creada

### Seguridad
- ✅ Logs sensibles solo en desarrollo
- ✅ Errores no exponen información sensible en producción
- ✅ Variables de entorno protegidas en .gitignore

### Scripts
- `npm start` - Iniciar en producción
- `npm run dev` - Desarrollo con nodemon
- `npm run seed` - Poblar base de datos
- `npm run migrate:maniobras` - Migrar calificaciones a string

