-- ============================================
-- INSERCIÓN DE PREGUNTAS Y OPCIONES
-- Capítulo: 3 - Peso, Carga y Centrado de Aeronaves
-- ============================================

-- Pregunta 1
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué consecuencia directa tiene operar una aeronave por encima de su peso máximo según la fuente?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Mejora la estabilidad longitudinal debido al aumento de inercia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Compromete la integridad estructural y afecta negativamente el rendimiento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Permite una mayor velocidad de crucero sin afectar la sustentación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Facilita el control del centro de gravedad en condiciones de viento fuerte.', FALSE);

-- Pregunta 2
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se define el "ARM" (brazo de momento) en los cálculos de balance?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La distancia horizontal en pulgadas desde la línea de referencia (DATUM) al CG.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El producto resultante del peso de un objeto multiplicado por su densidad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La distancia vertical medida desde el suelo hasta el punto de suspensión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El rango total entre el límite anterior y el límite posterior de carga.', FALSE);

-- Pregunta 3
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Respecto al DATUM, ¿qué indica un signo positivo (+) en la medición del brazo?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Que el objeto se encuentra situado hacia la nariz del avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que la medida se toma desde el centro de masa hacia las alas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que la distancia se mide hacia la cola del avión.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Que el peso del objeto supera el peso vacío estándar.', FALSE);

-- Pregunta 4
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué representa el Centro de Gravedad (CG) en una aeronave?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El punto donde el brazo de momento siempre es igual a cero.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El centro de masa o punto teórico donde se asume que se concentra todo el peso.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El plano vertical desde el cual se toman todas las medidas de distancia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La distancia total de la cuerda aerodinámica media expresada en libras.', FALSE);

-- Pregunta 5
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el punto de referencia (DATUM) comúnmente utilizado en aviones de aviación general?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El borde de ataque del ala principal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El eje del tren de aterrizaje de nariz.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La pared de fuego que separa el motor de la cabina.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El centro exacto del compartimento de equipaje.', FALSE);

-- Pregunta 6
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué define el término "RANGO-CG"?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La distancia entre el límite anterior y el límite posterior del centro de gravedad.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El peso máximo que puede soportar el tren de aterrizaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La diferencia entre el peso de despegue y el peso de aterrizaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El área total disponible para la carga de combustible utilizable.', FALSE);

-- Pregunta 7
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El Peso Máximo de Aterrizaje (MLW) está determinado primordialmente por:', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La máxima sustentación que pueden producir las alas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La resistencia estructural del tren de aterrizaje.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La capacidad de frenado de los alerones en pistas cortas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El volumen total de combustible no utilizable en los tanques.', FALSE);

-- Pregunta 8
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Por qué el Peso Máximo de Rampa (MRW) es mayor que el Peso Máximo de Despegue (MTOW)?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Debido al combustible que se consume durante las operaciones de taxi y rodaje.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Porque incluye el peso de los pasajeros que bajan antes del vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Por la necesidad de compensar la falta de sustentación en tierra.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Debido a que el peso del aceite se duplica durante el arranque del motor.', FALSE);

-- Pregunta 9
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El Peso Máximo de Despegue (MTOW) está directamente relacionado con:', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La resistencia estructural del tren de aterrizaje ante impactos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La máxima sustentación que pueden producir las alas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El peso del combustible no utilizable y el aceite no drenable.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La distancia horizontal desde el datum hasta el estabilizador horizontal.', FALSE);

-- Pregunta 10
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué se entiende por "Momento" en los cálculos de balance?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El tiempo que tarda la aeronave en alcanzar su centro de masa.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El producto del peso de un elemento multiplicado por su brazo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La suma del peso vacío básico y la carga útil disponible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La fuerza vertical ejercida por el combustible en las alas.', FALSE);

-- Pregunta 11
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué elementos componen la "Carga Útil" (Payload)?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Estructura, motor y combustible no utilizable.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Únicamente el peso del combustible utilizable para el vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El peso de los ocupantes, carga y equipaje.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La suma del peso vacío licenciado y el aceite de motor completo.', FALSE);

-- Pregunta 12
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según los pesos estándar, ¿cuánto pesa un galón estadounidense de gasolina?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '6,8 libras.', FALSE),
((SELECT MAX(id) FROM pregunta), '7,5 libras.', FALSE),
((SELECT MAX(id) FROM pregunta), '6 libras.', TRUE),
((SELECT MAX(id) FROM pregunta), '8,35 libras.', FALSE);

