-- ============================================
-- INSERCIÓN DE PREGUNTAS Y OPCIONES
-- Capítulo: 13 - Gestión de Tránsito Aéreo y Comunicaciones Aeronáuticas
-- ============================================

-- Pregunta 1
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según el Documento 4444, ¿cuál es el origen de los procedimientos para los servicios de gestión del tránsito aéreo (ATM)?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'De las normativas internacionales de la aviación civil comercial.', FALSE),
((SELECT MAX(id) FROM pregunta), 'De la evolución progresiva de los procedimientos para los servicios de navegación aérea.', TRUE),
((SELECT MAX(id) FROM pregunta), 'De los manuales de entrenamiento de los instructores de vuelo locales.', FALSE),
((SELECT MAX(id) FROM pregunta), 'De las directrices impuestas por las dependencias de control de aproximación.', FALSE);

-- Pregunta 2
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En el contexto de los servicios de navegación aérea, ¿cómo se define el término "dependencia"?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Como una función o servicio prestado de manera abstracta.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Como un organismo o entidad que preste un servicio.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Como el conjunto de procedimientos efectivos aplicados al tránsito.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Como el área geográfica bajo la responsabilidad de un controlador.', FALSE);

-- Pregunta 3
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué entidad es la responsable primaria de suministrar el servicio de control de área?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Una torre de control de aeródromo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una dependencia de control de aproximación en zona de control.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un centro de control de área (ACC).', TRUE),
((SELECT MAX(id) FROM pregunta), 'La autoridad ATS competente mediante información meteorológica.', FALSE);

-- Pregunta 4
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuándo puede una dependencia de control de aproximación suministrar servicio de control de área?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Únicamente cuando la aeronave se encuentre en fase de aterrizaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cuando no se haya establecido un Centro de Control de Área (ACC) en una zona de control o extensión limitada.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Cuando el piloto lo solicite expresamente por motivos de seguridad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Siempre que la aeronave pertenezca a la categoría de estela turbulenta pesada.', FALSE);

-- Pregunta 5
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El servicio de control de aproximación puede ser suministrado por una torre de control de aeródromo cuando:', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Es necesario combinar las funciones de control de aproximación y de aeródromo bajo una sola dependencia.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El ACC se encuentra fuera de servicio por razones técnicas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La aeronave se encuentra a más de 50 metros del borde de la pista.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El tráfico aéreo es exclusivamente de aviación general con radios VHF.', FALSE);

-- Pregunta 6
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el objetivo principal de que las torres de control de aeródromo expidan permisos e información?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Garantizar que todas las aeronaves utilicen radios VHF de última generación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mantener la separación de estela turbulenta en todas las fases del vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Conseguir un movimiento de tránsito aéreo seguro, ordenado y rápido.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Sustituir las funciones del Centro de Control de Área (ACC) en emergencias.', FALSE);

-- Pregunta 7
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Las torres de control de aeródromo deben prevenir colisiones entre aeronaves que vuelan en su área de responsabilidad, incluyendo:', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Los tramos de ruta en áreas de control de extensión limitada.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Los circuitos de tránsito de aeródromo alrededor del mismo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Las aeronaves que operan exclusivamente bajo reglas de vuelo por instrumentos en el ACC.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Vehículos que operan fuera del área de maniobras.', FALSE);

-- Pregunta 8
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En el área de maniobras, la torre debe prevenir colisiones entre aeronaves y:', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Vehículos u obstáculos presentes en dicha área.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Personal de mantenimiento en la plataforma de estacionamiento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aeronaves que se encuentran en la posición 6 del circuito.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Estaciones meteorológicas situadas fuera del perímetro del aeródromo.', FALSE);

-- Pregunta 9
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué indica la expresión "pista en uso"?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La pista donde el viento está exactamente a 90 grados.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La pista o pistas que la torre considera más adecuadas en un momento dado para las aeronaves que despegan o aterrizan.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La calle de rodaje que conecta la plataforma con el punto de espera.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La pista que tiene una longitud superior a los 900 metros de forma obligatoria.', FALSE);

-- Pregunta 10
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la norma general respecto a la dirección del viento para aterrizajes y despegues?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La aeronave debe aterrizar y despegar con viento de cola para ganar velocidad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La aeronave operará normalmente contra el viento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La torre siempre seleccionará la pista con viento cruzado por seguridad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La dirección del viento es irrelevante si la pista mide más de 900 metros.', FALSE);

