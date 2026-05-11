-- Código de acceso opcional (Zoom, Meet, etc.) para clases online y grabaciones
ALTER TABLE clases_online
  ADD COLUMN IF NOT EXISTS codigo_acceso VARCHAR(255);

COMMENT ON COLUMN clases_online.codigo_acceso IS 'Código o contraseña de acceso opcional a la reunión o grabación';