-- Pregunta 13
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el peso estándar de un galón de combustible Jet A?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '6,0 libras.', FALSE),
((SELECT MAX(id) FROM pregunta), '6,8 libras.', TRUE),
((SELECT MAX(id) FROM pregunta), '7,5 libras.', FALSE),
((SELECT MAX(id) FROM pregunta), '8,35 libras.', FALSE);

-- Pregunta 14
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿A qué equivale el peso estándar del agua por galón estadounidense?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1 kg / Lt o 8,35 libras / US gal.', TRUE),
((SELECT MAX(id) FROM pregunta), '900 gr. / Lt o 7,5 libras / US gal.', FALSE),
((SELECT MAX(id) FROM pregunta), '720 gr. / Lt o 6 libras / US gal.', FALSE),
((SELECT MAX(id) FROM pregunta), '810 gr. / Lt o 6,8 libras / US gal.', FALSE);

-- Pregunta 15
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Bajo qué condición NO se deben utilizar los pesos estándar en los cálculos?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Si se está realizando un vuelo internacional.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Si los pesos reales de los elementos están disponibles.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Si el avión opera por debajo de su peso máximo de rampa.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Si el método de cálculo elegido es el gráfico en lugar del matemático.', FALSE);

-- Pregunta 16
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué función mecánica cumplen los tanques de combustible en las alas, además de almacenar energía?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Actúan como amortiguadores ante turbulencia fuerte.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Elevan el centro de gravedad para mejorar el control lateral.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Reducen la resistencia al avance al aumentar la carga alar.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Permiten que el tren de aterrizaje sea más flexible en el despegue.', FALSE);

-- Pregunta 17
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué riesgo existe al volar con tanques de ala vacíos si el avión tiene tanques en el fuselaje llenos?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aumento excesivo de la sustentación en la nariz.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Riesgo de rotura o desprendimiento al encontrar turbulencia fuerte.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Imposibilidad de realizar el taxi debido al peso en el fuselaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que el brazo de momento se vuelva negativo automáticamente.', FALSE);

-- Pregunta 18
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el "Peso Vacío Licenciado"?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Peso de la estructura, motor(es), combustible no utilizable y aceite no drenable.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Peso de los ocupantes y la carga total permitida por el fabricante.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Peso máximo con el que el avión puede aterrizar sin daños estructurales.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Peso del avión incluyendo todo el combustible utilizable y equipo móvil.', FALSE);

-- Pregunta 19
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Si un objeto está situado delante del DATUM (hacia la nariz), su brazo se mide en:', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Pulgadas positivas (+).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Pulgadas negativas (-).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Porcentaje de MAC.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Libras-pulgadas.', FALSE);

-- Pregunta 20
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué asociación define los términos estándar de la industria usados en el manual?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'OACI (Organización de Aviación Civil Internacional).', FALSE),
((SELECT MAX(id) FROM pregunta), 'GAMA (Asociación de Fabricantes de Aviación General).', TRUE),
((SELECT MAX(id) FROM pregunta), 'IATA (Asociación Internacional de Transporte Aéreo).', FALSE),
((SELECT MAX(id) FROM pregunta), 'FAA (Administración Federal de Aviación).', FALSE);

-- Pregunta 21
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El "Peso Vacío Básico" incluye el peso vacío estándar más:', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El peso de los pasajeros y la carga útil.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El peso de equipos opcionales y especiales instalados.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El combustible utilizable necesario para el vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El peso máximo de rampa menos el combustible de taxi.', FALSE);

-- Pregunta 22
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se puede expresar la ubicación del Centro de Gravedad además de pulgadas?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'En porcentaje de MAC (cuerda aerodinámica media).', TRUE),
((SELECT MAX(id) FROM pregunta), 'En libras por pulgada cuadrada de superficie alar.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En grados de inclinación respecto al panel cortafuegos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En galones de combustible por unidad de momento.', FALSE);

-- Pregunta 23
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué ocurre con la dificultad de control si el CG está fuera de los límites aprobados?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El avión se vuelve más fácil de maniobrar pero consume más.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Tiene como resultado una dificultad de control.', TRUE),
((SELECT MAX(id) FROM pregunta), 'No afecta al control siempre que el peso total sea bajo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mejora la integridad estructural ante impactos fuertes.', FALSE);

-- Pregunta 24
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es el "Standard Empty Weight"?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El peso de los elementos permanentes, fluidos hidráulicos, combustible no utilizable y aceite completo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El peso del avión con carga completa de equipaje pero sin pasajeros.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El peso determinado por la sustentación máxima de las alas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El peso mínimo requerido para que el tren de aterrizaje sea efectivo.', FALSE);

