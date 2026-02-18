-- ============================================
-- INSERCIÓN DE PREGUNTAS Y OPCIONES
-- Capítulo: 4 - Performance y Actuaciones del Avión
-- ============================================

-- Pregunta 1
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué factores analiza el capítulo 4 respecto al rendimiento de las aeronaves?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Únicamente el peso y el centrado del avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El peso, condiciones atmosféricas, de la pista y leyes físicas de fuerzas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Solo las leyes de la termodinámica aplicadas al motor.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El mantenimiento preventivo y la logística de combustible.', FALSE);

-- Pregunta 2
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Dónde se encuentran los datos de funcionamiento certificados de una aeronave?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'En el registro de mantenimiento del taller.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En el Manual de vuelo de la aeronave o Pilot Operating Handbook (AFM / POH).', TRUE),
((SELECT MAX(id) FROM pregunta), 'En las cartas de navegación actualizadas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En el plan de vuelo presentado ante la autoridad.', FALSE);

-- Pregunta 3
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la condición legal del uso de los datos de performance en las operaciones de vuelo?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Es opcional según el criterio del piloto al mando.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es una recomendación para vuelos internacionales.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es obligatorio para un funcionamiento seguro y eficiente.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Solo es exigible para vuelos de entrenamiento básico.', FALSE);

-- Pregunta 4
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Quién certifica los datos de rendimiento presentados en el manual de vuelo?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El fabricante de la hélice exclusivamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La agencia reguladora del estado que certifica el avión.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El jefe de instructores de la escuela de vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La asociación internacional de pilotos de prueba.', FALSE);

-- Pregunta 5
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Respecto a la estandarización de los datos en el AFM/POH, ¿cuál es la realidad técnica?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Todos los fabricantes usan exactamente el mismo formato de tablas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'No ha sido estandarizada; algunos usan tablas y otros gráficos.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Solo se permiten gráficos de densidad para evitar errores.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La información está estandarizada por normativa internacional desde 1990.', FALSE);

-- Pregunta 6
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué debe reconocer el usuario para que la información del AFM/POH tenga valor práctico?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El costo operativo por hora de vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Las variaciones en las condiciones y hacer los ajustes necesarios.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La marca y modelo de los instrumentos de aviónica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El peso vacío de la aeronave sin accesorios.', FALSE);

-- Pregunta 7
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué factor es determinante en las actuaciones al influir en sustentación, motor y resistencia?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La densidad del aire.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El color de la pintura del fuselaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El tipo de aceite lubricante utilizado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La marca de los neumáticos del tren de aterrizaje.', FALSE);

-- Pregunta 8
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuáles son los tres factores que afectan directamente la densidad del aire?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Presión, altitud de crucero y velocidad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Temperatura, humedad y presión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Visibilidad, viento y nubosidad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Peso, balance y configuración de flaps.', FALSE);

-- Pregunta 9
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo varía la densidad del aire en relación con la temperatura a presión constante?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'De forma directamente proporcional.', FALSE),
((SELECT MAX(id) FROM pregunta), 'No existe relación entre ambas variables.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Varía inversamente con la temperatura.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La densidad es constante independientemente de la temperatura.', FALSE);

-- Pregunta 10
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué efecto tiene una menor densidad del aire en el rendimiento del ascenso?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El ascenso se vuelve más rápido y eficiente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'No afecta el régimen de ascenso, solo la velocidad horizontal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Provoca que el ascenso sea más lento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Permite alcanzar mayores altitudes en menor tiempo.', FALSE);

-- Pregunta 11
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Por qué se reduce la eficiencia de la hélice en aire menos denso?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Debido al aumento de la fricción molecular.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Por una menor cantidad de moléculas de aire en un volumen dado.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Porque la hélice gira a menor velocidad angular.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Debido al enfriamiento excesivo de las palas.', FALSE);

-- Pregunta 12
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la definición técnica de Altitud de Densidad?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Es la altitud de presión corregida por temperatura.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Es la altitud indicada en el altímetro tras el despegue.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es la altura real sobre el nivel del terreno (AGL).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es la altitud de presión corregida por errores de instalación.', FALSE);

