-- ============================================
-- INSERCIÓN DE PREGUNTAS Y OPCIONES
-- Capítulo: 6 - Instrumentos de Vuelo
-- ============================================

-- Pregunta 1
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué grandes familias se clasifican los instrumentos de vuelo según el texto?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Instrumentos electrónicos y analógicos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Instrumentos de presión y de propiedades giroscópicas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Instrumentos de navegación e instrumentos de motor.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Instrumentos de pitot y de vacío.', FALSE);

-- Pregunta 2
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué presiones utiliza el sistema pitot-estático para el funcionamiento de sus instrumentos asociados?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Presión de succión y presión atmosférica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Presión estática y presión dinámica.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Presión interna del fuelle y presión de impacto.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Presión de aceite y presión de admisión.', FALSE);

-- Pregunta 3
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál de los siguientes instrumentos NO pertenece al sistema pitot-estático?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Anemómetro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Altímetro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Giro Direccional.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Variómetro.', FALSE);

-- Pregunta 4
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué función cumplen las "tomas estáticas" en el avión?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Recoger la presión total del aire durante el movimiento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Calentar el aire para evitar la formación de hielo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Recoger la presión estática en zonas donde el aire está en remanso.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Medir la velocidad del aire a través del computador de vuelo.', FALSE);

-- Pregunta 5
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se define el instrumento conocido como velocímetro o ASI?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Un manómetro de presión diferencial sensible.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Un giroscopio de eje vertical.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un fuelle de aneroides sellado a 29,92 "Hg.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un termómetro de temperatura exterior.', FALSE);

-- Pregunta 6
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué indica la Velocidad Indicada (IAS)?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La velocidad corregida por error de instalación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La velocidad real del avión sobre el suelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La velocidad leída directamente en el instrumento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La velocidad corregida por compresibilidad a más de 250 nudos.', FALSE);

-- Pregunta 7
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es la Velocidad Verdadera (TAS)?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La velocidad leída en el GPS ajustada por el viento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La IAS o CAS corregida por error de densidad.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La velocidad mínima de control con un motor inoperativo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La velocidad máxima de crucero estructural.', FALSE);

-- Pregunta 8
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según la regla práctica del texto, ¿cuánto se debe añadir a la CAS para obtener la TAS?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1% por cada 500 pies de altitud.', FALSE),
((SELECT MAX(id) FROM pregunta), '2% por cada 1.000 pies de altitud.', TRUE),
((SELECT MAX(id) FROM pregunta), '5% por cada 2.000 pies de altitud.', FALSE),
((SELECT MAX(id) FROM pregunta), '10% por cada 5.000 pies de altitud.', FALSE);

-- Pregunta 9
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué velocidad se expresa en número de Match y es importante a velocidades superiores a 250 nudos?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Ground Speed (GS).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Equivalent Air Speed (EAS).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Calibrated Air Speed (CAS).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Maneuvering Speed (VA).', FALSE);

-- Pregunta 10
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo afecta un viento de frente a la Ground Speed (GS)?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La GS aumenta proporcionalmente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La GS se mantiene igual a la TAS.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La GS disminuye.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La GS se vuelve igual a la IAS.', FALSE);

-- Pregunta 11
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué representa el límite inferior del Arco Verde en el velocímetro?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La velocidad de pérdida en configuración de aterrizaje (VSo).', FALSE),
((SELECT MAX(id) FROM pregunta), 'La velocidad de pérdida en configuración limpia (VS1).', TRUE),
((SELECT MAX(id) FROM pregunta), 'La velocidad máxima con flaps extendidos (VFE).', FALSE),
((SELECT MAX(id) FROM pregunta), 'La velocidad de crucero estructural máxima (VNO).', FALSE);

-- Pregunta 12
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el significado del Arco Amarillo en el velocímetro?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Margen de operación normal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Margen de precaución, no exceder excepto en aire calmo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Margen normal de operación con flaps extendidos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Velocidad de maniobra estructural.', FALSE);