-- Pregunta 25
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué documento debe consultar el piloto para encontrar los gráficos y tablas de peso?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El plan de vuelo presentado ante las autoridades.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El manual de vuelo editado por el constructor del avión.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La lista de equipo móvil de la cabina.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El registro de mantenimiento del tren de aterrizaje.', FALSE);

-- Pregunta 26
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según la norma recomendada de centrado, si no se pueden usar tablas, ¿dónde deben ir los pasajeros más pesados?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'En la parte posterior para equilibrar la nariz.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En el centro exacto del avión sobre las alas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Adelante, situando niños y carga ligera detrás.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Distribuidos uniformemente en los asientos del lado izquierdo.', FALSE);

-- Pregunta 27
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuáles son los tres procedimientos para el cálculo práctico de peso y centrado?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Manual, digital y por sensores de presión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Matemático, gráfico y de tablas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Empírico, estimado y por volumen de carga.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Estructural, aerodinámico y de rendimiento.', FALSE);

-- Pregunta 28
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En el método matemático, ¿cuál es la fórmula para obtener el Momento?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Peso + Brazo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Brazo / Peso.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Peso x Brazo.', TRUE),
((SELECT MAX(id) FROM pregunta), '(Peso x Brazo) / 1000.', FALSE);

-- Pregunta 29
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En los cálculos matemáticos, ¿qué elemento suele tener valores negativos por estar delante del Datum?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El equipaje en el área 2.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El combustible en los tanques de las alas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El aceite.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Los pasajeros de los asientos traseros.', FALSE);

-- Pregunta 30
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la ventaja principal del método gráfico mencionado en el texto?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Permite superar los límites de peso estructural.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Evita efectuar cuentas manuales.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Proporciona un centro de gravedad más estable en la cola.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es el único método aprobado por la Asociación GAMA.', FALSE);

-- Pregunta 31
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué información es necesaria para utilizar el método gráfico?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Gráfico de carga, hoja de pesos y momentos, y gráfico de centrado.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Tabla de consumo de combustible y mapa de vientos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Certificado de piloto y peso máximo de aterrizaje únicamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Gráfico de sustentación y tabla de resistencia al avance.', FALSE);

-- Pregunta 32
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo es el proceso de cálculo en el método de tablas respecto al gráfico?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Es mucho más complejo debido a las raíces cuadradas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El proceso de cálculo es idéntico.', TRUE),
((SELECT MAX(id) FROM pregunta), 'No requiere conocer el momento total del avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se basa únicamente en el peso de los pasajeros.', FALSE);

-- Pregunta 33
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué componentes se proporcionan en el método de tablas?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Tabla de pesos y momentos, hoja de pesos y momentos, y tabla de límites.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Lista de pasajeros y tabla de distancias de despegue.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Gráfico de crucero y tabla de altitudes recomendadas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Tabla de pesos de componentes estructurales y de motor.', FALSE);

-- Pregunta 34
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En el ejemplo de "Carga y ajuste de equipaje", ¿cuál es el límite del Área 1?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '40 libras.', FALSE),
((SELECT MAX(id) FROM pregunta), '120 libras.', FALSE),
((SELECT MAX(id) FROM pregunta), '160 libras.', FALSE),
((SELECT MAX(id) FROM pregunta), '80 libras.', TRUE);

-- Pregunta 35
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Si se carga equipaje en el Área 1 y el Área 2 combinadas, ¿cuál es el peso máximo permitido en el ejemplo?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '160 libras.', FALSE),
((SELECT MAX(id) FROM pregunta), '40 libras.', FALSE),
((SELECT MAX(id) FROM pregunta), '120 libras.', TRUE),
((SELECT MAX(id) FROM pregunta), '200 libras.', FALSE);

-- Pregunta 36
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué peso estándar por litro tiene el aceite de motor?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '720 gramos.', FALSE),
((SELECT MAX(id) FROM pregunta), '810 gramos.', FALSE),
((SELECT MAX(id) FROM pregunta), '900 gramos.', TRUE),
((SELECT MAX(id) FROM pregunta), '1 kilogramo.', FALSE);

-- Pregunta 37
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El Peso Máximo de Combustible Cero es:', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El peso que debe dejarse para cargar el máximo de combustible utilizable.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El peso total del avión cuando aterriza sin combustible de reserva.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El peso de la estructura sin el aceite ni el combustible no utilizable.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El peso máximo que permiten las alas cuando el fuselaje está vacío.', FALSE);

