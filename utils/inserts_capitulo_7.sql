-- ============================================
-- INSERCIÓN DE PREGUNTAS Y OPCIONES
-- Capítulo: 7 - Navegación Aérea
-- ============================================

-- Pregunta 1
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo define la OACI el método de navegación aérea?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El proceso de pilotar un avión de una posición geográfica a otra conociendo la propia posición.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El procedimiento de cálculo de la posición geográfica con relación a la superficie de la tierra.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El método de navegación que permite la operación de aeronaves en cualquier dirección deseada.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El desplazamiento de un móvil desde un punto a otro mediante el control de la dirección deseada.', FALSE);

-- Pregunta 2
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la consecuencia directa de la característica de "Velocidad" en la navegación de aviones pequeños?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El avión no puede detenerse en vuelo para verificar su posición.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El reabastecimiento en vuelo se vuelve técnicamente imposible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Si se pierde una referencia, el error de posición se incrementa rápidamente.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Las condiciones meteorológicas dejan de ser un factor crítico en la planificación.', FALSE);

-- Pregunta 3
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué define a un "círculo menor" en la esfera terrestre?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cualquier meridiano que pase por los polos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una porción de la esfera cortada exactamente a la mitad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cualquier paralelo de la tierra, exceptuando el Ecuador.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La distancia angular medida sobre un meridiano de 0º a 90º.', FALSE);

-- Pregunta 4
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Al expresar las coordenadas de un punto, ¿cuál es el estándar correcto de formato y orden?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1º Longitud (3 dígitos para grados) y 2º Latitud (2 dígitos para grados).', FALSE),
((SELECT MAX(id) FROM pregunta), '1º Latitud (2 dígitos para grados) y 2º Longitud (3 dígitos para grados).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Solo grados y minutos, omitiendo los segundos para evitar errores de precisión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Orden indistinto, siempre que la Latitud use 3 dígitos y la Longitud 2.', FALSE);

-- Pregunta 5
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Si en Uruguay se recibe una información meteorológica a las 15:00Z, ¿cuál es la hora local correspondiente?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '18:00 Local.', FALSE),
((SELECT MAX(id) FROM pregunta), '15:00 Local.', FALSE),
((SELECT MAX(id) FROM pregunta), '12:00 Local.', TRUE),
((SELECT MAX(id) FROM pregunta), '13:00 Local.', FALSE);

-- Pregunta 6
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿A qué se debe el fenómeno de iluminación del cielo durante el alba y el crepúsculo?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'A la refracción de la luz sobre la superficie del mar.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Al reflejo del sol sobre las nubes bajas (estratos).', FALSE),
((SELECT MAX(id) FROM pregunta), 'A la iluminación de las capas altas de la atmósfera por la luz solar.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Al ángulo de incidencia del sol exactamente a 0º sobre el horizonte.', FALSE);

-- Pregunta 7
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el intervalo angular que define el "Alba Civil", utilizado comúnmente en aviación?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Desde que el Sol tiene una altura de -6º hasta su salida.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Desde la puesta del Sol hasta que su altura es de -6º.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Desde que el Sol tiene una altura de -12º hasta su salida.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El period entre la altura de -18º y la salida del astro.', FALSE);

-- Pregunta 8
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué característica define a la línea ortodrómica?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Corta todos los meridianos con el mismo ángulo de inclinación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es una espiral que termina indefectiblemente en el polo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es el camino más corto entre dos puntos, representando un arco de círculo máximo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Es la línea más utilizada en vuelos largos para evitar cambios de rumbo.', FALSE);

-- Pregunta 9
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Por qué la línea loxodrómica es la más utilizada en la mayoría de los vuelos a pesar de ser un camino más largo?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Porque coincide con el arco del círculo máximo en todas las distancias.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porque corta los meridianos con el mismo ángulo, permitiendo mantener un rumbo constante.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Porque es la única que permite medir distancias mayores a 1000 millas náuticas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porque es una línea recta que une los polos de forma directa.', FALSE);

-- Pregunta 10
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué rango de distancia la loxodrómica y la ortodrómica se consideran coincidentes para fines prácticos?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Únicamente en distancias superiores a 2000 millas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En distancias de hasta 500 millas náuticas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Para distancias menores a 1000 millas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'No coinciden nunca debido a la convergencia de los meridianos.', FALSE);

-- Pregunta 11
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es el "Canevas" en el contexto de la cartografía aeronáutica?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El método utilizado para proyectar la esfera sobre un plano.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La representación a escala de una parte de la esfera terrestre.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El entramado de meridianos y paralelos representados como líneas rectas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La hoja de ruta específica que utiliza un piloto bajo reglas VFR.', FALSE);

