-- ============================================================
-- Migración 009: columna es_para_blog (si falta) + videos curso teórico
-- ============================================================

ALTER TABLE recursos ADD COLUMN IF NOT EXISTS es_para_blog BOOLEAN DEFAULT FALSE;

-- Idempotente: reemplazar catálogo de videos teóricos
DELETE FROM recursos WHERE categoria = 'videoTeorico';

INSERT INTO recursos (nombre, tipo, categoria, ruta_o_url, orden, activo, es_para_blog, creado_por) VALUES
('Principios del vuelo', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1gufozkH1NeP8282OUCoNAu2VcDPVKvid/view?usp=drive_link', 1, true, false, NULL),
('Resistencia parásita', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1EEQZ0W93haLzt786nKmMCA5g3nSDxBOM/view?usp=drive_link', 2, true, false, NULL),
('Factores de carga', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1W5MZnQRVsW9-uQPZLPOTrCMUK2rrzXhQ/view?usp=drivesdk', 3, true, false, NULL),
('Virajes ROT y radio', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1wwUn2ziJ1M0x9jKTbAmbYXFh9xeW_PbB/view?usp=drivesdk', 4, true, false, NULL),
('Tipos de estabilidad', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/11A01VByhBZDkK4scUdcvHJ0whbm5b-Nu/view?usp=drive_link', 5, true, false, NULL),
('Estabilidad de los 3 ejes', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1ujo7U9hmyrakiQydBKjZul_Klm4kTcLx/view?usp=drive_link', 6, true, false, NULL),
('Controles de vuelo', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1BVZwKpks5yQhw4ypi934H2SecYqmAsVz/view?usp=drive_link', 7, true, false, NULL),
('Ejes de giro', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1Y2uQI4N3XAQgcPHkCbGkGMXs5J2vjUMZ/view?usp=drive_link', 8, true, false, NULL),
('Compensadores', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1XM6ojovK_iqYiIyijQ1eyIPKyFzTr7_G/view?usp=drive_link', 9, true, false, NULL),
('Peso, carga y centrado 1', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/15NxGuggMQ5dIuxQEyIbFgSYbmW0o2JZb/view?usp=drive_link', 10, true, false, NULL),
('Peso, carga y centrado 2', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/16PvXJV0xvvA_yk8H_oYJo1EvaOrfbyfS/view?usp=drive_link', 11, true, false, NULL),
('Cálculo peso y centrado', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1Fs6U4hF2nij7ZOaAObbmVEMJhKj8Sobs/view?usp=drive_link', 12, true, false, NULL),
('Cálculo peso y centrado 2', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1_v02PTFABeCMPjFanlKM239zUH6RzRCs/view?usp=drive_link', 13, true, false, NULL),
('Rendimiento y limitaciones de la aeronave', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1wGv3g8Gz3XTQlt280sBvVWBpLXdHbnce/view?usp=drive_link', 14, true, false, NULL),
('Autonomía', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1hLmY9ceqKOR-E_cv6XwF6xM0eg-FiMcf/view?usp=drive_link', 15, true, false, NULL),
('Alcance', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1I-SpjJBrC3qc6EjUl71F5HT4BeDDKGBH/view?usp=drive_link', 16, true, false, NULL),
('Partes del avión', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1jpxQsQacbik-cSFy7t6H3oZkKTgrvuZA/view?usp=drive_link', 17, true, false, NULL),
('Tren de aterrizaje', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1EQiOfXd0jwm8peB8wd1yxYd44V5UNlZB/view?usp=drive_link', 18, true, false, NULL),
('Motores', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1c0BLyd1Ul3-4gWJDhK_YDnhPzUVXXoG9/view?usp=drive_link', 19, true, false, NULL),
('Sistema eléctrico', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1uSe4zIK7VIMdm8_goBMzc2ebGS55nfYs/view?usp=drive_link', 20, true, false, NULL),
('Sistema de combustible', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1rBqH--oRnxxFDzsSopQUIz7o2GuuBQcf/view?usp=drive_link', 21, true, false, NULL),
('Sistema de lubricaciones', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1YIbWU8kPNNFKyy-k_RpbjAgeHQDsGNas/view?usp=drive_link', 22, true, false, NULL),
('Pitot estático', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1IKfDkKO1scXForyHNf-T10kME3OrLDdW/view?usp=drive_link', 23, true, false, NULL),
('Instrumentos giroscópicos', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1xeyC41aV9EduN1lmSkW2Yom9BYQ03ZX6/view?usp=drive_link', 24, true, false, NULL),
('Brújula', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1yN4g_D9fAa5EpGzZR5Z2FSyBByIUwRVD/view?usp=drive_link', 25, true, false, NULL),
('Curso y rumbo magnético', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1sCTOr7q5X0O454wJssuaMiqFXbAY-MYl/view?usp=drive_link', 26, true, false, NULL),
('Navegación observada y a estima', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1F4SfDbfOeEqXIQDsIDmdViQbjnHVi59v/view?usp=drive_link', 27, true, false, NULL),
('Computador 1', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1LPwqqLx70Ck2GcrNDVlj_kxmAGfywb6u/view?usp=drive_link', 28, true, false, NULL),
('Computador viento', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1wQ5yG5Hf2e6cAqA9a67i8WL6dZNlRPim/view?usp=drive_link', 29, true, false, NULL),
('Radio ayudas', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1Fjqh_ghkw6atvOcNOtLXJIq6gSWxoL78/view?usp=drive_link', 30, true, false, NULL),
('Capas de la atmósfera', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1e-TcLvTD-Yp3Lgo6i3g7TqIBag3VT526/view?usp=drive_link', 31, true, false, NULL),
('Masas y frentes', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1LlVTgmyCt2M2_SBtTH_EsGvHq5kgDmIZ/view?usp=drive_link', 32, true, false, NULL),
('Frentes explicados', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1MhZJe5SxIP6yZIKSbTRyelPDezDMfQB-/view?usp=drive_link', 33, true, false, NULL),
('METAR', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1psbIvkIXUxFlmYNEkb9Hc68gwAYkXeJX/view?usp=drive_link', 34, true, false, NULL),
('Gestión en cabina', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1ENDZUeK3saWrmCRBrgvxwckaI80L5oKr/view?usp=drive_link', 35, true, false, NULL),
('Factores aeromédicos', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1U4JO_QUx6DUeiRx4o3dy0qJW-IUzjx4u/view?usp=drive_link', 36, true, false, NULL),
('Señales aeropuertos', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/17DMDmA1q50q9YgMgorJpveXdDbDiYPt9/view?usp=drive_link', 37, true, false, NULL),
('Luces de pista', 'link_drive', 'videoTeorico', 'https://drive.google.com/file/d/1v_a9rSB0TUwJxEoUN5VpS7HE-a8NhuZm/view?usp=drive_link', 38, true, false, NULL);

COMMENT ON COLUMN recursos.es_para_blog IS 'true = recurso para blog; false = recursos adicionales / gestión general';
