-- ============================================
-- Migración: Crear tablas para gestión de clases online
-- ============================================

-- ============================================
-- TABLA: clases_online
-- ============================================
CREATE TABLE IF NOT EXISTS clases_online (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Información de la clase
    link VARCHAR(500) NOT NULL,
    link_grabacion VARCHAR(500), -- Link a la grabación (cuando estado es "Grabacion")
    
    -- Fechas y horas
    fecha_hora_inicio TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_hora_fin TIMESTAMP,
    
    -- Estado de la clase
    estado VARCHAR(20) NOT NULL DEFAULT 'Pendiente' 
        CHECK (estado IN ('Pendiente', 'En curso', 'Terminada', 'Grabacion')),
    
    -- Instructor (FK a users)
    instructor_id UUID NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
    
    -- Timestamps
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger para actualizar updated_at automáticamente
CREATE TRIGGER update_clases_online_updated_at BEFORE UPDATE ON clases_online
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Índices
CREATE INDEX IF NOT EXISTS idx_clases_online_instructor_id ON clases_online(instructor_id);
CREATE INDEX IF NOT EXISTS idx_clases_online_estado ON clases_online(estado);
CREATE INDEX IF NOT EXISTS idx_clases_online_fecha_hora_inicio ON clases_online(fecha_hora_inicio);

-- ============================================
-- TABLA: clases_online_alumnos
-- ============================================
-- Tabla intermedia para la relación muchos a muchos entre clases_online y alumnos
CREATE TABLE IF NOT EXISTS clases_online_alumnos (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Relaciones
    clase_online_id UUID NOT NULL REFERENCES clases_online(id) ON DELETE CASCADE,
    alumno_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    
    -- Timestamp de cuando se registró el alumno
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Constraint único: un alumno solo puede estar registrado una vez por clase
    CONSTRAINT unique_clase_alumno UNIQUE (clase_online_id, alumno_id)
);

-- Índices
CREATE INDEX IF NOT EXISTS idx_clases_online_alumnos_clase_id ON clases_online_alumnos(clase_online_id);
CREATE INDEX IF NOT EXISTS idx_clases_online_alumnos_alumno_id ON clases_online_alumnos(alumno_id);

-- Comentarios
COMMENT ON TABLE clases_online IS 'Tabla que almacena las clases online del sistema';
COMMENT ON COLUMN clases_online.link IS 'Link de la clase online (Zoom, Meet, etc.)';
COMMENT ON COLUMN clases_online.link_grabacion IS 'Link a la grabación de la clase (cuando estado es "Grabacion")';
COMMENT ON COLUMN clases_online.estado IS 'Estado de la clase: Pendiente, En curso, Terminada, Grabacion';
COMMENT ON COLUMN clases_online_alumnos.fecha_registro IS 'Fecha y hora en que el alumno se registró en la clase';

