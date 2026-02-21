-- ============================================
-- Migración: Agregar campo drive_link a users
-- Este campo almacena el link de Google Drive del alumno
-- ============================================

-- Agregar columna drive_link a la tabla users
ALTER TABLE users
ADD COLUMN IF NOT EXISTS drive_link VARCHAR(500);

-- Comentario: Este campo almacena el link de la carpeta de Drive del alumno
COMMENT ON COLUMN users.drive_link IS 'Link de Google Drive del alumno para ver su carpeta';

