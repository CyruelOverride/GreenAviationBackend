-- ============================================
-- Script SQL para Sistema de Exámenes
-- Basado en: Capitulo 1.txt (Aerodinámica y Principios de Vuelo)
-- ============================================

-- Eliminar tablas si existen (en orden inverso de dependencias)
DROP TABLE IF EXISTS examen_pregunta CASCADE;
DROP TABLE IF EXISTS opcion CASCADE;
DROP TABLE IF EXISTS pregunta CASCADE;
DROP TABLE IF EXISTS examen CASCADE;

-- ============================================
-- CREACIÓN DE TABLAS
-- ============================================

-- Tabla: Examen
CREATE TABLE examen (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL, -- FK a Usuario (tabla ya existe)
    nombre VARCHAR(255) NOT NULL,
    capitulo VARCHAR(100) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_finalizacion TIMESTAMP NULL,
    puntaje DECIMAL(5,2) NULL,
    estado VARCHAR(20) CHECK (estado IN ('PENDIENTE','COMPLETADO','CANCELADO')),
    tiempo_limite INTEGER NULL, -- en minutos
    CONSTRAINT fk_examen_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

-- Tabla: Pregunta
CREATE TABLE pregunta (
    id SERIAL PRIMARY KEY,
    enunciado TEXT NOT NULL,
    capitulo INT NOT NULL,
    activa BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla: Opcion
CREATE TABLE opcion (
    id SERIAL PRIMARY KEY,
    pregunta_id INTEGER NOT NULL,
    texto TEXT NOT NULL,
    es_correcta BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_opcion_pregunta FOREIGN KEY (pregunta_id) REFERENCES pregunta(id) ON DELETE CASCADE
);

-- Tabla intermedia: Examen_Pregunta
CREATE TABLE examen_pregunta (
    examen_id INTEGER NOT NULL,
    pregunta_id INTEGER NOT NULL,
    respondida BOOLEAN DEFAULT FALSE,
    opcion_seleccionada_id INTEGER NULL,
    CONSTRAINT pk_examen_pregunta PRIMARY KEY (examen_id, pregunta_id),
    CONSTRAINT fk_examen_pregunta_examen FOREIGN KEY (examen_id) REFERENCES examen(id) ON DELETE CASCADE,
    CONSTRAINT fk_examen_pregunta_pregunta FOREIGN KEY (pregunta_id) REFERENCES pregunta(id) ON DELETE CASCADE,
    CONSTRAINT fk_examen_pregunta_opcion FOREIGN KEY (opcion_seleccionada_id) REFERENCES opcion(id) ON DELETE SET NULL
);

-- ============================================
-- ÍNDICES PARA MEJOR RENDIMIENTO
-- ============================================

CREATE INDEX idx_examen_usuario ON examen(usuario_id);
CREATE INDEX idx_examen_capitulo ON examen(capitulo);
CREATE INDEX idx_pregunta_capitulo ON pregunta(capitulo);
CREATE INDEX idx_pregunta_activa ON pregunta(activa);
CREATE INDEX idx_opcion_pregunta ON opcion(pregunta_id);
CREATE INDEX idx_opcion_correcta ON opcion(pregunta_id, es_correcta);
CREATE INDEX idx_examen_pregunta_examen ON examen_pregunta(examen_id);
CREATE INDEX idx_examen_pregunta_pregunta ON examen_pregunta(pregunta_id);
CREATE UNIQUE INDEX unica_opcion_correcta
ON opcion(pregunta_id)
WHERE es_correcta = TRUE;

-- ============================================
-- INSERCIÓN DE PREGUNTAS Y OPCIONES
-- Capítulo: 1
-- ============================================

-- Pregunta 1
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el postulado fundamental de la Primera Ley de Newton aplicado a una aeronave en la rampa?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La aeronave iniciará su movimiento solo si la sustentación supera al peso.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El avión permanecerá en reposo a menos que se aplique una fuerza externa que supere su inercia.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La fuerza es directamente proporcional a la masa del cuerpo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La inercia del avión se reduce al aplicar una aceleración negativa.', FALSE);

-- Pregunta 2
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según la Segunda Ley de Newton, ¿cómo se define la fuerza en un cuerpo de masa constante?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Es igual a la masa por la aceleración.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Es inversamente proporcional a la fuerza aplicada.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es la reacción igual y opuesta a una acción previa.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es el estado de reposo uniforme en línea recta.', FALSE);

-- Pregunta 3
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué principio explica el movimiento hacia adelante de un avión a reacción según las fuentes?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La disminución de la presión estática en la tobera.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La aceleración positiva inversamente proporcional a la masa.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La tercera ley de Newton: una fuerza de reacción igual y opuesta a la expulsión de gases calientes.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El aumento de la presión dinámica en el compresor.', FALSE);

-- Pregunta 4
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué establece el Principio de Bernoulli respecto a un fluido en movimiento?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'A medida que la velocidad aumenta, la presión dentro del fluido aumenta proporcionalmente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La presión estática y la presión dinámica son independientes entre sí.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A medida que la velocidad del fluido aumenta, la presión interna disminuye.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La suma de la presión y la velocidad debe ser siempre una variable.', FALSE);

-- Pregunta 5
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la aplicación práctica del teorema de Bernoulli en un estrechamiento de flujo?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El Efecto Coanda.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El Efecto Venturi, donde las partículas aumentan su velocidad y disminuyen su presión.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La formación de ondas de choque a altas velocidades.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El aumento de la presión estática por el peso del aire.', FALSE);

-- Pregunta 6
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se define técnicamente un perfil aerodinámico?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Es una estructura diseñada para generar fricción y resistencia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es cualquier cuerpo que se sitúa en una corriente de aire para aprovechar las modificaciones de presión y velocidad.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Es la línea recta que une el borde de ataque con el de salida.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es la distancia máxima entre el extradós e intradós.', FALSE);

-- Pregunta 7
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es la "cuerda aerodinámica"?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La parte delantera del perfil alar.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La distancia máxima entre la parte superior e inferior del perfil.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La línea recta imaginaria que une el borde de ataque con el borde de fuga.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La trayectoria seguida por el perfil en el seno del aire.', FALSE);

-- Pregunta 8
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En la terminología del perfil, ¿qué representa el "espesor"?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La longitud total desde el borde de ataque al de fuga.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La distancia máxima entre el extradós (parte superior) y el intradós (parte inferior).', TRUE),
((SELECT MAX(id) FROM pregunta), 'El ángulo formado entre la cuerda y el viento relativo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La curvatura necesaria para generar el efecto Venturi.', FALSE);

-- Pregunta 9
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la causa física primaria de la sustentación según el texto?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El empuje de la hélice hacia atrás.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La diferencia de presión entre la parte superior e inferior del ala.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El equilibrio estricto entre tracción y resistencia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El aumento de la presión dinámica en el intradós únicamente.', FALSE);

-- Pregunta 10
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se define el "viento relativo" en aerodinámica?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La dirección de la trayectoria de vuelo de la aeronave.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El aire que tiene una dirección opuesta al desplazamiento del perfil y es el que produce la sustentación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El flujo turbulento que se desprende del borde de salida.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La corriente de aire que fluye paralela a la cuerda aerodinámica.', FALSE);

-- Pregunta 11
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuáles son los dos componentes de la fuerza aerodinámica resultante?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Peso y tracción.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Sustentación (vertical) y resistencia inducida (horizontal).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Presión estática y presión dinámica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ángulo de ataque y coeficiente de sustentación.', FALSE);

-- Pregunta 12
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué relación tiene la sustentación con la velocidad del aire?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Es inversamente proporcional a la velocidad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es directamente proporcional a la raíz cuadrada de la velocidad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es directamente proporcional al cuadrado de la velocidad (V²).', TRUE),
((SELECT MAX(id) FROM pregunta), 'No depende de la velocidad si la densidad es constante.', FALSE);

-- Pregunta 13
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo afecta la densidad del aire a la sustentación de un avión?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'A menor densidad, mayor sustentación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un aire más denso produce una mayor sustentación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La densidad solo afecta a la resistencia parásita, no a la sustentación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La densidad es constante independientemente de la temperatura.', FALSE);