-- Pregunta 12
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es una característica indispensable que debe reunir una "buena carta" aeronáutica?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Debe utilizar proyecciones azimutales para todas las latitudes.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Los meridianos y paralelos deben cortarse formando ángulos agudos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Conformidad: tener la misma escala en toda la carta y representar fielmente accidentes geográficos.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Medir las distancias siempre en curvas para ajustarse a la loxodrómica.', FALSE);

-- Pregunta 13
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la principal ventaja de las proyecciones cilíndricas de tipo Mercator?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La precisión absoluta en latitudes superiores a los 80 grados.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Son las únicas que presentan conformidad y muestran la loxodrómica como una línea recta.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Permiten medir grandes distancias sin ninguna deformación escalar.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El punto de observación se sitúa fuera de la esfera terrestre.', FALSE);

-- Pregunta 14
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En una proyección cónica de Lambert con dos paralelos estándar, ¿dónde se ubican estos paralelos?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Uno en el Ecuador y otro en el polo más cercano.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ambos en la zona media de la carta para evitar deformaciones.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Uno a 1/6 y el otro a 5/6 del total de la superficie de la carta.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Exactamente sobre los paralelos 30º y 60º de cada hemisferio.', FALSE);

-- Pregunta 15
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Para qué tipo de aeronaves están diseñadas específicamente las Cartas Seccionales (VFR)?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aviones de alta velocidad que requieren escalas de 1:1.000.000.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Vuelos de largas distancias y planificación estratégica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aviones de velocidad lenta a mediana, con una escala de 1:500.000.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Aeronaves comerciales que operan únicamente bajo reglas instrumentales.', FALSE);

-- Pregunta 16
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En una carta W.A.C. (World Aeronautical Chart), ¿a qué distancia equivale 1 cm medido físicamente?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '2,7 millas náuticas.', FALSE),
((SELECT MAX(id) FROM pregunta), '10 millas náuticas.', TRUE),
((SELECT MAX(id) FROM pregunta), '5,4 millas náuticas o 10 kilómetros.', FALSE),
((SELECT MAX(id) FROM pregunta), '32 millas náuticas.', FALSE);

-- Pregunta 17
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En la descripción de un aeródromo en la carta, ¿qué significa que la superficie de la pista esté marcada con una "G"?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Que la pista es de hormigón o material duro (Hard).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que la pista es de pasto o césped (Grass).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Que el aeródromo cuenta con iluminación mínima para vuelo nocturno.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que la longitud de la pista es de 1000 metros.', FALSE);

-- Pregunta 18
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se define el "Rumbo" (Heading) en navegación aérea?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El recorrido real sobre el terreno efectuado durante el vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La dirección hacia donde apunta la nariz del avión.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El ángulo formado entre el norte magnético y el geográfico.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El recorrido deseado de un avión sobre la superficie de la tierra.', FALSE);

-- Pregunta 19
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué instrumento se utiliza específicamente para la medición del curso o rumbo sobre la carta?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Computador de vuelo E6B.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Brújula magnética de a bordo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Plotter.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Transpondedor.', FALSE);

-- Pregunta 20
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Por qué es necesario aplicar la variación o declinación magnética al planificar un vuelo?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Porque los mapas se refieren al Norte Geográfico, pero la navegación se hace con el Norte Magnético.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Para corregir el error producido por los circuitos eléctricos del avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Para ajustar la velocidad del aire (TAS) a la velocidad de tierra (GS).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porque los meridianos convergen hacia los polos en las proyecciones cónicas.', FALSE);

-- Pregunta 21
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué son las líneas isogónicas?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Líneas que unen puntos con variación magnética cero.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Líneas que representan el curso deseado de un avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Líneas que unen puntos con igual variación magnética.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Líneas que dividen las zonas horarias cada 15 grados de longitud.', FALSE);

-- Pregunta 22
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué factores producen la "Desviación" en la brújula de una aeronave?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La diferencia angular entre el polo norte verdadero y el polo norte magnético.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Campos magnéticos internos por circuitos eléctricos, instrumentos y el funcionamiento del avión.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El efecto del viento de costado sobre el ángulo de deriva.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La curvatura de la tierra en vuelos de larga distancia.', FALSE);

-- Pregunta 23
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el procedimiento para obtener el Rumbo Magnético (TH) en Uruguay?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Al Rumbo Geográfico (TC) se le resta la declinación E.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Al Rumbo Geográfico (TC) se le suma la declinación W.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Al Rumbo Compás (CH) se le suma la corrección por desvío.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Al Rumbo Geográfico (TC) se le aplica directamente el WCA.', FALSE);

-- Pregunta 24
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se define la Trayectoria (Track)?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El recorrido real sobre el terreno efectuado en el vuelo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La dirección hacia donde apunta el eje longitudinal del avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El ángulo de corrección aplicado para compensar el viento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La línea trazada en la carta desde el origen al destino.', FALSE);

