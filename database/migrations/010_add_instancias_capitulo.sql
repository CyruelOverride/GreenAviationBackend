-- Agrega el atributo instancias a la tabla capitulo.
-- Define cuántas veces puede rendir un alumno el examen de ese capítulo.
-- DEFAULT 1: un intento por defecto para capítulos existentes.
ALTER TABLE capitulo
  ADD COLUMN IF NOT EXISTS instancias INTEGER NOT NULL DEFAULT 1;