-- Pregunta 14
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Por qué los aviones suelen volar mejor en invierno según las fuentes?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Porque el aire es menos denso debido a la baja temperatura.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Debido a que a menor temperatura el aire es más denso, mejorando la sustentación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Porque la resistencia inducida disminuye con el frío.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Debido al aumento del ángulo de ataque crítico en temperaturas bajas.', FALSE);

-- Pregunta 15
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué dispositivo se menciona para modificar la superficie alar en vuelo?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Los estabilizadores horizontales.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Los dispositivos hipersustentadores como los flaps.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El timón de dirección.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El carenado del tren de aterrizaje.', FALSE);

-- Pregunta 16
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la relación entre el ángulo de ataque y la sustentación?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La sustentación disminuye al aumentar el ángulo de ataque.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La sustentación es directamente proporcional al ángulo de ataque hasta alcanzar el ángulo crítico.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La sustentación es constante independientemente del ángulo de ataque.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El ángulo de ataque solo influye en la resistencia parásita.', FALSE);

-- Pregunta 17
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿A cuántos grados aproximadamente ocurre el ángulo de ataque crítico?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '5º.', FALSE),
((SELECT MAX(id) FROM pregunta), '10º.', FALSE),
((SELECT MAX(id) FROM pregunta), '15º.', TRUE),
((SELECT MAX(id) FROM pregunta), '20º.', FALSE);