-- Pregunta 13
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué indica la Línea Roja (VNE) en el velocímetro?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El mejor régimen de ascenso.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La velocidad de crucero máxima recomendada.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La velocidad a partir de la cual el avión corre riesgo de desintegración.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La velocidad máxima para operar el tren de aterrizaje.', FALSE);

-- Pregunta 14
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué marca el límite inferior del Arco Blanco?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'VS1, velocidad de pérdida limpia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'VSo, velocidad de pérdida en configuración de aterrizaje.', TRUE),
((SELECT MAX(id) FROM pregunta), 'VFE, máxima velocidad con flaps.', FALSE),
((SELECT MAX(id) FROM pregunta), 'VX, mejor ángulo de ascenso.', FALSE);

-- Pregunta 15
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué velocidad se define como el "Mejor Ángulo de Ascenso" para salvar un obstáculo?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'VY.', FALSE),
((SELECT MAX(id) FROM pregunta), 'VA.', FALSE),
((SELECT MAX(id) FROM pregunta), 'VX.', TRUE),
((SELECT MAX(id) FROM pregunta), 'VLE.', FALSE);

-- Pregunta 16
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué sucede con la Velocidad de Maniobra (VA) si el peso de la aeronave disminuye?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La VA aumenta.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La VA disminuye.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La VA se mantiene constante.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La VA solo depende de la altitud de densidad.', FALSE);

-- Pregunta 17
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué indica la "Blue Line" (línea azul) en el velocímetro de un avión bimotor?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La velocidad mínima de control (VMC).', FALSE),
((SELECT MAX(id) FROM pregunta), 'El mejor régimen de ascenso con un motor inoperativo (VYSE).', TRUE),
((SELECT MAX(id) FROM pregunta), 'La velocidad máxima con el tren extendido (VLE).', FALSE),
((SELECT MAX(id) FROM pregunta), 'La velocidad de crucero máxima.', FALSE);

-- Pregunta 18
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿A cuántos metros equivale una Milla Náutica?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1.609 metros.', FALSE),
((SELECT MAX(id) FROM pregunta), '1.853 metros.', TRUE),
((SELECT MAX(id) FROM pregunta), '1.000 metros.', FALSE),
((SELECT MAX(id) FROM pregunta), '1.551 metros.', FALSE);

-- Pregunta 19
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el componente principal del altímetro que se expande o contrae con los cambios de presión?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El tubo Bourdon.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El fuelle de aneroides sellado.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El rotor giroscópico.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El imán compensador.', FALSE);

-- Pregunta 20
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Al leer un altímetro, ¿qué indica la aguja más pequeña?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cientos de pies.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Miles de pies.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Decenas de miles de pies.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Pies individuales.', FALSE);

-- Pregunta 21
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué se coloca en la "Ventanilla de Kollsman"?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La temperatura exterior (OAT).', FALSE),
((SELECT MAX(id) FROM pregunta), 'El rumbo magnético para ajustar el giro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La presión tomada como referencia de ajuste del altímetro.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El régimen de ascenso deseado.', FALSE);

-- Pregunta 22
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se define el ajuste altimétrico QNH?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Presión barométrica de un lugar corregida al nivel del mar.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Ajuste de 29,92 "Hg para niveles de vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Presión absoluta que marca cero en tierra.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ajuste corregido únicamente por error de temperatura.', FALSE);

-- Pregunta 23
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué ajuste se utiliza para volar por "Niveles de Vuelo" (FL)?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'QNH.', FALSE),
((SELECT MAX(id) FROM pregunta), 'QFE.', FALSE),
((SELECT MAX(id) FROM pregunta), 'QNE (29,92 "Hg o 1013.2 hPa).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Variación magnética.', FALSE);

-- Pregunta 24
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿A qué altitud se encuentra fija la "Altitud de Transición" en Uruguay?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1.000 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), '3.000 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), '5.000 pies.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Varía según la presión local.', FALSE);

-- Pregunta 25
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué error afecta al altímetro en un día extremadamente frío?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El avión está más alto de lo que indica el instrumento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El avión está más bajo de lo que indica el instrumento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El altímetro se bloquea por congelación del fuelle.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El error de precesión aumenta 15° por hora.', FALSE);

