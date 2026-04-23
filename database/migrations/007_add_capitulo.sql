-- ============================================
-- Migración: Tabla capitulo (FK desde pregunta y examen), habilitado + max_preguntas
-- ============================================

CREATE TABLE IF NOT EXISTS capitulo (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    numero_curso INTEGER CHECK (numero_curso IS NULL OR (numero_curso >= 1 AND numero_curso <= 13)),
    orden INTEGER NOT NULL DEFAULT 0,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    habilitado BOOLEAN NOT NULL DEFAULT FALSE,
    max_preguntas INTEGER NOT NULL DEFAULT 15 CHECK (max_preguntas >= 1 AND max_preguntas <= 100),
    habilitacion_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_capitulo_numero_curso ON capitulo (numero_curso);
CREATE INDEX IF NOT EXISTS idx_capitulo_activo ON capitulo (activo);

INSERT INTO capitulo (nombre, numero_curso, orden, habilitado, max_preguntas, habilitacion_updated_at)
SELECT
    'Capítulo ' || cfg.capitulo,
    cfg.capitulo,
    cfg.capitulo,
    cfg.habilitado,
    15,
    COALESCE(cfg.updated_at, CURRENT_TIMESTAMP)
FROM examen_capitulo_config cfg
WHERE NOT EXISTS (SELECT 1 FROM capitulo c WHERE c.numero_curso = cfg.capitulo);

INSERT INTO capitulo (nombre, numero_curso, orden, habilitado, max_preguntas)
SELECT 'Capítulo ' || n, n, n, FALSE, 15
FROM generate_series(1, 13) AS s(n)
WHERE NOT EXISTS (SELECT 1 FROM capitulo c WHERE c.numero_curso = n);

DROP TABLE IF EXISTS examen_capitulo_config;

ALTER TABLE pregunta ADD COLUMN IF NOT EXISTS capitulo_id INTEGER REFERENCES capitulo (id);

UPDATE pregunta p
SET capitulo_id = c.id
FROM capitulo c
WHERE p.capitulo_id IS NULL
  AND c.numero_curso = p.capitulo;

ALTER TABLE pregunta ALTER COLUMN capitulo_id SET NOT NULL;

DROP INDEX IF EXISTS idx_pregunta_capitulo;

ALTER TABLE pregunta DROP COLUMN IF EXISTS capitulo;

CREATE INDEX IF NOT EXISTS idx_pregunta_capitulo_id ON pregunta (capitulo_id);

ALTER TABLE examen ADD COLUMN IF NOT EXISTS capitulo_id INTEGER REFERENCES capitulo (id);

UPDATE examen e
SET capitulo_id = c.id
FROM capitulo c
WHERE e.capitulo_id IS NULL
  AND trim(e.capitulo) ~ '^[0-9]+$'
  AND c.numero_curso = CAST(trim(e.capitulo) AS INTEGER);

UPDATE examen e
SET capitulo_id = c.id
FROM capitulo c
WHERE e.capitulo_id IS NULL
  AND lower(trim(e.capitulo)) = lower(c.nombre);

UPDATE examen e
SET capitulo_id = (SELECT id FROM capitulo ORDER BY id LIMIT 1)
WHERE e.capitulo_id IS NULL;

ALTER TABLE examen ALTER COLUMN capitulo_id SET NOT NULL;

UPDATE examen e
SET capitulo = c.nombre
FROM capitulo c
WHERE e.capitulo_id = c.id;

CREATE INDEX IF NOT EXISTS idx_examen_capitulo_id ON examen (capitulo_id);