-- Pregunta 18
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es la resistencia inducida?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La resistencia generada por las partes que no contribuyen a la sustentación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La componente horizontal de la fuerza aerodinámica opuesta a la trayectoria de vuelo que solo existe si hay sustentación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La resistencia que aparece solo cerca de la velocidad del sonido.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La fricción causada por la escarcha en el borde de ataque.', FALSE);

-- Pregunta 19
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál de los siguientes elementos produce "resistencia parásita"?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El extradós del ala.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El flujo de aire que genera la sustentación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El tren de aterrizaje y los estabilizadores.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La diferencia de presión en el efecto Venturi.', FALSE);

-- Pregunta 20
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuándo se produce la resistencia por compresibilidad?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Al despegar con flaps extendidos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cuando el avión vuela cerca de la velocidad del sonido (1200 km/hr).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Durante un viraje escarpado a baja velocidad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En el efecto suelo debido a la proximidad de la pista.', FALSE);

-- Pregunta 21
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo varía la resistencia inducida con la velocidad?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aumenta conforme aumenta la velocidad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Permanece constante en todas las velocidades.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Disminuye conforme aumenta la velocidad.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Se duplica si la velocidad se reduce a la mitad.', FALSE);

-- Pregunta 22
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo varía la resistencia parásita respecto a la velocidad?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aumenta con el cuadrado de la velocidad.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Disminuye al aumentar la velocidad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es independiente del ángulo de ataque.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se reduce si se aumenta la superficie alar.', FALSE);

-- Pregunta 23
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué define técnicamente a la "pérdida de sustentación" (Stall)?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El exceso de tracción sobre la resistencia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La separación del flujo de aire de la superficie del ala por alcanzar un AOA crítico.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Volar por debajo del arco blanco del velocímetro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El aumento excesivo de la densidad del aire.', FALSE);

-- Pregunta 24
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué caracteriza a una "pérdida acelerada"?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Se produce a altas velocidades cerca de Mach 1.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ocurre debido a un cambio repentino en el ángulo de ataque.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Es causada por la formación de escarcha en el intradós.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Solo ocurre en el efecto suelo durante el aterrizaje.', FALSE);

-- Pregunta 25
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la definición de Ángulo de Ataque (AOA)?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El ángulo entre el horizonte y el eje longitudinal del avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El ángulo formado entre la cuerda aerodinámica y la dirección del viento relativo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La inclinación de las alas durante un viraje medio.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La diferencia entre el borde de ataque y el borde de salida.', FALSE);

-- Pregunta 26
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué condición de vuelo se produce el mayor ángulo de ataque?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'En un ascenso con alta potencia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En un descenso, ya que el viento relativo viene desde abajo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En vuelo recto y nivelado a velocidad de crucero.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En vuelo lento cercano a la velocidad de pérdida.', TRUE);

