-- ============================================
-- Migración: Agregar tabla de recursos adicionales
-- ============================================

-- Tabla para gestionar recursos (links de videos/drive y archivos descargables)
CREATE TABLE IF NOT EXISTS recursos (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Información del recurso
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    tipo VARCHAR(50) NOT NULL CHECK (tipo IN ('archivo', 'link_drive', 'link_video', 'link_externo')),
    categoria VARCHAR(100) NOT NULL DEFAULT 'general',
    
    -- Para archivos: ruta relativa en public/documentos
    -- Para links: URL completa
    ruta_o_url TEXT NOT NULL,
    
    -- Tamaño del archivo (si aplica)
    tamano VARCHAR(50),
    
    -- Extensión del archivo (si aplica)
    extension VARCHAR(20),
    
    -- Si está activo/visible
    activo BOOLEAN DEFAULT TRUE,
    
    -- Orden de visualización
    orden INT DEFAULT 0,
    
    -- Usuario que lo creó
    creado_por UUID REFERENCES users(id) ON DELETE SET NULL,
    
    -- Timestamps
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger para actualizar updated_at automáticamente
CREATE TRIGGER update_recursos_updated_at BEFORE UPDATE ON recursos
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Índices
CREATE INDEX IF NOT EXISTS idx_recursos_tipo ON recursos(tipo);
CREATE INDEX IF NOT EXISTS idx_recursos_categoria ON recursos(categoria);
CREATE INDEX IF NOT EXISTS idx_recursos_activo ON recursos(activo);

-- Comentarios
COMMENT ON TABLE recursos IS 'Almacena recursos adicionales gestionados por administradores';
COMMENT ON COLUMN recursos.tipo IS 'Tipo de recurso: archivo (descargable), link_drive, link_video, link_externo';
COMMENT ON COLUMN recursos.ruta_o_url IS 'Ruta relativa para archivos (/documentos/archivo.pdf) o URL completa para links';