-- Pregunta 25
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué representa la Velocidad Tierra (Ground Speed - GS)?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La velocidad leída directamente en el velocímetro de la cabina (IAS).', FALSE),
((SELECT MAX(id) FROM pregunta), 'La velocidad del avión con respecto a la masa de aire circundante.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La velocidad IAS corregida por el efecto (suma o resta) del viento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La velocidad de rotación de la tierra a una latitud determinada.', FALSE);

-- Pregunta 26
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál de estos es uno de los cuatro tipos de navegación mencionados en el texto?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Navegación por satélite (GNSS).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Navegación inercial por giróscopos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Navegación astronómica (basada en los astros).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Navegación por puntos de control dinámicos.', FALSE);

-- Pregunta 27
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Quién desarrolló el computador de vuelo E6B?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La OACI a finales de los años 1940.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El Teniente Naval Philip Dalton a finales de los años 1930.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Un instructor uruguayo para la Dirección de Meteorología.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El inventor de la proyección Mercator.', FALSE);

-- Pregunta 28
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En el computador E6B, ¿qué representan las escalas "B" y "C" respectivamente?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Distancia en millas náuticas y distancia en kilómetros.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Velocidad verdadera y velocidad indicada.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Minutos y Horas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Consumo de combustible y peso en libras.', FALSE);

-- Pregunta 29
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué indica el "Speed Index" (triángulo negro) en el lado de cálculos del E6B?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Representa la marca de una hora (60 minutos) para cálculos de velocidad.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Indica la dirección exacta del viento detectado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Marca el punto para convertir grados Celsius a Fahrenheit.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Señala el curso verdadero (TC) en la rosa de rumbos.', FALSE);

-- Pregunta 30
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Si un avión vuela a 120 MPH, ¿cuántas millas recorrerá en 2 horas según el cálculo de distancia?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '140 millas.', FALSE),
((SELECT MAX(id) FROM pregunta), '220 millas.', FALSE),
((SELECT MAX(id) FROM pregunta), '240 millas.', TRUE),
((SELECT MAX(id) FROM pregunta), '120 millas.', FALSE);

-- Pregunta 31
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Para convertir millas náuticas a millas terrestres en el E6B, ¿qué índices se utilizan en la escala A?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '"KM" y "LBS".', FALSE),
((SELECT MAX(id) FROM pregunta), '"NAUT" y "STAT".', TRUE),
((SELECT MAX(id) FROM pregunta), '"LITERS" y "GAL".', FALSE),
((SELECT MAX(id) FROM pregunta), '"TRUE INDEX" y "WCA".', FALSE);

-- Pregunta 32
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la utilidad principal del reverso (lado del viento) del computador E6B?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Calcular el tiempo de vuelo basado en la distancia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Realizar operaciones trigonométricas para computar el efecto del viento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Identificar las estaciones VOR mediante código Morse.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Convertir galones por hora a litros por hora.', FALSE);

-- Pregunta 33
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué datos se necesitan para calcular un viento desconocido en vuelo?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Solo la velocidad IAS y el tiempo de vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Declinación magnética, desvío y rumbo compás.', FALSE),
((SELECT MAX(id) FROM pregunta), 'True Course (TC), GS, True Heading (TH) y la TAS o IAS.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Latitud, Longitud y la hora UTC.', FALSE);

-- Pregunta 34
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué sucede con la GS si el viento viene del "semiplano de viento de frente"?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La GS aumenta considerablemente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La GS se mantiene igual a la IAS.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La GS será menor que la velocidad del aire.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El avión experimentará una deriva hacia la derecha.', FALSE);

-- Pregunta 35
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿De qué factores depende principalmente la tasa de consumo de combustible?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Únicamente de la distancia total del vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Estado del motor, paso de la hélice, RPM, mezcla y potencia utilizada.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Del tipo de proyección cartográfica utilizada en la planificación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'De la diferencia entre el alba civil y el crepúsculo náutico.', FALSE);

-- Pregunta 36
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es un "Radial" en el sistema de navegación VOR?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cada una de las 360 señales o emisiones de radio emitidas por la estación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El círculo de no emisión situado directamente sobre la antena.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La distancia medida en millas náuticas desde el equipo de tierra.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El ángulo de deriva provocado por el viento de costado.', FALSE);

-- Pregunta 37
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el rango de frecuencias en el que opera un VOR?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '200 Khz a 415 Khz.', FALSE),
((SELECT MAX(id) FROM pregunta), '121,5 Mhz (frecuencia de emergencia).', FALSE),
((SELECT MAX(id) FROM pregunta), '108.00 Mhz a 117.95 Mhz.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Frecuencias bajas LF y medias MF únicamente.', FALSE);

