# Configuración del Backend

## Variables de Entorno

Crea un archivo `.env` en la raíz del proyecto con las siguientes variables:

```env
# Puerto del servidor (opcional, por defecto 5000)
PORT=5000

# URL de conexión a PostgreSQL (OBLIGATORIO)
DATABASE_URL=postgresql://usuario:contraseña@host:puerto/database

# Secret key para JWT (OBLIGATORIO)
# Genera una clave aleatoria con: node -e "console.log(require('crypto').randomBytes(64).toString('hex'))"
JWT_SECRET=tu_clave_secreta_muy_larga_y_aleatoria_aqui

# Tiempo de expiración del token JWT (opcional, por defecto 7d)
JWT_EXPIRE=7d

# Entorno (opcional, pero recomendado en producción)
NODE_ENV=production
```

## 🔑 Generar JWT_SECRET

Ejecuta este comando para generar una clave segura:

```bash
node -e "console.log(require('crypto').randomBytes(64).toString('hex'))"
```

O usando OpenSSL:
```bash
openssl rand -hex 64
```

**Importante:**
- La clave debe ser aleatoria y larga (mínimo 32 caracteres, recomendado 64+)
- NO compartas esta clave públicamente
- Usa diferentes claves en desarrollo y producción

## Notas

- El archivo `.env` no debe ser commiteado (ya está en .gitignore)
- Para PostgreSQL local, asegúrate de tener PostgreSQL corriendo
- El formato de `DATABASE_URL` es: `postgresql://usuario:contraseña@host:puerto/nombre_base_datos`
- En producción, configura estas variables en el panel de tu plataforma de hosting
