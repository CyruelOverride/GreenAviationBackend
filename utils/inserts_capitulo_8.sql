-- ============================================
-- INSERCIÓN DE PREGUNTAS Y OPCIONES
-- Capítulo: 8 - Meteorología Aeronáutica
-- ============================================

-- Pregunta 1
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuáles son las dos causas principales que provocan la circulación atmosférica?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La humedad relativa y la presión barométrica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El Sol y la rotación de la tierra.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Las radiaciones terrestres y el vapor de agua.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La fricción orográfica y la gravedad.', FALSE);

-- Pregunta 2
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué proporción se calienta la atmósfera por radiaciones terrestres frente a los rayos directos del sol?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '50% por radiaciones terrestres y 50% por rayos directos.', FALSE),
((SELECT MAX(id) FROM pregunta), '15% por radiaciones terrestres y 85% por rayos directos.', FALSE),
((SELECT MAX(id) FROM pregunta), '85% por radiaciones terrestres y 15% por rayos directos.', TRUE),
((SELECT MAX(id) FROM pregunta), '100% por radiaciones terrestres.', FALSE);

-- Pregunta 3
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la extensión aproximada de la troposfera en las regiones ecuatoriales?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Hasta 20.000 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hasta 70.000 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hasta 30.000 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hasta 48.000 pies.', TRUE);

-- Pregunta 4
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué porcentaje de la atmósfera está compuesto por nitrógeno según el modelo estándar?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '21%', FALSE),
((SELECT MAX(id) FROM pregunta), '0,90%', FALSE),
((SELECT MAX(id) FROM pregunta), '78%', TRUE),
((SELECT MAX(id) FROM pregunta), '0,03%', FALSE);

-- Pregunta 5
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Hasta qué altitud se mantiene constante la proporción de los gases principales de la atmósfera?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '10.000 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), '48.000 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), '70.000 pies.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Nivel del mar.', FALSE);

-- Pregunta 6
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué rango de altitud comprende la denominada "zona habitable" de la atmósfera?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Entre 10.000 y 20.000 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Desde el nivel del mar hasta 10.000 pies.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Desde el nivel del mar hasta 48.000 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Únicamente a nivel del mar.', FALSE);

-- Pregunta 7
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según la Atmósfera Estándar (ISA), ¿cuál es el valor de la presión al nivel del mar?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1013 milibares o 29.92 pulgadas de Hg.', TRUE),
((SELECT MAX(id) FROM pregunta), '760 milibares o 15 pulgadas de Hg.', FALSE),
((SELECT MAX(id) FROM pregunta), '1000 milibares o 30.00 pulgadas de Hg.', FALSE),
((SELECT MAX(id) FROM pregunta), '1013 milibares o 760 pulgadas de Hg.', FALSE);

-- Pregunta 8
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el gradiente térmico vertical estándar por cada 1000 pies de ascenso?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '6.5 ºC', FALSE),
((SELECT MAX(id) FROM pregunta), '1.98 ºC', TRUE),
((SELECT MAX(id) FROM pregunta), '0.5 ºC', FALSE),
((SELECT MAX(id) FROM pregunta), '3.25 ºC', FALSE);

-- Pregunta 9
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué momento del día se produce normalmente la temperatura mínima según la evolución diaria?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Exactamente a la salida del sol.', FALSE),
((SELECT MAX(id) FROM pregunta), 'De 2 a 3 horas antes de la salida del sol.', FALSE),
((SELECT MAX(id) FROM pregunta), 'De 2 a 3 horas después de la salida del sol.', TRUE),
((SELECT MAX(id) FROM pregunta), 'A medianoche.', FALSE);

-- Pregunta 10
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se denomina al fenómeno donde la temperatura aumenta con la altura en lugar de disminuir?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Gradiente vertical positivo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Inversión térmica.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Isoterma superficial.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Convección adiabática.', FALSE);

-- Pregunta 11
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el peligro principal de una inversión de temperatura para la aviación?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La inversión en altura.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La inversión en superficie.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El aumento de la presión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La disminución de la humedad.', FALSE);