-- Pregunta 11
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué elemento debe incluir obligatoriamente una aeronave de categoría pesada en su llamada inicial?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El reglaje QFE de altímetro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La palabra "pesada" después de su distintivo de llamada.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El número de personas a bordo y la escasez de combustible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La temperatura del aire ambiente en la pista.', FALSE);

-- Pregunta 12
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el primer dato que se debe notificar a una aeronave antes de iniciar el rodaje para el despegue?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El reglaje QNH de altímetro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La pista que ha de utilizarse.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La dirección y velocidad del viento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La hora exacta del sistema.', FALSE);

-- Pregunta 13
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué caso se debe notificar la temperatura del aire ambiente antes del rodaje?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Para todas las aeronaves de la aviación general.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En el caso de aeronaves con motor de turbina.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Cuando la pista en uso sea inferior a 900 metros.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Únicamente si el piloto reporta una falla de motor.', FALSE);

-- Pregunta 14
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El reglaje altimétrico QFE se proporciona a la aeronave:', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Siempre como primer dato antes de iniciar el rodaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Regularmente por acuerdos locales o si la aeronave lo solicita.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Solo cuando la aeronave se encuentra en la posición 4 del circuito.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Para sustituir al QNH en caso de emergencia por estela turbulenta.', FALSE);

-- Pregunta 15
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué posición del circuito de tránsito la aeronave pide normalmente autorización para iniciar el rodaje previo al despegue?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Posición 2.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Posición 1.', TRUE),
((SELECT MAX(id) FROM pregunta), 'En la plataforma, antes de encender motores.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Directamente en el punto de espera de la pista.', FALSE);

-- Pregunta 16
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué actividad se realiza normalmente en la Posición 2 del circuito de rodaje?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La petición de aterrizaje en final.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Los chequeos previos al despegue y calentamiento de motores.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El estacionamiento definitivo de la aeronave.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El reporte de la posición de estela turbulenta pesada.', FALSE);

-- Pregunta 17
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según el reglamento, ¿cuándo debe una aeronave ingresar a la pista?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Inmediatamente después de recibir la información meteorológica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Solo cuando esté listo para el despegue.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Al llegar a la posición 1 para evitar demoras.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cuando la aeronave precedente esté a 30 metros del borde.', FALSE);

-- Pregunta 18
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué autorización se recibe normalmente en la Posición 3?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Autorización de rodaje a la plataforma.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Autorización de despegue (si no se dio en la posición 2).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Autorización de aterrizaje en el tramo básico.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Información para el estacionamiento en plataforma.', FALSE);

-- Pregunta 19
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('La Posición 4 en los circuitos de tránsito se sitúa normalmente en:', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El tramo a favor del viento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El tramo final.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La calle de rodaje principal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El punto de espera de la pista.', FALSE);

-- Pregunta 20
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué autorización se otorga en la Posición 5?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Autorización para iniciar el rodaje previo al despegue.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Autorización de rodar hasta la plataforma o área de estacionamiento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Autorización para realizar chequeos de motor.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El reglaje altimétrico QNH actualizado.', FALSE);

-- Pregunta 21
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué información se proporciona en la Posición 6 si es necesario?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La hora exacta para el cierre de plan de vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Información para el estacionamiento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La velocidad del viento en la superficie de la pista.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La autorización de aterrizaje de emergencia.', FALSE);

-- Pregunta 22
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Para una pista que mide 1200 metros, ¿cuál es la distancia mínima de espera desde el borde de la pista?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '30 metros.', FALSE),
((SELECT MAX(id) FROM pregunta), '50 metros.', FALSE),
((SELECT MAX(id) FROM pregunta), '100 metros.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La que determine el instructor de vuelo en ese momento.', FALSE);

-- Pregunta 23
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Si una pista mide 800 metros, ¿a qué distancia mínima del borde deben mantenerse las aeronaves en el punto de espera?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '50 metros.', FALSE),
((SELECT MAX(id) FROM pregunta), '30 metros.', TRUE),
((SELECT MAX(id) FROM pregunta), '15 metros.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Justo en el límite del área de maniobras.', FALSE);

