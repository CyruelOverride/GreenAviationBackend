ALTER TABLE clases_online
  ADD COLUMN IF NOT EXISTS titulo VARCHAR(255) NOT NULL DEFAULT 'Clase online';

COMMENT ON COLUMN clases_online.titulo IS 'Título de la clase online';