-- Pregunta 12
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué efecto tiene la disminución de la presión atmosférica en las actuaciones de un avión?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Disminuye la distancia de despegue.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aumenta la tasa de ascenso.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Incrementa las distancias de despegue y aterrizaje.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Reduce la velocidad necesaria para despegar.', FALSE);

-- Pregunta 13
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En condiciones estándar, ¿a cuánto equivale el gradiente vertical de presión?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1 milibar cada 100 metros.', FALSE),
((SELECT MAX(id) FROM pregunta), '1 milibar cada 8 metros.', TRUE),
((SELECT MAX(id) FROM pregunta), '8 milibares cada 1 metro.', FALSE),
((SELECT MAX(id) FROM pregunta), '1 milibar cada 1000 pies.', FALSE);

-- Pregunta 14
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué indican las isobaras que se encuentran muy juntas en una carta meteorológica?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Viento muy suave.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Alta humedad relativa.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Viento muy fuerte.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Ausencia de gradiente horizontal.', FALSE);

-- Pregunta 15
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En el hemisferio sur, ¿cómo circulan los vientos en un sistema de alta presión (anticiclónico)?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'En sentido horario.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En sentido anti-horario.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Perpendicular a las isobaras.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Directamente hacia el centro del sistema.', FALSE);

-- Pregunta 16
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué procesos son los únicos responsables de añadir vapor de agua a la atmósfera?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Condensación y deposición.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Fusión y congelación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Evaporación y sublimación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Advección y convección.', FALSE);

-- Pregunta 17
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es el "punto de rocío"?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La temperatura máxima que el aire puede soportar.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El peso del vapor de agua en una unidad de aire.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La temperatura a la cual el aire debe ser enfriado para alcanzar la saturación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El porcentaje de humedad en comparación con el total posible.', FALSE);

-- Pregunta 18
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Si la diferencia entre la temperatura y el punto de rocío es de 2 grados o menos, ¿qué fenómeno es probable que ocurra?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Tormentas eléctricas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Formación de niebla.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Turbulencia de aire claro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cizalladura del viento.', FALSE);

-- Pregunta 19
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Hacia dónde fluye siempre el aire en la atmósfera?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'De las áreas de baja presión hacia las de alta presión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'De las áreas de alta presión hacia las de baja presión.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Únicamente de forma vertical debido a la temperatura.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Siguiendo el sentido de rotación de la tierra exclusivamente.', FALSE);

-- Pregunta 20
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Por qué el viento se expresa según el Norte Magnético en los informes de aeródromo?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Porque la fuerza de Coriolis lo desvía así.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porque las pistas están orientadas según el Norte Magnético.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Debido a la gravedad terrestre.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Para coincidir con las cartas de altura.', FALSE);

-- Pregunta 21
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es la cizalladura (Wind Shear)?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El valor máximo en intensidad que alcanza el viento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La turbulencia producida por el choque del viento con obstáculos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El cambio de dirección e intensidad del viento en poco espacio vertical u horizontal.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Un sistema de alta presión asociado a buen tiempo.', FALSE);

-- Pregunta 22
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Dónde se suele dar la Turbulencia en Aire Claro (TAC)?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cerca de la superficie por fricción.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cerca de la tropopausa, en la corriente del chorro.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Dentro de las nubes cúmulos nimbus.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En la zona opuesta a la que viene el viento en una montaña.', FALSE);

-- Pregunta 23
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuáles son los tres requisitos necesarios para la formación de una nube?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Masa de aire seca, enfriamiento y núcleos de condensación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Masa de aire húmeda, calentamiento y alta presión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Masa de aire húmeda, enfriamiento y núcleos de condensación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Vapor de agua, núcleos de condensación y cristales de hielo.', FALSE);

-- Pregunta 24
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué tipo de nubes se forman por columnas de aire caliente que ascienden (convección)?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Stratus y Nimbostratus.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cirrus y Cirrostratus.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cumulus y Cumulonimbus.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Altostratus y Altocumulus.', FALSE);

