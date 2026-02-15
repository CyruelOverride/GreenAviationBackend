# Scripts de Base de Datos

## ✅ El Backend Usa PostgreSQL

El backend está configurado para **PostgreSQL**. 

---

## 🗄️ Configuración Inicial

### 1. Crear la base de datos

```bash
# Conectarte a PostgreSQL
psql -U postgres

# Crear la base de datos
CREATE DATABASE greenaviation;
```

### 2. Ejecutar el schema SQL

```bash
# Desde la línea de comandos
psql -U tu_usuario -d greenaviation -f database/schema_postgresql.sql

# O desde psql
\c greenaviation
\i database/schema_postgresql.sql
```

### 3. Poblar con datos de ejemplo

```bash
npm run seed
```

Este comando:
- ✅ Crea los usuarios admin y alumno
- ✅ Hashea las contraseñas automáticamente
- ✅ Crea datos de ejemplo (alumnos, calificaciones y vuelos)
- ✅ Todo listo para usar

---

## 📋 Estructura de Tablas

### `users`
Almacena información de usuarios (admin y alumnos).

### `calificaciones`
Almacena las calificaciones de los alumnos (relación 1:N con users).

### `flights`
Almacena información de vuelos realizados por alumnos.

### `maniobras`
Almacena las maniobras realizadas en cada vuelo (relación 1:N con flights).

---

## 🔧 Variables de Entorno

Asegúrate de tener configurado `DATABASE_URL` en tu `.env`:

```env
DATABASE_URL=postgresql://usuario:contraseña@localhost:5432/greenaviation
```

---

## 🎯 Resumen

**Orden de ejecución:**

1. Crear base de datos: `CREATE DATABASE greenaviation;`
2. Ejecutar schema: `psql -U usuario -d greenaviation -f database/schema_postgresql.sql`
3. Poblar datos: `npm run seed`

**¡Listo para usar!**
