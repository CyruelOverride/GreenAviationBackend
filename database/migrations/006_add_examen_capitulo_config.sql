-- ============================================
-- Migración: Configuración de habilitación de exámenes por capítulo
-- ============================================

CREATE TABLE IF NOT EXISTS examen_capitulo_config (
    capitulo INTEGER PRIMARY KEY CHECK (capitulo >= 1 AND capitulo <= 13),
    habilitado BOOLEAN NOT NULL DEFAULT FALSE,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO examen_capitulo_config (capitulo, habilitado)
SELECT gs.capitulo, FALSE
FROM generate_series(1, 13) AS gs(capitulo)
ON CONFLICT (capitulo) DO NOTHING;