-- Pregunta 25
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿A qué altura se encuentran las bases de las nubes medias en latitudes medias?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Superficie a 2000 m.', FALSE),
((SELECT MAX(id) FROM pregunta), '2000 a 7000 m.', TRUE),
((SELECT MAX(id) FROM pregunta), '5000 a 13000 m.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hasta los 12000 m.', FALSE);

-- Pregunta 26
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la principal diferencia entre niebla y neblina?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La niebla tiene visibilidad superior a 1 km.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La neblina tiene visibilidad inferior a 1 km.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La niebla tiene visibilidad inferior a 1 km y la neblina superior a 1 km.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La neblina solo se forma por radiación.', FALSE);

-- Pregunta 27
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Para fines de aviación, ¿qué se define como "techo"?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La capa más alta de nubes reportada.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cualquier capa de nubes que cubra más de un octavo del cielo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La capa más baja de nubes reportada como quebrado (broken) o cubierto (overcast).', TRUE),
((SELECT MAX(id) FROM pregunta), 'El nivel donde la visibilidad se reduce a menos de 3 km.', FALSE);

-- Pregunta 28
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué características definen a una masa de aire?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Únicamente su temperatura y presión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Su dimensión horizontal de al menos 5000 km.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Poseer características físicas homogéneas de temperatura, humedad y presión.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Su origen exclusivamente en los océanos tropicales.', FALSE);

-- Pregunta 29
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se clasifica una masa de aire que partió de su lugar de origen hace menos de 2 días?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Masa de aire activa.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Masa de aire vieja.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Masa de aire joven.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Masa de aire estancada.', FALSE);

-- Pregunta 30
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué símbolo representa a un frente frío en una carta sinóptica?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Una línea de medialunas rojas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una línea de triángulos azules.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Una línea púrpura con triángulos y medialunas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una línea de triángulos y medialunas alternadas de color rojo y azul.', FALSE);

-- Pregunta 31
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el ritmo de progresión típico de un frente frío?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '10 a 25 mph.', FALSE),
((SELECT MAX(id) FROM pregunta), '50 a 100 mph.', FALSE),
((SELECT MAX(id) FROM pregunta), '25 a 30 mph.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Se mantiene estacionario por días.', FALSE);

-- Pregunta 32
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué cambio en la presión barométrica indica el paso inminente de un frente frío?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aumento constante.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Presión estable.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Caída de la presión barométrica.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La presión no se ve afectada por los frentes.', FALSE);

-- Pregunta 33
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué fenómeno se puede producir 100 a 500 km por delante de un frente frío con aire muy inestable?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Nieblas de advección.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Línea de turbonada.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Frente ocluido.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Inversión térmica de superficie.', FALSE);

-- Pregunta 34
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo es la pendiente de la nubosidad en un frente cálido en comparación con uno frío?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Mucho más pronunciada.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Vertical.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Menos pronunciada.', TRUE),
((SELECT MAX(id) FROM pregunta), 'No existe pendiente en los frentes cálidos.', FALSE);

-- Pregunta 35
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué tipo de nubes aparecen primero, a gran altura y distancia, antes de un frente cálido?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cumulonimbus (CB).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cirros (CI).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Stratus (ST).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Nimbostratus (NS).', FALSE);

-- Pregunta 36
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuándo se produce un frente ocluido?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cuando dos masas de aire conviven pacíficamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cuando un frente frío alcanza a un frente cálido.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Cuando una masa de aire se estanca sobre un desierto.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cuando un frente cálido desplaza a uno frío rápidamente.', FALSE);

-- Pregunta 37
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué tres elementos son necesarios para la formación de una tormenta (CB)?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aire seco, gradiente estable y núcleos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Vapor de agua, gradiente térmico inestable y actividad convectiva.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Alta presión, vientos suaves y humedad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Inversión térmica, núcleos de condensación y aire frío.', FALSE);

-- Pregunta 38
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué etapa del desarrollo de una tormenta hay solo corrientes ascendentes?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Madurez.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Debilitamiento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Crecimiento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Estado de equilibrio.', FALSE);