-- Pregunta 13
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según el texto, ¿cuántos factores principales afectan las actuaciones del avión?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '3 factores (Clima, Peso, Pista).', FALSE),
((SELECT MAX(id) FROM pregunta), '6 factores (Densidad, Viento, Peso, Pista, Turbulencia, Obstáculos).', TRUE),
((SELECT MAX(id) FROM pregunta), '2 factores (Potencia y Velocidad).', FALSE),
((SELECT MAX(id) FROM pregunta), '10 factores incluyendo la experiencia del piloto.', FALSE);

-- Pregunta 14
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué efecto tiene un aumento en la altitud de densidad sobre la carrera de despegue?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La reduce significativamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'No produce variaciones en la distancia de rodadura.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cuanto mayor es la altitud de densidad, mayor es la carrera de despegue.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Permite despegues con mayor carga útil.', FALSE);

-- Pregunta 15
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el procedimiento recomendado respecto al viento para el despegue?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Despegar siempre con viento de cola para ganar velocidad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Despegar siempre con viento de frente para reducir la carrera.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El viento es irrelevante si la pista es de concreto.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Esperar a que el viento sea nulo para mayor estabilidad.', FALSE);

-- Pregunta 16
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se define técnicamente la pendiente de la pista?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Es el ángulo de inclinación lateral de la superficie.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es la diferencia de elevación entre las dos cabeceras.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Es la rugosidad del terreno medida en micras.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es el ancho de la pista en relación con su longitud.', FALSE);

-- Pregunta 17
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué efecto tiene una pendiente positiva (cuesta arriba) en el despegue?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Favorece la aceleración inicial.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Alarga la carrera de despegue.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Reduce la distancia necesaria para alcanzar la velocidad de rotación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'No afecta el rendimiento si el motor es turboalimentado.', FALSE);

-- Pregunta 18
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué tipo de superficies de pista, además de la pendiente, pueden alargar el despegue?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Solo las pistas de asfalto nuevas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Césped, barro, encharcada o hielo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Pistas con iluminación de alta intensidad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Pistas ubicadas exclusivamente a nivel del mar.', FALSE);

-- Pregunta 19
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el origen de la turbulencia de estela?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El calentamiento desigual de la superficie de la pista.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Los vórtices creados en la punta del ala por diferencia de presión.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El flujo de aire a través de pasos de montaña.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Las ráfagas repentinas de viento cruzado.', FALSE);

-- Pregunta 20
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué momento se manifiesta la turbulencia de estela en un avión?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Únicamente cuando los motores están en ralentí.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cuando el ala produce sustentación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Solo durante el vuelo de crucero a alta velocidad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Exclusivamente cuando se despliegan los aerofrenos.', FALSE);

-- Pregunta 21
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué tipo de aviones producen vórtices más peligrosos según el texto?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aviones con motores de pistón de baja potencia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aviones con gran masa de despegue.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Planeadores y aviones experimentales livianos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aviones con configuración de ala alta únicamente.', FALSE);

-- Pregunta 22
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la norma para despegar después de que ha aterrizado un avión grande?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Hacerlo antes del punto donde el avión grande tocó tierra.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hacerlo luego del punto en que el avión grande bajó el tren delantero.', TRUE),
((SELECT MAX(id) FROM pregunta), 'No es necesario tomar precauciones si hay viento de costado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Despegar inmediatamente para evitar que los vórtices bajen.', FALSE);

-- Pregunta 23
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la norma para despegar después de que ha despegado un avión grande?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Despegar en el mismo punto exacto que el avión grande.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hacerlo antes del punto en que el avión grande levantó el tren delantero.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Esperar a que el avión grande esté a más de 10 millas de distancia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Solicitar un despegue de intercepción de pista.', FALSE);

-- Pregunta 24
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué se debe recordar sobre los grandes aviones y la producción de vórtices?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Los producen solo cuando el tren de aterrizaje está guardado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Los producen cuando levantan la rueda de nariz.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Solo producen vórtices si vuelan por debajo de 100 nudos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Dejan de producir vórtices en el momento de la rotación.', FALSE);