-- Pregunta 24
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo debe actuar un controlador si una aeronave entra al circuito sin autorización?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Debe prohibirle el aterrizaje bajo cualquier circunstancia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se le permitirá aterrizar si sus maniobras indican que así lo desea.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se debe suspender indefinidamente cualquier otra operación en el aeródromo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Debe ignorar a la aeronave hasta que sintonice la frecuencia VHF correcta.', TRUE);

-- Pregunta 25
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué puede hacer un controlador para evitar riesgos por una operación no autorizada?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Instruir a las aeronaves con contacto a que se aparten tan pronto sea posible.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Apagar las luces de pista inmediatamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Obligar a la aeronave no autorizada a realizar un despegue inmediato.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cambiar la pista en uso a una de menos de 900 metros.', FALSE);

-- Pregunta 26
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la política respecto a suspender una autorización de aterrizaje?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Puede suspenderse si la aeronave no tiene radio VHF.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En ningún caso deberá suspenderse indefinidamente.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Se suspende siempre que haya una aeronave en posición 2.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Solo se suspende si la aeronave es de categoría pesada.', FALSE);

-- Pregunta 27
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Ante una emergencia, ¿qué responsabilidad tienen los controladores?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Deben exigir la autorización previa antes de permitir el aterrizaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Deben reconocer los casos de emergencia y prestar toda la ayuda posible.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Deben priorizar el tránsito ordenado sobre la seguridad de la aeronave.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Solo deben intervenir si la aeronave está en el área de maniobras.', FALSE);

-- Pregunta 28
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿A qué aeronave se le concede prioridad absoluta para el aterrizaje?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'A las aeronaves que realizan vuelos de instrucción.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A toda aeronave que prevea verse obligada a aterrizar por causas que afecten su seguridad (falla motor, falta combustible).', TRUE),
((SELECT MAX(id) FROM pregunta), 'A las aeronaves que se encuentran en la posición 1 pidiendo rodaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A las aeronaves que tienen el viento de cara exactamente.', FALSE);

-- Pregunta 29
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué otra categoría de aeronaves tiene prioridad en el aterrizaje después de las de emergencia por seguridad?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aeronaves de la aviación general con radio VHF.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aeronaves ambulancias o que lleven enfermos graves.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Aeronaves que operan en pistas de más de 900 metros.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aeronaves que se encuentran en el tramo a favor del viento.', FALSE);

-- Pregunta 30
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Las aeronaves que realizan operaciones de búsqueda y salvamento (SAR):', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'No tienen prioridad sobre el tránsito civil normal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Tienen prioridad concedida para el aterrizaje.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Solo tienen prioridad si operan en frecuencias superiores a 136,975 MHz.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Tienen prioridad únicamente en la posición 5 del circuito.', FALSE);

-- Pregunta 31
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En la aviación general, ¿cuál es el tipo de radio más común?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'HF (Alta frecuencia).', FALSE),
((SELECT MAX(id) FROM pregunta), 'VHF (Muy alta frecuencia).', TRUE),
((SELECT MAX(id) FROM pregunta), 'UHF (Ultra alta frecuencia).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Satelital de banda ancha.', FALSE);

-- Pregunta 32
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el rango de frecuencias en el que opera una radio VHF aeronáutica?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Entre 108,0 y 118,0 MHz.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Entre 118,0 y 136,975 MHz.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Entre 88,0 y 108,0 MHz.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Por encima de los 200,0 MHz únicamente.', FALSE);

-- Pregunta 33
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el objetivo de observar cuidadosamente a las aeronaves al aproximarse a las posiciones de los circuitos?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Para poder darles las autorizaciones correspondientes sin demora.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Para verificar si llevan instalada una radio Garmin.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Para asegurar que el viento no cambie durante el aterrizaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Para reportar el distintivo de llamada a la autoridad ATS.', FALSE);

-- Pregunta 34
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la recomendación general para expedir autorizaciones a las aeronaves?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Esperar siempre a que el piloto las pida formalmente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Expedirlas sin aguardar a que la aeronave las pida, siempre que sea posible.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Solo darlas si la aeronave está en la posición 4 (final).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Diferirlas hasta que la aeronave reporte "pesada" o "ligera".', FALSE);

-- Pregunta 35
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Si una aeronave está en el "Tramo a favor del viento", ¿qué posición ha superado recientemente según el diagrama?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El tramo final.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La posición 1 de rodaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El tramo básico (en sentido contrario).', FALSE),
((SELECT MAX(id) FROM pregunta), 'El despegue desde la pista en uso.', TRUE);

