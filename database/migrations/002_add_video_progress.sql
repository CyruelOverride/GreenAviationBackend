-- ============================================
-- Migración: Agregar tabla de progreso de videos
-- ============================================

-- Tabla para trackear el progreso de videos por usuario
CREATE TABLE IF NOT EXISTS video_progress (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    
    -- Identificador del video (número de video 1-38)
    video_numero INT NOT NULL CHECK (video_numero >= 1 AND video_numero <= 50),
    
    -- Timestamp de cuando el usuario empezó a ver el video
    started_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    -- Para evitar duplicados: un usuario solo puede tener un registro por video
    UNIQUE(user_id, video_numero),
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Índices para búsquedas rápidas
CREATE INDEX IF NOT EXISTS idx_video_progress_user_id ON video_progress(user_id);
CREATE INDEX IF NOT EXISTS idx_video_progress_video_numero ON video_progress(video_numero);

-- Comentarios descriptivos
COMMENT ON TABLE video_progress IS 'Registra cuando un usuario comienza a ver un video del curso';
COMMENT ON COLUMN video_progress.video_numero IS 'Número del video (1-38 para los videos del curso teórico)';
COMMENT ON COLUMN video_progress.started_at IS 'Momento en que el usuario hizo clic en ver el video';