-- Pregunta 38
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué indica la bandera "OFF" en el instrumento VOR de a bordo?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Que el avión se está alejando de la estación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que el CDI está perfectamente centrado en el radial.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que el equipo está sin señal o que la aeronave está sobre la estación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Que la estación emite en una frecuencia de gran altitud (clase H).', FALSE);

-- Pregunta 39
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es una desventaja notable del sistema NDB/ADF?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Su alcance está limitado a la "línea de vista".', FALSE),
((SELECT MAX(id) FROM pregunta), 'Las indicaciones se ven afectadas por estáticos de tormenta.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Requiere una antena de 360 grados en el avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'No sigue la curvatura de la tierra.', FALSE);

-- Pregunta 40
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué define a la "Orientación Relativa" en el uso del ADF?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Ángulo formado en sentido horario entre el rumbo del avión y la estación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La dirección del norte magnético con respecto al avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El radial seleccionado en la rosa de rumbos graduada.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La distancia entre el emisor NDB y el receptor de a bordo.', FALSE);

-- Pregunta 41
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Al seleccionar puntos de control para pilotaje visual, ¿qué se recomienda evitar?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Seleccionar características importantes como ríos o carreteras.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Usar ayudas de radionavegación como apoyo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Tener completa dependencia de un solo punto de control.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Mantener el rumbo si se pasa un punto sin haberlo visto.', FALSE);

-- Pregunta 42
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la primera acción recomendada si un piloto se encuentra perdido?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cambiar el rumbo inmediatamente hacia el sector del viento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Subir (ganar altitud) para aumentar el alcance de radio y cobertura radar.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Realizar un aterrizaje de emergencia en la carretera más cercana.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Apagar el transponder para ahorrar batería.', FALSE);

-- Pregunta 43
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué código se debe establecer en el transponder en una situación de emergencia amenazante?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1200.', FALSE),
((SELECT MAX(id) FROM pregunta), '0900.', FALSE),
((SELECT MAX(id) FROM pregunta), '7700.', TRUE),
((SELECT MAX(id) FROM pregunta), '0300.', FALSE);

-- Pregunta 44
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En caso de viento de costado y estar perdido, ¿qué sector debe analizarse primero?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El sector a favor del viento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El sector opuesto al viento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Directamente hacia el Norte Geográfico.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El área debajo de las capas altas de la atmósfera.', FALSE);

-- Pregunta 45
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué debe incluir obligatoriamente el Piloto al Mando (PIC) en la planificación previa al vuelo?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Un estudio de las proyecciones oblicuas de la zona.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Informes meteorológicos, necesidades de combustible y alternativas (aeropuertos alternados).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Una linterna, incluso si el vuelo es exclusivamente diurno.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El trazado de una línea ortodrómica para vuelos de menos de 10 millas.', FALSE);

-- Pregunta 46
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué significa el acrónimo UTC en el contexto del sistema de tiempo estándar?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Tiempo de Uruguay Coordinado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Universal Terminal Course.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Tiempo Universal Coordinado.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Unidad de Tiempo Cartográfico.', FALSE);

-- Pregunta 47
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es el "Cono de Silencio"?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Una zona de interferencia por tormentas eléctricas en el ADF.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una zona de no emisión que se produce directamente sobre la estación VOR.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El espacio de cabina limitado donde no se deben hacer cálculos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El intervalo entre el alba astronómica y el alba náutica.', FALSE);

-- Pregunta 48
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la escala de una carta de planificación aeronáutica?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1:500.000.', FALSE),
((SELECT MAX(id) FROM pregunta), '1:1.000.000.', FALSE),
((SELECT MAX(id) FROM pregunta), '1:2.333.232.', TRUE),
((SELECT MAX(id) FROM pregunta), '1:100.000.', FALSE);

-- Pregunta 49
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿A cuántos grados de rotación de la tierra equivale una hora?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '360º.', FALSE),
((SELECT MAX(id) FROM pregunta), '1º.', FALSE),
((SELECT MAX(id) FROM pregunta), '15º.', TRUE),
((SELECT MAX(id) FROM pregunta), '30º.', FALSE);

-- Pregunta 50
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En el sistema VOR, si el indicador tiene 5 puntos a cada lado del CDI, ¿cuánto vale cada punto?', '7');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1 grado.', FALSE),
((SELECT MAX(id) FROM pregunta), '2 grados.', TRUE),
((SELECT MAX(id) FROM pregunta), '5 grados.', FALSE),
((SELECT MAX(id) FROM pregunta), '10 grados.', FALSE);

-- ============================================
-- FIN DE LOS INSERTS DEL CAPÍTULO 7
-- ============================================