-- Pregunta 36
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Quién tiene la facultad de determinar prioridades adicionales para el aterrizaje más allá de las especificadas?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El instructor de vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La autoridad competente.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El piloto al mando de una aeronave pesada.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El personal técnico de mantenimiento de radios VHF.', FALSE);

-- Pregunta 37
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El término "servicio" se emplea en sentido abstracto para designar:', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Un organismo gubernamental.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Funciones o servicio prestado.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Una frecuencia de radio específica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El área de control de aeródromo.', FALSE);

-- Pregunta 38
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Si no hay un ACC establecido, ¿quién asume el control de área en una zona de extensión limitada?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La torre de control de aeródromo exclusivamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La dependencia que suministre servicio de control de aproximación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La estación de radio VHF más cercana.', FALSE),
((SELECT MAX(id) FROM pregunta), 'No se suministra el servicio hasta que se cree un ACC.', FALSE);

-- Pregunta 39
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la función de la Posición 1 en el diagrama de rodaje?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Calentamiento de motores.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Petición de autorización de rodaje.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Abandono de la pista tras el aterrizaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Reporte de posición en tramo básico.', FALSE);

-- Pregunta 40
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué momento se debe dar la autorización de aterrizar, de ser factible?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cuando la aeronave pide rodaje en posición 1.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cuando la aeronave está en final (Posición 4).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Al entrar en el tramo a favor del viento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Solo después de que la aeronave haya pasado el punto de espera.', FALSE);

-- Pregunta 41
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué reglaje altimétrico se notifica antes del rodaje por defecto?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'QFE.', FALSE),
((SELECT MAX(id) FROM pregunta), 'QNH.', TRUE),
((SELECT MAX(id) FROM pregunta), 'QNE.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El reglaje de temperatura ambiente.', FALSE);

-- Pregunta 42
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Los circuitos de tránsito de aeródromo se sitúan:', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Dentro del área de maniobras exclusivamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Alrededor del aeródromo, dentro del área de responsabilidad de la torre.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Fuera del alcance de las radios VHF.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Bajo la supervisión directa del ACC en todo momento.', FALSE);

-- Pregunta 43
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál de estos NO es un dato obligatorio antes del rodaje (salvo si ya se recibió)?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La pista que ha de utilizarse.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La velocidad del viento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El número de serie de la radio VHF.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La hora exacta.', FALSE);

-- Pregunta 44
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('La palabra "pesada" se asocia a qué categoría técnica:', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Al peso máximo al despegue del fabricante.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A la estela turbulenta.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Al tipo de motor de turbina.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A la prioridad de aterrizaje de emergencia.', FALSE);

-- Pregunta 45
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Una aeronave "en espera" frente a la pista debe estar:', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'A 30 metros si la pista es de 900 metros exactos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A 50 metros si la pista es de 900 metros o más.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Dentro del área de maniobras sin restricciones.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Siempre en la posición 5 del circuito.', FALSE);

-- Pregunta 46
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El servicio de control de aeródromo es suministrado específicamente por:', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Un Centro de Control de Área (ACC).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una torre de control de aeródromo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Una aeronave líder en operaciones SAR.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La dependencia de control de aproximación separada.', FALSE);

-- Pregunta 47
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué sucede con la autorización de aterrizaje de una aeronave que entró sin permiso?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Se cancela permanentemente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se debe conceder sin suspenderla indefinidamente.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Solo se otorga si hay viento de frente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se transfiere automáticamente al ACC.', FALSE);

-- Pregunta 48
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El orden de prioridad para aterrizaje incluye en tercer lugar a:', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aeronaves con falla de motor.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aeronaves ambulancia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aeronaves que realizan operaciones de búsqueda y salvamento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Aeronaves comerciales de pasajeros.', FALSE);

-- Pregunta 49
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el último elemento mencionado en la lista de información de aeródromo antes del rodaje?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La pista en uso.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La hora exacta.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El reglaje QNH.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La temperatura ambiente.', TRUE);

-- Pregunta 50
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Quién es el autor y poseedor de los derechos de este documento de instrucción?', '13');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Green Aviation.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Martin Da Costa Porto.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La Autoridad ATS Competente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Garmin Aviation Systems.', FALSE);

-- ============================================
-- FIN DE LOS INSERTS DEL CAPÍTULO 13
-- ============================================