-- Pregunta 25
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Ante una situación de viento en calma tras la operación de un avión grande, ¿qué debe hacer el piloto?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Despegar lo más rápido posible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Conviene esperar unos minutos antes de iniciar el despegue.', TRUE),
((SELECT MAX(id) FROM pregunta), 'No es necesario esperar ya que el aire está estable.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Realizar un despegue con máxima potencia y flaps.', FALSE);

-- Pregunta 26
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué tipo de autorización de despegue no debe aceptarse cuando operan aviones de gran porte?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Autorizaciones de despegue inmediato desde la cabecera.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Autorizaciones de despegues de intercepción de pistas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Autorizaciones de ascenso visual directo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Autorizaciones de viraje temprano tras el despegue.', FALSE);

-- Pregunta 27
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo muestran el peso del avión los gráficos de actuaciones para aviación general?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Con el avión vacío de combustible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Con el avión en su peso máximo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Con un peso promedio de dos pasajeros.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Con el peso mínimo operativo certificado.', FALSE);

-- Pregunta 28
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué altura estándar se presupone para los obstáculos en la planificación del despegue?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '10 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), '100 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), '50 pies.', TRUE),
((SELECT MAX(id) FROM pregunta), '80 pies.', FALSE);

-- Pregunta 29
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué información NO se menciona como incluida habitualmente en las tablas de despegue?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Peso del avión y distancias de despegue.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Distancia para salvar un obstáculo de 50 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El costo por galón del combustible utilizado.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Viento y velocidades de despegue.', FALSE);

-- Pregunta 30
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿De qué factores resulta el rendimiento de ascenso de un avión?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Solo del ángulo de ataque de las alas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Uso de exceso de potencia o intercambio de energía cinética por potencial.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Exclusivamente de la temperatura exterior del aire.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Del peso del aceite y la presión hidráulica.', FALSE);

-- Pregunta 31
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué unidad se mide la velocidad de ascenso (ROC) de una aeronave?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Millas por hora (MPH).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Pies por minuto.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Metros por segundo cuadrado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Nudos de velocidad verdadera.', FALSE);

-- Pregunta 32
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué instrumento indica las velocidades de ROC (ascenso) y ROD (descenso)?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El anemómetro o velocímetro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El variómetro o climb.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El horizonte artificial.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El indicador de coordinación de giro.', FALSE);

-- Pregunta 33
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es la Velocidad de mejor régimen de ascenso (Vy)?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La que logra mayor altura en menor distancia horizontal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La que logra mayor altura en menor tiempo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La velocidad utilizada para el enfriamiento del motor.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La velocidad mínima de sustentación en crucero.', FALSE);

-- Pregunta 34
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuándo se utiliza generalmente la velocidad Vy?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Para despegar en pistas muy cortas con árboles al final.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cuando se desea alcanzar rápidamente un determinado nivel de vuelo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Durante la aproximación final para el aterrizaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Para realizar maniobras de vuelo lento.', FALSE);

-- Pregunta 35
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es la Velocidad de mejor ángulo de ascenso (Vx)?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La que logra mayor altura en menor tiempo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La que logra mayor altura en menor distancia horizontal.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La velocidad de crucero más económica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La velocidad máxima estructural del avión.', FALSE);

-- Pregunta 36
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el uso principal de la velocidad Vx?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Durante todo el ascenso hasta la altitud de crucero.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Inmediatamente después del despegue hasta salvar un obstáculo al final de pista.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Para reducir el consumo de combustible en vuelos largos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Solo cuando el avión vuela con peso mínimo.', FALSE);

-- Pregunta 37
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuándo debe utilizarse la velocidad de ascenso normal?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Antes de iniciar la carrera de despegue.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Después de abandonar el circuito de tránsito.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Únicamente en emergencias por fallo de motor.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Para salvar obstáculos de más de 50 pies.', FALSE);

-- Pregunta 38
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué información proporcionan las tablas de actuaciones en crucero?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Régimen de combustible, velocidad verdadera, autonomía y alcance.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Distancia de frenado y presión de neumáticos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ángulo máximo de alabeo y factor de carga.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Tiempo de calentamiento del motor en tierra.', FALSE);

