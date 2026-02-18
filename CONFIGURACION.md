# Configuración del Backend

## Variables de Entorno

Crea un archivo `.env` en la raíz del proyecto Back (plantilla) con las siguientes variables:

```env
# Puerto del servidor
PORT=5000

# URL de conexión a PostgreSQL
DATABASE_URL=postgresql://usuario:contraseña@localhost:5432/greenaviation

# Secret key para JWT (cambiar en producción)
JWT_SECRET=tu_secret_key_muy_segura_aqui_cambiar_en_produccion

# Tiempo de expiración del token JWT
JWT_EXPIRE=7d
```

### Para Producción con PostgreSQL Remoto (Render, Heroku, etc.)

```env
PORT=5000
DATABASE_URL=postgresql://usuario:contraseña@host:puerto/database
JWT_SECRET=tu_secret_key_muy_segura_y_larga_para_produccion
JWT_EXPIRE=7d
```

## Notas

- El archivo `.env` no debe ser commiteado (ya está en .gitignore)
- Cambia `JWT_SECRET` por una clave segura y aleatoria en producción
- Para PostgreSQL local, asegúrate de tener PostgreSQL corriendo en tu sistema
- El formato de `DATABASE_URL` para PostgreSQL es: `postgresql://usuario:contraseña@host:puerto/nombre_base_datos`

