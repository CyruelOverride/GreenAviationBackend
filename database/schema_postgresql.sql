-- ============================================
-- Script SQL para GreenAviation Database (PostgreSQL)
-- ============================================

-- Crear extensión para UUIDs (si no existe)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- TABLA: users
-- ============================================
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Información de autenticación
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'alumno' CHECK (role IN ('admin', 'alumno')),
    
    -- Información personal
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    cedula VARCHAR(20) UNIQUE,
    numero_telefono VARCHAR(20),
    edad INT CHECK (edad >= 16 AND edad <= 100),
    
    -- Información académica
    fecha_inicio_curso DATE DEFAULT CURRENT_DATE,
    estado VARCHAR(20) DEFAULT 'Cursando' CHECK (estado IN ('Cursando', 'Finalizado')),
    progreso INT DEFAULT 0 CHECK (progreso >= 0 AND progreso <= 100),
    curso VARCHAR(100) DEFAULT 'Piloto Privado',
    
    -- Información adicional
    ultimo_acceso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Timestamps
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger para actualizar updated_at automáticamente
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Índices
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_cedula ON users(cedula);
CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);
CREATE INDEX IF NOT EXISTS idx_users_estado ON users(estado);

-- ============================================
-- TABLA: calificaciones
-- ============================================
CREATE TABLE IF NOT EXISTS calificaciones (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    
    tipo VARCHAR(50) NOT NULL CHECK (tipo IN ('Examen Teórico', 'Examen Práctico', 'Examen Pre-Solo', 'Otro')),
    calificacion INT NOT NULL CHECK (calificacion >= 0 AND calificacion <= 100),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    observaciones TEXT,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_calificaciones_user_id ON calificaciones(user_id);
CREATE INDEX IF NOT EXISTS idx_calificaciones_fecha ON calificaciones(fecha);

-- ============================================
-- TABLA: flights
-- ============================================
CREATE TABLE IF NOT EXISTS flights (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    alumno_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    
    -- Información del vuelo
    fecha DATE NOT NULL DEFAULT CURRENT_DATE,
    duracion INT NOT NULL CHECK (duracion >= 0),
    calificacion INT NOT NULL CHECK (calificacion >= 0 AND calificacion <= 100),
    
    -- Tipo de vuelo
    tipo_vuelo VARCHAR(20) DEFAULT 'Dual' CHECK (tipo_vuelo IN ('Solo', 'Dual', 'Chequeo', 'Práctico', 'Otro')),
    
    -- Información de aeronave
    aeronave_tipo VARCHAR(100),
    aeronave_matricula VARCHAR(50),
    
    -- Información de instructor
    instructor_nombre VARCHAR(100),
    instructor_licencia VARCHAR(50),
    
    -- Observaciones
    observaciones TEXT,
    
    -- Horas de vuelo
    horas_vuelo_tipo VARCHAR(20) DEFAULT 'Dual' CHECK (horas_vuelo_tipo IN ('Solo', 'Dual', 'Instrumental', 'Noche')),
    horas_vuelo_cantidad DECIMAL(5,2) DEFAULT 0 CHECK (horas_vuelo_cantidad >= 0),
    
    -- Estado
    estado VARCHAR(20) DEFAULT 'Completado' CHECK (estado IN ('Completado', 'Cancelado', 'Reprogramado')),
    
    -- Timestamps
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER update_flights_updated_at BEFORE UPDATE ON flights
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE INDEX IF NOT EXISTS idx_flights_alumno_id ON flights(alumno_id);
CREATE INDEX IF NOT EXISTS idx_flights_fecha ON flights(fecha);
CREATE INDEX IF NOT EXISTS idx_flights_tipo_vuelo ON flights(tipo_vuelo);

-- ============================================
-- TABLA: maniobras
-- ============================================
CREATE TABLE IF NOT EXISTS maniobras (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    flight_id UUID NOT NULL REFERENCES flights(id) ON DELETE CASCADE,
    
    nombre VARCHAR(255) NOT NULL,
    calificacion VARCHAR(50), -- Calificación como texto (ej: "Excelente", "Bueno", "A", "B", etc.)
    observaciones TEXT,
    completada BOOLEAN DEFAULT TRUE,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_maniobras_flight_id ON maniobras(flight_id);

