-- ============================================
-- Migración: Articulos (blog), articulo_recursos e indicador en recursos
-- ============================================

-- ============================================
-- 1. Indicador en tabla recursos
-- ============================================
ALTER TABLE recursos
ADD COLUMN IF NOT EXISTS es_para_blog BOOLEAN NOT NULL DEFAULT false;

CREATE INDEX IF NOT EXISTS idx_recursos_es_para_blog ON recursos(es_para_blog);

COMMENT ON COLUMN recursos.es_para_blog IS 'true = recurso usado en blog; false = recurso adicional (página Recursos adicionales)';

-- ============================================
-- 2. Tabla articulos
-- ============================================
CREATE TABLE IF NOT EXISTS articulos (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

    titulo VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    cuerpo TEXT,
    resumen TEXT,
    imagen_portada_url TEXT,

    estado VARCHAR(20) NOT NULL DEFAULT 'borrador'
        CHECK (estado IN ('borrador', 'publicado')),

    autor_id UUID NOT NULL REFERENCES users(id) ON DELETE RESTRICT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER update_articulos_updated_at BEFORE UPDATE ON articulos
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE INDEX IF NOT EXISTS idx_articulos_autor_id ON articulos(autor_id);
CREATE INDEX IF NOT EXISTS idx_articulos_estado ON articulos(estado);
CREATE INDEX IF NOT EXISTS idx_articulos_slug ON articulos(slug);
CREATE INDEX IF NOT EXISTS idx_articulos_created_at ON articulos(created_at);

COMMENT ON TABLE articulos IS 'Artículos del blog; autor_id referencia al usuario (instructor/admin) que los crea';

-- ============================================
-- 3. Tabla articulo_recursos (N:M)
-- ============================================
CREATE TABLE IF NOT EXISTS articulo_recursos (
    articulo_id UUID NOT NULL REFERENCES articulos(id) ON DELETE CASCADE,
    recurso_id UUID NOT NULL REFERENCES recursos(id) ON DELETE CASCADE,
    orden INT DEFAULT 0,

    PRIMARY KEY (articulo_id, recurso_id)
);

CREATE INDEX IF NOT EXISTS idx_articulo_recursos_articulo_id ON articulo_recursos(articulo_id);
CREATE INDEX IF NOT EXISTS idx_articulo_recursos_recurso_id ON articulo_recursos(recurso_id);

COMMENT ON TABLE articulo_recursos IS 'Relación muchos a muchos entre artículos y recursos del blog';