-- Pregunta 39
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se define el "Alcance" (Range) de un avión?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Es el tiempo máximo que el avión puede estar en el aire.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es la distancia que un avión puede recorrer con el combustible a bordo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Es la altura máxima que puede alcanzar el avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es el radio del circuito de tránsito del aeropuerto.', FALSE);

-- Pregunta 40
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo es posible aumentar el alcance de una aeronave?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aumentando la potencia del motor al máximo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Disminuyendo la potencia del motor.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Volando a altitudes extremadamente bajas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aumentando el peso total de la aeronave.', FALSE);

-- Pregunta 41
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué unidades se mide habitualmente el alcance?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Horas y minutos de vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Km, Millas Náuticas o Millas Terrestres.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Galones por hora.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Pies por milla náutica.', FALSE);

-- Pregunta 42
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es la "Autonomía" (Endurance) de un avión?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La distancia total recorrida desde el despegue.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El mayor tiempo que un avión puede estar en el aire con el combustible a bordo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La capacidad de resistencia de la estructura a la turbulencia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El tiempo de vida útil de los componentes del motor.', FALSE);

-- Pregunta 43
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué porcentaje de potencia se considera un buen compromiso entre alcance y tiempo para crucero?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '100 % (máxima potencia continua).', FALSE),
((SELECT MAX(id) FROM pregunta), '65 %.', TRUE),
((SELECT MAX(id) FROM pregunta), '25 % (potencia de ralentí).', FALSE),
((SELECT MAX(id) FROM pregunta), '90 % para evitar la formación de hielo.', FALSE);

-- Pregunta 44
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el límite normal de potencia para el crucero máximo según las notas del manual?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '50 % de la potencia.', FALSE),
((SELECT MAX(id) FROM pregunta), '75 % de la potencia.', TRUE),
((SELECT MAX(id) FROM pregunta), '100 % de la potencia.', FALSE),
((SELECT MAX(id) FROM pregunta), '85 % de la potencia.', FALSE);

-- Pregunta 45
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Por qué normalmente no se proporciona información detallada sobre el descenso?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Porque el descenso es la fase más peligrosa del vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porque se efectúa con motor reducido y el consumo es mínimo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Porque la velocidad de descenso es constante para todos los aviones.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Debido a que el variómetro no funciona correctamente en descenso.', FALSE);

-- Pregunta 46
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué precaución con la mezcla debe tenerse antes de comenzar el descenso?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Empobrecerla al máximo para ahorrar combustible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Enriquecer la mezcla.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Mantenerla en la posición de crucero económico.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cortarla totalmente si la pendiente es pronunciada.', FALSE);

-- Pregunta 47
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es el "Ground Roll" (rodada en tierra) en las tablas de aterrizaje?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La distancia total desde que se sobrevuela un obstáculo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La distancia desde que el avión toca el piso hasta que se detiene.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El tiempo que tarda el avión en desalojar la pista.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La distancia recorrida durante el carreteo a la terminal.', FALSE);

-- Pregunta 48
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En aterrizaje, ¿qué distancia es siempre la mayor según el manual?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La rodada en tierra (Ground Roll).', FALSE),
((SELECT MAX(id) FROM pregunta), 'La distancia para salvar un obstáculo de 50 pies.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La distancia de despegue con flaps.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La distancia de rodaje desde la plataforma.', FALSE);

-- Pregunta 49
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la fórmula de regla general para calcular el máximo componente de viento cruzado?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Viento Cruzado = 0.5 x Velocidad de crucero.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Viento Cruzado = 0.2 x VSo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Viento Cruzado = Viento de frente + 10 nudos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Viento Cruzado = Peso total / 100.', FALSE);

-- Pregunta 50
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué variables son fundamentales para el cálculo del viento cruzado?', '4');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La temperatura del aire y la humedad relativa.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El ángulo entre el viento y el eje de pista, e intensidad del viento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La longitud de la pista y el tipo de superficie.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El ajuste altimétrico y la altitud de presión.', FALSE);

-- ============================================
-- FIN DE LOS INSERTS DEL CAPÍTULO 4
-- ============================================