-- Pregunta 27
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué factor permanece constante respecto al ángulo de ataque de entrada en pérdida?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La velocidad indicada.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El peso del avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El ángulo de ataque crítico, independientemente del peso o actitud.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La altitud de densidad.', FALSE);

-- Pregunta 28
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué sucede con el flujo de aire sobre el ala durante una pérdida?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Pasa de ser turbulento a laminar.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se vuelve laminar en el borde de salida.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Deja de ser laminar y pasa a ser turbulento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Se acelera en el extradós aumentando la succión.', FALSE);

-- Pregunta 29
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la función de los indicadores de pérdida en cabina?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Medir la velocidad real del avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Avisar al piloto (usualmente 5 millas antes) de alcanzar el AOA crítico mediante bocinas y luces.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Indicar la posición exacta del centro de gravedad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mostrar el ángulo de banqueo en virajes escarpados.', FALSE);

-- Pregunta 30
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué diferencia al Centro de Presión (CP) del Centro Aerodinámico (CA)?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El CA se desplaza con el ángulo de ataque mientras el CP es constante.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El CP es el punto donde actúa la fuerza aerodinámica resultante y su posición cambia con el AOA.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El CP se encuentra siempre al 25% de la cuerda.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El CA determina la tracción y el CP determina el peso.', FALSE);

-- Pregunta 31
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Hacia dónde se desplaza el Centro de Presión (CP) al aumentar el ángulo de ataque?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Hacia atrás.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hacia el borde de salida.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hacia adelante.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Se mantiene estático en el centro de la cuerda.', FALSE);

-- Pregunta 32
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el procedimiento correcto para recuperar una pérdida?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aumentar la presión en los comandos y reducir motor.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aflojar presión en comandos, aplicar motor y recuperar altura tras ganar velocidad.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Mantener el ángulo de ataque y extender flaps totalmente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Virar inmediatamente para cambiar la dirección del viento relativo.', FALSE);

-- Pregunta 33
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué define a los dispositivos hipersustentadores?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Elementos para aumentar la resistencia parásita en crucero.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Dispositivos para producir sustentación a velocidades inferiores a las normales.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Superficies que reducen el ángulo de ataque crítico.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Carenados para suavizar el flujo laminar.', FALSE);

-- Pregunta 34
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es una de las funciones principales de los flaps durante la aproximación?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Permitir un ángulo de descenso menor sin variar la velocidad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Incrementar la sustentación, permitiendo aumentar el ángulo de descenso sin aumentar la velocidad.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Reducir la resistencia inducida para ahorrar combustible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Evitar que el centro de presión se mueva hacia adelante.', FALSE);

-- Pregunta 35
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué efecto tiene el uso de flaps en el despegue?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aumenta la carrera de despegue.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Disminuye la carrera de despegue y aumenta la pendiente de ascenso.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Reduce el ángulo de ataque crítico a 10º.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Solo debe usarse con vientos fuertes y arrachados.', FALSE);

-- Pregunta 36
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuáles son las cuatro fuerzas que actúan sobre un avión en vuelo?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Inercia, aceleración, masa y gravedad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Sustentación, peso, tracción y resistencia.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Presión, velocidad, densidad y temperatura.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Sustentación, gravedad, empuje y fricción parásita.', FALSE);

-- Pregunta 37
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuándo se dice que las cuatro fuerzas de vuelo están en equilibrio?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Durante un ascenso escarpado a máxima potencia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En vuelo recto y nivelado (sustentación = peso; tracción = resistencia).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Cuando el factor de carga es superior a 2G.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Durante la recuperación de un tirabuzón.', FALSE);

-- Pregunta 38
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué condición es necesaria para que ocurra un tirabuzón (barrena)?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El avión debe volar cerca de la velocidad del sonido.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ambas alas deben tener flujo laminar perfecto.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El avión debe entrar en pérdida primero.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El centro de gravedad debe estar en su límite delantero.', FALSE);