-- Pregunta 39
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la fase más activa de una tormenta, donde hay corrientes ascendentes y descendentes?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Crecimiento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Madurez.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Disipación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Oclusión.', FALSE);

-- Pregunta 40
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿A qué se debe el engelamiento en una aeronave?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Al enfriamiento del combustible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A que el avión actúa como núcleo de condensación en presencia de agua superenfriada.', TRUE),
((SELECT MAX(id) FROM pregunta), 'A la baja presión en el intradós del ala.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Únicamente al contacto con cristales de hielo a muy bajas temperaturas.', FALSE);

-- Pregunta 41
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el rango de temperatura donde la formación de hielo es más intensa y peligrosa?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Entre -10 ºC y -20 ºC.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Por debajo de -20 ºC.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Entre 0 ºC y -10 ºC.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Por encima de 0 ºC.', FALSE);

-- Pregunta 42
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué tipo de hielo es difícil de eliminar, peligrosísimo y se asocia con gotas grandes en nubes CB?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Escarcha.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hielo granulado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hielo vítreo o cristalino.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Nieve en suspensión.', FALSE);

-- Pregunta 43
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué informe meteorológico proporciona las condiciones actuales en un aeropuerto específico cada hora?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'TAF.', FALSE),
((SELECT MAX(id) FROM pregunta), 'SIGMET.', FALSE),
((SELECT MAX(id) FROM pregunta), 'METAR.', TRUE),
((SELECT MAX(id) FROM pregunta), 'AIRMET.', FALSE);

-- Pregunta 44
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué informe se emite cuando hay un empeoramiento o mejoramiento repentino entre dos METAR?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'TAF.', FALSE),
((SELECT MAX(id) FROM pregunta), 'SPECI.', TRUE),
((SELECT MAX(id) FROM pregunta), 'PIREP.', FALSE),
((SELECT MAX(id) FROM pregunta), 'RAREP.', FALSE);

-- Pregunta 45
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el periodo de validez general de un pronóstico TAF?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1 hora.', FALSE),
((SELECT MAX(id) FROM pregunta), '6 horas.', FALSE),
((SELECT MAX(id) FROM pregunta), '30 horas.', TRUE),
((SELECT MAX(id) FROM pregunta), '12 horas.', FALSE);

-- Pregunta 46
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En un TAF, ¿qué indica el término "TEMPO"?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cambio gradual en las condiciones.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cambios esporádicos con duración inferior a una hora.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Probabilidad de ocurrencia del 30%.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Condiciones que prevalecerán al final del periodo.', FALSE);

-- Pregunta 47
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué tipo de cartas muestran el estado vertical de la atmósfera e incluyen isohipsas?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cartas de superficie.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cartas de tiempo significativo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cartas de altura o topográficas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Cartas sinópticas de presión a nivel del mar.', FALSE);

-- Pregunta 48
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué servicio ofrece una transmisión grabada de la información meteorológica de un aeropuerto?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'PIREP.', FALSE),
((SELECT MAX(id) FROM pregunta), 'SIGMET.', FALSE),
((SELECT MAX(id) FROM pregunta), 'ATIS.', TRUE),
((SELECT MAX(id) FROM pregunta), 'AIRMET.', FALSE);

-- Pregunta 49
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Para quién es de interés operacional principal la información contenida en un AIRMET?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Solo para aeronaves comerciales pesadas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Principalmente para aeronaves ligeras o con capacidades limitadas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Únicamente para controladores de tráfico aéreo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Para vuelos transoceánicos a gran altura.', FALSE);

-- Pregunta 50
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En la clave METAR, ¿qué significa la contracción "BKN"?', '8');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cielo despejado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Dispersas (3/8 a 4/8 de cielo cubierto).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Fragmentado (5/8 a 7/8 de cielo cubierto).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Cubierto (8/8 de cielo cubierto).', FALSE);

-- ============================================
-- FIN DE LOS INSERTS DEL CAPÍTULO 8
-- ============================================

