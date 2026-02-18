-- ============================================
-- Migración: Agregar campos a users, crear tablas entrenamientoPrevio e Inscripcion_user
-- y modificar tabla flights
-- ============================================

-- ============================================
-- 0. Habilitar extensión para UUIDs
-- ============================================
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- 0.1. Crear función para actualizar updated_at (si no existe)
-- ============================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- ============================================
-- 1. ALTER TABLE users - Agregar nuevos campos
-- ============================================
ALTER TABLE users
ADD COLUMN IF NOT EXISTS fecha_nac DATE,
ADD COLUMN IF NOT EXISTS direccion VARCHAR(255),
ADD COLUMN IF NOT EXISTS departamento VARCHAR(100),
ADD COLUMN IF NOT EXISTS celular VARCHAR(20),
ADD COLUMN IF NOT EXISTS contacto_emergencia VARCHAR(20),
ADD COLUMN IF NOT EXISTS nombre_emergencia VARCHAR(255),
ADD COLUMN IF NOT EXISTS emergencia_medica TEXT,
ADD COLUMN IF NOT EXISTS sexo VARCHAR(20) CHECK (sexo IN ('Hombre', 'Mujer')),
ADD COLUMN IF NOT EXISTS ciudad VARCHAR(100),
ADD COLUMN IF NOT EXISTS telefono VARCHAR(20),
ADD COLUMN IF NOT EXISTS entrenamiento_previo_id UUID;

-- Índice para la relación con entrenamientoPrevio
CREATE INDEX IF NOT EXISTS idx_users_entrenamiento_previo_id ON users(entrenamiento_previo_id);