-- Pregunta 39
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo afecta la escarcha al rendimiento del perfil alar?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aumenta la sustentación al mejorar la rugosidad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Interrumpe el flujo normal, disminuye la sustentación y aumenta la resistencia.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Reduce el peso total del ala por sublimación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Facilita el despegue al enfriar el aire circundante.', FALSE);

-- Pregunta 40
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué causa el "Efecto Suelo"?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El aumento de los vórtices de punta de ala.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La interferencia del suelo con el patrón de aire, reduciendo el flujo descendente y la resistencia inducida.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El calentamiento de la pista que aumenta la presión dinámica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El uso obligatorio de flaps fowler en aterrizajes.', FALSE);

-- Pregunta 41
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿A qué altura se reconoce típicamente el efecto suelo?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'A dos veces la envergadura del avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A una altura igual a la mitad de la envergadura.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Solo cuando las ruedas tocan el pavimento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Por encima de los 100 pies de altura sobre el terreno.', FALSE);

-- Pregunta 42
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué componente de la sustentación hace virar al avión?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La componente vertical.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La componente horizontal de la sustentación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La fuerza de gravedad multiplicada por el ángulo de ataque.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La tracción asimétrica de la hélice.', FALSE);

-- Pregunta 43
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es el "Efecto Torque" en una aeronave monomotor?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La tendencia del avión a guiñar a la derecha por el factor P.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La fuerza que intenta rotar la aeronave en dirección opuesta al giro de la hélice (tendencia a virar a la izquierda).', TRUE),
((SELECT MAX(id) FROM pregunta), 'El aumento de la sustentación en el ala que sube.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La vibración causada por el flujo turbulento en el empenaje.', FALSE);

-- Pregunta 44
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se define el "Factor de Carga"?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El peso total del combustible dividido por la superficie alar.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La relación entre la fuerza total que actúa sobre el avión y el peso del mismo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El límite de rotura de los estabilizadores verticales.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La cantidad de G negativos soportados en crucero.', FALSE);

-- Pregunta 45
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el factor de carga (G) en un viraje nivelado con 60º de inclinación?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1G.', FALSE),
((SELECT MAX(id) FROM pregunta), '1.5G.', FALSE),
((SELECT MAX(id) FROM pregunta), '2G.', TRUE),
((SELECT MAX(id) FROM pregunta), '4G.', FALSE);

-- Pregunta 46
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el límite máximo de G positivos para un avión de categoría NORMAL?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '+2.0 g.', FALSE),
((SELECT MAX(id) FROM pregunta), '+3.8 g.', FALSE),
((SELECT MAX(id) FROM pregunta), '+4.4 g.', TRUE),
((SELECT MAX(id) FROM pregunta), '+6.0 g.', FALSE);

-- Pregunta 47
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué sucede con el Radio de Viraje si la velocidad aumenta manteniendo el ángulo de banqueo constante?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El radio de viraje disminuye.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El radio de viraje aumenta.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El radio permanece igual pero aumenta la tasa de viraje (ROT).', FALSE),
((SELECT MAX(id) FROM pregunta), 'El avión entra automáticamente en pérdida acelerada.', FALSE);

-- Pregunta 48
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es la "Estabilidad Dinámica"?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La capacidad de responder instantáneamente a los mandos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cuando un avión vuelve a su posición original con oscilaciones cada vez más pequeñas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La tendencia a alejarse de la posición original tras una perturbación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El equilibrio entre tracción y resistencia parásita.', FALSE);

-- Pregunta 49
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo afecta la posición del Centro de Gravedad (CG) a la estabilidad?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Un CG muy posterior hace al avión más estable.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un CG posterior aumenta la inestabilidad y dificulta la recuperación de pérdidas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El CG no tiene relación con la estabilidad longitudinal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El CG debe estar exactamente en el borde de ataque para el equilibrio.', FALSE);

-- Pregunta 50
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el medio más importante para la estabilidad lateral direccional?', '1');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El diedro de las alas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La quilla (estabilizador vertical y superficie lateral).', TRUE),
((SELECT MAX(id) FROM pregunta), 'El uso de flaps partido.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La cuerda aerodinámica media.', FALSE);

-- ============================================
-- FIN DEL SCRIPT
-- ============================================