-- Pregunta 38
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el peso de un litro de combustible Jet A según el estándar?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '720 gr.', FALSE),
((SELECT MAX(id) FROM pregunta), '810 gr.', TRUE),
((SELECT MAX(id) FROM pregunta), '900 gr.', FALSE),
((SELECT MAX(id) FROM pregunta), '1 kg.', FALSE);

-- Pregunta 39
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué indica el manual respecto a la carga de aceite para los cálculos de vuelo?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Se debe calcular solo el aceite consumido en el vuelo anterior.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se asume normalmente que hay una carga completa para todos los vuelos.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El aceite no se cuenta por estar fuera del compartimento de carga.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Debe restarse del peso de los pasajeros delanteros.', FALSE);

-- Pregunta 40
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué unidades se expresan comúnmente los momentos totales en los gráficos de centrado?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Libras-galón.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Libras-pulgadas (a veces divididas por 1000).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Pulgadas cuadradas por kilogramo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Galones por pulgada de brazo.', FALSE);

-- Pregunta 41
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué factor limita principalmente el peso para iniciar el despegue (MTOW)?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La resistencia estructural del tren de aterrizaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La capacidad de frenado en rampa.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La máxima sustentación que puede crear el ala.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El volumen de los tanques de combustible del fuselaje.', FALSE);

-- Pregunta 42
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué dimensiones definen al CG como un punto en la aeronave?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Es unidimensional (longitudinal).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es bidimensional (longitudinal y lateral).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es tridimensional (longitudinal, lateral y vertical).', TRUE),
((SELECT MAX(id) FROM pregunta), 'No tiene dimensiones físicas, es solo una medida de tiempo.', FALSE);

-- Pregunta 43
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué plano vertical se utiliza para medir todas las distancias del brazo?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El plano de rotación de la hélice.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El Datum.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El plano del suelo bajo el tren principal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La línea de cuerda media del ala.', FALSE);

-- Pregunta 44
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Si un avión está equilibrado sobre su CG, ¿qué sucedería si lo colgáramos de ese punto?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Se inclinaría violentamente hacia la nariz por el peso del motor.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Quedaría en equilibrio.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Giraría sobre su eje lateral indefinidamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El brazo de momento se volvería negativo automáticamente.', FALSE);

-- Pregunta 45
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el peso de 10 galones de gasolina en libras?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '68 libras.', FALSE),
((SELECT MAX(id) FROM pregunta), '75 libras.', FALSE),
((SELECT MAX(id) FROM pregunta), '60 libras.', TRUE),
((SELECT MAX(id) FROM pregunta), '83,5 libras.', FALSE);

-- Pregunta 46
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según el cuadro de ejemplo, si el Peso Vacio Licenciado es 1045 lbs y su momento es 34.6, ¿qué es 34.6?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El brazo de momento en pulgadas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El momento total en libras-pulgadas dividido por 1000.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El peso del aceite en cuartos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La distancia desde el datum hasta el asiento del piloto.', FALSE);

-- Pregunta 47
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué rango de peso se muestra en el eje vertical del "Gráfico de Centrado" del ejemplo?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'De 0 a 400 libras.', FALSE),
((SELECT MAX(id) FROM pregunta), 'De 1150 a 1600 libras.', TRUE),
((SELECT MAX(id) FROM pregunta), 'De 35 a 60 libras-pulgadas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'De 10 a 35 galones.', FALSE);

-- Pregunta 48
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En el cálculo de peso y balance, ¿qué se debe sumar al peso vacío básico?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Todo lo que se cargue en el avión (combustible, pasajeros, carga).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Únicamente el combustible que se planea quemar en taxi.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El peso de la estructura menos el aceite no drenable.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El brazo de momento del datum negativo.', FALSE);

-- Pregunta 49
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Por qué es fundamental volar dentro de los límites de peso y balance?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Para poder cargar más combustible del permitido.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es fundamental para la seguridad del vuelo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Para evitar el uso del manual de vuelo en operaciones diarias.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Para reducir el brazo de momento del aceite.', FALSE);

-- Pregunta 50
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el momento total de un objeto de 10 lb situado a un brazo de 70"?', '3');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '7 libras-pulgadas.', FALSE),
((SELECT MAX(id) FROM pregunta), '700 libras-pulgadas.', TRUE),
((SELECT MAX(id) FROM pregunta), '0,7 libras-pulgadas.', FALSE),
((SELECT MAX(id) FROM pregunta), '7000 libras-pulgadas.', FALSE);

-- ============================================
-- FIN DE LOS INSERTS DEL CAPÍTULO 3
-- ============================================