-- Pregunta 26
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué otro nombre recibe el Variómetro?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Altímetro de presión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'VSI o CLIMB.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Bastón de viraje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Giro Direccional.', FALSE);

-- Pregunta 27
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el rango de retraso (lag) común en las indicaciones de un VSI?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1 a 3 segundos.', FALSE),
((SELECT MAX(id) FROM pregunta), '6 a 9 segundos.', TRUE),
((SELECT MAX(id) FROM pregunta), '15 a 20 segundos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'No tiene retraso, es instantáneo.', FALSE);

-- Pregunta 28
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué indica el VSI cuando el avión vuela en línea recta y nivelada?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1.000 pies por minuto.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El nivel de vuelo actual.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cero (0).', TRUE),
((SELECT MAX(id) FROM pregunta), 'La presión estática local.', FALSE);

-- Pregunta 29
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuáles son los tres instrumentos basados en propiedades giroscópicas?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Altímetro, Velocímetro y Brújula.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Horizonte Artificial, Giro Direccional e Indicador de Viraje.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Variómetro, EGT y Tacómetro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Inclinómetro, Bastón y Manifold.', FALSE);

-- Pregunta 30
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué consiste la propiedad giroscópica de "Rigidez en el espacio"?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La reacción del giroscopio ante una fuerza externa grande.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La resistencia del giroscopio a cualquier esfuerzo que trate de modificar su eje de giro.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La tendencia del rotor a girar en sentido opuesto a la aeronave.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El desajuste permanente por fricción interna.', FALSE);

-- Pregunta 31
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué propiedad utiliza el "Bastón" o indicador de viraje para funcionar?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Rigidez en el espacio.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Precesión.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Magnetismo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Presión diferencial.', FALSE);

-- Pregunta 32
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿A qué presión trabaja normalmente la bomba de succión para el Horizonte y el Giro?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1.8 a 2.1 pulgadas de HG.', FALSE),
((SELECT MAX(id) FROM pregunta), '3.8 a 4.2 pulgadas de HG.', TRUE),
((SELECT MAX(id) FROM pregunta), '29.92 pulgadas de HG.', FALSE),
((SELECT MAX(id) FROM pregunta), '10 a 15 pulgadas de HG.', FALSE);

-- Pregunta 33
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué muestra el Horizonte Artificial (HA)?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El rumbo magnético del avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una imagen de la actitud de la aeronave (cabeceo y alabeo).', TRUE),
((SELECT MAX(id) FROM pregunta), 'El régimen de viraje en grados por segundo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La altitud absoluta sobre el suelo.', FALSE);

-- Pregunta 34
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Por qué el Giro Direccional (DG) no puede acusar automáticamente el Norte Magnético?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Porque es un instrumento puramente mecánico que debe ajustarse con la brújula.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Porque se bloquea por la aceleración del motor.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porque la Tierra rota a 30° por hora.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porque utiliza presión estática en lugar de magnética.', FALSE);

-- Pregunta 35
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la precesión máxima tolerada en un Giro Direccional según el texto?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1º cada 15 minutos.', FALSE),
((SELECT MAX(id) FROM pregunta), '3º cada 15 minutos.', TRUE),
((SELECT MAX(id) FROM pregunta), '15º cada hora.', FALSE),
((SELECT MAX(id) FROM pregunta), '5º cada 30 minutos.', FALSE);

-- Pregunta 36
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En el coordinador de virajes, ¿qué significa que la bola se desplace hacia adentro del viraje?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El avión está derrapando.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El avión está deslizando ("falta pata").', TRUE),
((SELECT MAX(id) FROM pregunta), 'El viraje es estándar.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El giroscopio ha perdido su rigidez.', FALSE);

-- Pregunta 37
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la forma correcta de centrar la bola en un viraje según el texto?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aumentar la velocidad del motor.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Pisar la bola (apretar el pedal del lado hacia donde está la bola).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Reducir el ángulo de alabeo en el Horizonte Artificial.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ajustar el Giro Direccional con la brújula.', FALSE);

-- Pregunta 38
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuánto tiempo insume completar un viraje de 360 grados si se mantiene un régimen de "viraje estándar"?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1 minuto.', FALSE),
((SELECT MAX(id) FROM pregunta), '2 minutos.', TRUE),
((SELECT MAX(id) FROM pregunta), '3 minutos.', FALSE),
((SELECT MAX(id) FROM pregunta), '4 minutos.', FALSE);

-- Pregunta 39
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué instrumento es obligatorio tanto para vuelos VFR como IFR?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Horizonte Artificial.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Brújula Magnética.', TRUE),
((SELECT MAX(id) FROM pregunta), 'EGT.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Manifold Pressure.', FALSE);

-- Pregunta 40
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué representa el número "6" en la tarjeta de una brújula magnética?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '6 grados.', FALSE),
((SELECT MAX(id) FROM pregunta), '60 grados.', TRUE),
((SELECT MAX(id) FROM pregunta), '600 grados.', FALSE),
((SELECT MAX(id) FROM pregunta), '160 grados.', FALSE);