-- ============================================
-- 2. Crear tabla entrenamientoPrevio
-- ============================================
CREATE TABLE IF NOT EXISTS entrenamiento_previo (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Horas de vuelo (todos nulleables)
    dual FLOAT CHECK (dual IS NULL OR dual >= 0),
    nav_dual FLOAT CHECK (nav_dual IS NULL OR nav_dual >= 0),
    solo FLOAT CHECK (solo IS NULL OR solo >= 0),
    nav_solo FLOAT CHECK (nav_solo IS NULL OR nav_solo >= 0),
    nocturno_solo FLOAT CHECK (nocturno_solo IS NULL OR nocturno_solo >= 0),
    noct_solo FLOAT CHECK (noct_solo IS NULL OR noct_solo >= 0),
    aterrizajes_noct FLOAT CHECK (aterrizajes_noct IS NULL OR aterrizajes_noct >= 0),
    
    -- Instrucción (todos nulleables)
    instruccion_teorica FLOAT CHECK (instruccion_teorica IS NULL OR instruccion_teorica >= 0),
    instruccion_tierra FLOAT CHECK (instruccion_tierra IS NULL OR instruccion_tierra >= 0),
    instruccion_vuelo FLOAT CHECK (instruccion_vuelo IS NULL OR instruccion_vuelo >= 0),
    
    -- Información adicional (ya son nulleables por defecto)
    chequeo_fases_comp VARCHAR(255),
    ciac_instructor VARCHAR(500), -- Puede contener múltiples instructores separados por comas
    carte_de_transferencia BOOLEAN,
    
    -- Timestamps
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger para actualizar updated_at
CREATE TRIGGER update_entrenamiento_previo_updated_at BEFORE UPDATE ON entrenamiento_previo
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- 3. Agregar foreign key de users a entrenamientoPrevio
-- ============================================
ALTER TABLE users
ADD CONSTRAINT fk_users_entrenamiento_previo 
    FOREIGN KEY (entrenamiento_previo_id) 
    REFERENCES entrenamiento_previo(id) 
    ON DELETE SET NULL;

-- ============================================
-- 4. Crear tabla inscripcion (si no existe)
-- ============================================
-- Nota: Esta tabla se crea para la relación con Inscripcion_user
-- Si ya existe, este comando no hará nada
CREATE TABLE IF NOT EXISTS inscripcion (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(20) DEFAULT 'Activa' CHECK (estado IN ('Activa', 'Inactiva', 'Finalizada')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER update_inscripcion_updated_at BEFORE UPDATE ON inscripcion
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- 5. Crear tabla Inscripcion_user
-- ============================================
CREATE TABLE IF NOT EXISTS inscripcion_user (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    inscripcion_id UUID NOT NULL REFERENCES inscripcion(id) ON DELETE CASCADE,
    
    -- Fechas
    fecha DATE NOT NULL DEFAULT CURRENT_DATE,
    
    -- Certificados y licencias
    certificado_medico VARCHAR(255),
    licencia_alumno VARCHAR(255),
    fecha_emitido_certificado_medico DATE,
    vencimiento_certificado_medico DATE,
    fecha_emitido_licencia_alumno DATE,
    vencimiento_licencia_alumno DATE,
    
    -- Totales y horas
    total_desde_inscripcion DECIMAL(10,2) DEFAULT 0 CHECK (total_desde_inscripcion >= 0),
    hs_teorico DECIMAL(5,2) DEFAULT 0 CHECK (hs_teorico >= 0),
    hs_vuelo_total DECIMAL(5,2) DEFAULT 0 CHECK (hs_vuelo_total >= 0),
    total_fase_teorica DECIMAL(10,2) DEFAULT 0 CHECK (total_fase_teorica >= 0),
    total_fase_vuelo DECIMAL(10,2) DEFAULT 0 CHECK (total_fase_vuelo >= 0),
    otros TEXT,
    
    -- Timestamps
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Constraint único: un usuario solo puede tener una inscripción activa por inscripción
    CONSTRAINT unique_user_inscripcion UNIQUE (user_id, inscripcion_id)
);

CREATE TRIGGER update_inscripcion_user_updated_at BEFORE UPDATE ON inscripcion_user
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Índices para inscripcion_user
CREATE INDEX IF NOT EXISTS idx_inscripcion_user_user_id ON inscripcion_user(user_id);
CREATE INDEX IF NOT EXISTS idx_inscripcion_user_inscripcion_id ON inscripcion_user(inscripcion_id);
CREATE INDEX IF NOT EXISTS idx_inscripcion_user_fecha ON inscripcion_user(fecha);

-- ============================================
-- 6. ALTER TABLE flights - Agregar nuevos campos
-- ============================================
ALTER TABLE flights
ADD COLUMN IF NOT EXISTS matricula VARCHAR(50),
ADD COLUMN IF NOT EXISTS modelo VARCHAR(100),
ADD COLUMN IF NOT EXISTS aerod VARCHAR(100),
ADD COLUMN IF NOT EXISTS tipo VARCHAR(50) CHECK (tipo IN ('vueloSolo', 'navegacionSolo', 'habilitacionAvion', 'aeronavesComplejas', 'examen', 'examenDinacia', 'examenVuelo', 'examenVueloDinacia')),
ADD COLUMN IF NOT EXISTS inspector_dinacia VARCHAR(255),
ADD COLUMN IF NOT EXISTS instructor VARCHAR(255),
ADD COLUMN IF NOT EXISTS calificacion FLOAT CHECK (calificacion IS NULL OR (calificacion >= 0 AND calificacion <= 100));

-- Índice para el nuevo campo tipo
CREATE INDEX IF NOT EXISTS idx_flights_tipo ON flights(tipo);

-- ============================================
-- Comentarios finales
-- ============================================
COMMENT ON COLUMN users.entrenamiento_previo_id IS 'Relación con entrenamiento previo del usuario (nulleable)';
COMMENT ON COLUMN entrenamiento_previo.ciac_instructor IS 'Puede contener múltiples instructores separados por comas, ej: "Juan Gabriel, Juan Martin"';
COMMENT ON COLUMN inscripcion_user.certificado_medico IS 'Número o referencia del certificado médico';
COMMENT ON COLUMN inscripcion_user.licencia_alumno IS 'Número o referencia de la licencia de alumno piloto';

-- ============================================
-- 7. Actualizar usuarios existentes (ejemplo para usuarios con id 1 y 2)
-- ============================================
-- Nota: Ajusta los valores según los datos reales de los usuarios
-- Si los usuarios tienen UUID, reemplaza '1' y '2' con los UUIDs reales

-- Ejemplo de actualización para usuario con id = 1 (ajustar según necesidad)
UPDATE users 
SET 
    fecha_nac = '1990-01-01',  -- Ajustar fecha según datos reales
    direccion = 'Dirección ejemplo 123',
    departamento = 'Salto',
    ciudad = 'Salto',
    celular = '099123456',
    telefono = '24001234',
    contacto_emergencia = '099987654',
    nombre_emergencia = 'Nombre Contacto Emergencia',
    emergencia_medica = 'Información médica relevante',
    sexo = 'Hombre'  -- o 'Mujer'
WHERE id = (SELECT id FROM users ORDER BY created_at LIMIT 1 OFFSET 0);

-- Ejemplo de actualización para usuario con id = 2 (ajustar según necesidad)
UPDATE users 
SET 
    fecha_nac = '1992-05-15',  -- Ajustar fecha según datos reales
    direccion = 'Otra dirección 456',
    departamento = 'Salto',
    ciudad = 'Salto',
    celular = '099111222',
    telefono = '24005678',
    contacto_emergencia = '099333444',
    nombre_emergencia = 'Otro Contacto Emergencia',
    emergencia_medica = 'Otra información médica',
    sexo = 'Mujer'  -- o 'Hombre'
WHERE id = (SELECT id FROM users ORDER BY created_at LIMIT 1 OFFSET 1);

-- Si conoces los UUIDs específicos, puedes usar directamente:
-- UPDATE users SET fecha_nac = '1990-01-01', ... WHERE id = 'uuid-del-usuario-1';
-- UPDATE users SET fecha_nac = '1992-05-15', ... WHERE id = 'uuid-del-usuario-2';