-- Pregunta 41
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se define la "Variación o Declinación"?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La diferencia en grados entre el Norte Magnético y el Norte Geográfico.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El error causado por los metales del avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El adelanto de la brújula al virar hacia el Sur.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El error por aceleración en rumbos Norte-Sur.', FALSE);

-- Pregunta 42
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué causa el error de "Desviación" en la brújula?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La curvatura de la Tierra.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Campos magnéticos originados en el avión (objetos metálicos, micrófonos).', TRUE),
((SELECT MAX(id) FROM pregunta), 'La rotación terrestre de 15° por hora.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Los cambios de presión estática.', FALSE);

-- Pregunta 43
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según el error de aceleración de la brújula en rumbos E y W, al desacelerar la brújula indicará:', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Más al Norte.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Más al Sur.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Rumbo constante.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un viraje de 3 grados por segundo.', FALSE);

-- Pregunta 44
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué importancia tiene el termómetro O.A.T. en vuelos entre nubes?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Sirve para ajustar el Manifold.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Indica la posibilidad de formación de hielo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Corrige el error de precesión del DG.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mide la temperatura de los gases de escape.', FALSE);

-- Pregunta 45
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué indica el Tacómetro?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La presión de admisión en pulgadas de HG.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El número de revoluciones por minuto del motor (RPM).', TRUE),
((SELECT MAX(id) FROM pregunta), 'La temperatura de la cabeza del cilindro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La cantidad de combustible en galones.', FALSE);

-- Pregunta 46
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué mide el indicador de presión de admisión o MANIFOLD?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La presión del aceite del motor.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La presión de la mezcla de aire y gasolina inyectada en los cilindros.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La presión de los gases de escape.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La presión dinámica del tubo pitot.', FALSE);

-- Pregunta 47
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Si tras encender el motor no hay presión de aceite en 20 segundos, ¿qué debe hacer el piloto?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aumentar la potencia para calentar el aceite.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Apagar el motor.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Esperar 1 minuto si el clima es frío.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Iniciar el rodaje con precaución.', FALSE);

-- Pregunta 48
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Dónde se instala el sensor del indicador de temperatura de cabeza de cilindro (C.H.T.)?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'En el cilindro más frío.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En el cilindro más caliente o menos refrigerado.', TRUE),
((SELECT MAX(id) FROM pregunta), 'En el tubo de escape principal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En el filtro de aire.', FALSE);

-- Pregunta 49
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la ventaja principal de utilizar correctamente el indicador E.G.T.?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aumentar la velocidad de crucero.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Reducir en un 10% el consumo de combustible.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Evitar fallas giroscópicas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Sincronizar las RPM con el Manifold.', FALSE);

-- Pregunta 50
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué significa la sigla EFD en las cabinas modernas?', '6');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Engine Fuel Detector.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Electronic Flight Display.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Emergency Flight Device.', FALSE),
((SELECT MAX(id) FROM pregunta), 'External Flow Direction.', FALSE);

-- ============================================
-- FIN DE LOS INSERTS DEL CAPÍTULO 6
-- ============================================

