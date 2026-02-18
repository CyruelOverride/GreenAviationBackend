-- ============================================
-- INSERCIÓN DE PREGUNTAS Y OPCIONES
-- Capítulo: 12 - Operaciones en Aeródromos
-- ============================================

-- Pregunta 1
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la función primordial del Control de Tráfico Aéreo (ATC) en un aeródromo controlado?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Realizar el mantenimiento preventivo de las superficies pavimentadas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Proporcionar un flujo de tránsito aéreo seguro, ordenado y rápido.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Gestionar exclusivamente el estacionamiento de aeronaves comerciales.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Supervisar las comunicaciones en frecuencias no aeronáuticas.', FALSE);

-- Pregunta 2
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En un aeródromo no controlado, ¿cuál es la práctica operativa recomendada respecto a las comunicaciones por radio?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Es obligatorio mantener contacto con una torre de control adyacente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'No se requiere ningún tipo de comunicación bajo ninguna circunstancia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Transmitir las intenciones en la frecuencia especificada para beneficio del tráfico.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Utilizar señales visuales únicamente, evitando el uso de la radio.', FALSE);

-- Pregunta 3
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se identifican visualmente las calles de rodaje en un aeródromo?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Mediante una línea central blanca discontinua.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Por una línea central amarilla continua.', TRUE),
((SELECT MAX(id) FROM pregunta), 'A través de marcas rojas en los bordes de la superficie.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Únicamente mediante carteles de ubicación sin marcas pintadas.', FALSE);

-- Pregunta 4
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué característica define a los carteles de instrucción obligatoria?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Fondo amarillo con inscripción en negro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Fondo negro con inscripción amarilla y borde amarillo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Fondo de color rojo con inscripción en blanco.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Fondo blanco con números negros indicando distancia.', FALSE);

-- Pregunta 5
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la función de los carteles de ubicación?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Identificar una calle de rodaje o la ubicación de la pista.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Indicar la dirección de las pistas que se cruzan.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Proveer información sobre zonas de carga y aviación civil.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mostrar la distancia restante de pista en miles de pies.', FALSE);

-- Pregunta 6
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué colores identifican a los carteles de dirección?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Fondo rojo con letras blancas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Fondo amarillo con inscripción en negro.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Fondo negro con borde amarillo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Fondo blanco con flechas rojas.', FALSE);

-- Pregunta 7
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué indican los números en un cartel de distancia restante de pista?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Los metros faltantes para el final del pavimento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La longitud de la pista en hectómetros.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La distancia restante de pista en miles de pies.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El tiempo estimado de rodaje hasta la cabecera.', FALSE);

-- Pregunta 8
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el propósito del faro de aeropuerto?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Ayudar al piloto a identificar un aeropuerto durante la noche.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Guiar a las aeronaves directamente hacia el umbral de pista.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Indicar que el aeródromo está cerrado por condiciones climáticas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Marcar el centro geográfico del área de aterrizaje.', FALSE);

-- Pregunta 9
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué sistema de luces proporciona una transición entre el vuelo por instrumentos y el visual para el aterrizaje?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El faro de aeródromo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Las luces de borde de calle de rodaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Los sistemas de luces de aproximación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Las luces de obstrucción rojas.', FALSE);

-- Pregunta 10
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué se diferencia el sistema PAPI del sistema VASI según la fuente?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El PAPI utiliza luces azules en lugar de blancas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Las luces del PAPI se instalan en una sola línea, normalmente al lado izquierdo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El PAPI es exclusivo para aeródromos no controlados.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El sistema PAPI solo opera durante condiciones de baja visibilidad diurna.', FALSE);

-- Pregunta 11
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿De qué color son las luces identificadoras de fin de pista (REIL) cuando el piloto está en fase de aproximación?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Rojas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ámbar.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Verdes.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Blancas.', TRUE);

-- Pregunta 12
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué color emiten las luces REIL para indicar el fin de pista durante el despegue?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Verde intermitente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Rojo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Azul omnidireccional.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Blanco fijo de alta intensidad.', FALSE);

-- Pregunta 13
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se señalizan los últimos 2.000 pies de una pista de instrumentos?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Con luces de borde de color ámbar.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Con luces de borde de color rojo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mediante una línea amarilla discontinua en el eje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Con luces estroboscópicas blancas de alta intensidad.', TRUE);

-- Pregunta 14
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la función de las luces de zona de toma de contacto (TDZL)?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Indicar el final físico del pavimento de la pista.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Delinear los bordes de la calle de rodaje en curvas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Indicar la zona de toma de contacto en condiciones de visibilidad adversas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Advertir sobre la presencia de obstáculos en la senda de planeo.', FALSE);

-- Pregunta 15
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿De qué color son las luces de calle de rodaje?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Blancas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Rojas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Azules.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Verdes.', FALSE);

-- Pregunta 16
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué color se utiliza para las luces de obstrucción?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Blanco.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Rojo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Amarillo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Verde.', FALSE);

-- Pregunta 17
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál de los siguientes no es un indicador de dirección del viento mencionado?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cono de viento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Tetraedro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Anemómetro digital de superficie.', TRUE),
((SELECT MAX(id) FROM pregunta), '"T" de viento.', FALSE);

-- Pregunta 18
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Dónde se ubica generalmente el indicador de dirección del viento?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'En el techo de la torre de control únicamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En una zona céntrica, cerca de la pista.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Al final de la calle de rodaje principal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En el área de estacionamiento de vehículos terrestres.', FALSE);

-- Pregunta 19
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Al recibir instrucciones de rodaje (taxi), ¿qué acción es fundamental para instrucciones complejas?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Memorizarlas sin necesidad de registro físico.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Anotarlas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Ignorarlas si el piloto conoce el aeródromo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Solicitar que se repitan cada 30 segundos.', FALSE);

-- Pregunta 20
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué debe hacer un piloto si tiene una matrícula similar a otra aeronave en frecuencia?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cambiar su matrícula inmediatamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Dejar de usar la radio para evitar interferencias.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ser especialmente vigilante con las autorizaciones emitidas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Solicitar una frecuencia de radio privada al ATC.', FALSE);

-- Pregunta 21
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué fase de la operación es mandatorio colacionar (repetir) los permisos y autorizaciones?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Únicamente en vuelos recreativos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En operaciones IFR.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Solo si el controlador lo solicita por segunda vez.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Únicamente cuando hay más de cinco aviones en el área.', FALSE);

-- Pregunta 22
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según las buenas prácticas de rodaje, ¿dónde deben realizarse todos los chequeos?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'En la plataforma de estacionamiento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'En posición 1.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En posición 2.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mientras el avión está en movimiento hacia la pista.', FALSE);

-- Pregunta 23
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué acción está prohibida mientras el avión está rodando?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Mantener comunicación con el ATC.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Observar el tráfico circundante.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ajustar el altímetro o introducir datos en el GPS.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Mantener la línea central de la calle de rodaje.', FALSE);

-- Pregunta 24
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Si un piloto no está seguro de su posición en el aeródromo, ¿qué debe hacer?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Continuar rodando hasta encontrar un cartel conocido.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Detener la aeronave y solicitar rodaje progresivo al ATC.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Apagar los motores y esperar asistencia terrestre.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Intentar orientarse usando el GPS mientras se desplaza.', FALSE);

-- Pregunta 25
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué elemento NO debe faltar en la transmisión inicial al ATC?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El peso actual de la aeronave.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A quién está llamando e identificación de la aeronave.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La biografía breve del piloto al mando.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El número de serie de los motores.', FALSE);

-- Pregunta 26
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo deben ser expresadas las intenciones del piloto en la comunicación inicial?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Con el mayor detalle posible, sin importar la duración.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Brevemente.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Únicamente mediante códigos numéricos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En un idioma distinto al estándar para mayor seguridad.', FALSE);

-- Pregunta 27
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué debe hacerse antes de iniciar una transmisión por radio?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Solicitar permiso a otras aeronaves en frecuencia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Tener la transmisión bien pensada.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Realizar una prueba de sonido de tres minutos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Sintonizar la frecuencia de emergencia obligatoriamente.', FALSE);

-- Pregunta 28
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo debe ser la comunicación con el ATC según la técnica de radiocomunicación?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Concisa.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Extensa y redundante para evitar errores.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Informal para crear confianza con el controlador.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Únicamente a través de mensajes de texto si están disponibles.', FALSE);

-- Pregunta 29
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué se debe hacer para situaciones inusuales o comunicaciones largas?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Transmitir todo el mensaje de una sola vez.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Establecer un contacto inicial primero.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Cambiar a una frecuencia de aeródromo no controlado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Esperar a aterrizar para informar la situación.', FALSE);

-- Pregunta 30
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo debe darse el acuse de recibo de una instrucción?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Diciendo "entendido" sin más información.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Con su matrícula o el final de la misma.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Mediante dos pulsaciones largas del micrófono.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Apagando y encendiendo las luces de posición.', FALSE);

-- Pregunta 31
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Un cartel con fondo rojo e inscripción "4-22" indica:', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La distancia restante de pista en miles de pies.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una posición de espera en intersección de pista.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Que la aeronave está en la calle de rodaje 4.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La dirección hacia la pista 22.', FALSE);

-- Pregunta 32
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El cartel informativo con la inscripción "ILS" sobre fondo rojo obliga al piloto a:', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Sintonizar la frecuencia del localizador.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mantener espera de área crítica de ILS.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Ignorar las señales de luces de pista.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Acelerar el rodaje para despejar la zona.', FALSE);

-- Pregunta 33
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Un cartel con fondo negro, inscripción amarilla "B" y borde amarillo identifica:', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La calle de rodaje donde se encuentra la aeronave.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La dirección hacia la terminal B.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una zona de no entrar.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El destino de partida.', FALSE);

-- Pregunta 34
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué indica un cartel con fondo amarillo e inscripción negra "J" acompañada de una flecha?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La ubicación actual de la aeronave en la calle J.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El límite de salida de áreas protegidas de pista.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La dirección y designación de la calle de rodaje que intersecta.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Que la calle de rodaje termina próximamente.', FALSE);

-- Pregunta 35
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Un cartel con fondo negro y el número "22" en amarillo identifica:', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La distancia restante de pista.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La pista donde se encuentra la aeronave.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El número de aeronaves en secuencia de despegue.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La frecuencia de la torre de control.', FALSE);

-- Pregunta 36
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué significa un cartel con franjas diagonales amarillas y negras?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Área de toma de contacto.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Marca de fin de calle de rodaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Posición de espera de aproximación de pista.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Zona de carga peligrosa.', FALSE);

-- Pregunta 37
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Los carteles que contienen flechas y proveen información sobre terminales o zonas de carga se clasifican como:', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Carteles de instrucción obligatoria.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Carteles de ubicación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Carteles de dirección.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Carteles de distancia restante.', FALSE);

-- Pregunta 38
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué identifica el símbolo de un círculo con una barra horizontal (similar a contramano) en un cartel de fondo rojo?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Área de estacionamiento permitida.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Identifica áreas pavimentadas donde se prohíbe el ingreso de aeronaves.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Punto de notificación obligatoria.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ubicación de la torre de control.', FALSE);

-- Pregunta 39
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En el sistema PAPI, ¿qué indican cuatro luces rojas?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Que la aeronave está en la senda exacta.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que la aeronave está ligeramente alta.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que la aeronave está bajo, más de 3°.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Que la pista está cerrada por emergencia.', FALSE);

-- Pregunta 40
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En el sistema PAPI, ¿qué indica la combinación de dos luces blancas y dos luces rojas?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '"En la senda" (3°).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Ligeramente alto (3.2°).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Alto, más de 3°.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Bajo, más de 3.2°.', FALSE);

-- Pregunta 41
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el color de las luces que marcan los bordes de la pista durante la noche?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Azul.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Verde.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Blanco.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Ámbar en toda su extensión.', FALSE);

-- Pregunta 42
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Las luces identificadoras de fin de pista (REIL) consisten en:', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Una línea de luces verdes fijas en el umbral.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un par de luces intermitentes sincronizadas a cada lado del umbral.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Luces azules omnidireccionales en el eje de pista.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Focos rojos rotatorios situados en la torre.', FALSE);

-- Pregunta 43
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué debe hacer el piloto si anticipa un retraso en el rodaje?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Apagar la radio para ahorrar batería.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Avisar al ATC.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Regresar a la terminal sin previo aviso.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Realizar los chequeos de motor más rápido.', FALSE);

-- Pregunta 44
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El término "colacionar" se refiere a:', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Solicitar una nueva ruta de vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Repetir los permisos y autorizaciones.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Hablar con otros pilotos en la frecuencia de la compañía.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Confirmar el número de pasajeros a bordo.', FALSE);

-- Pregunta 45
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el objetivo de las luces de borde de calle de rodaje omnidireccionales?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Indicar la distancia restante para la pista.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Delinear los bordes de la calle de rodaje.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Sustituir a los carteles de dirección en aeropuertos grandes.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Señalizar áreas de mantenimiento de aeronaves.', FALSE);

-- Pregunta 46
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según la fuente, un aeropuerto controlado es aquel que:', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Tiene más de dos pistas operativas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Posee una torre de control operativa.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Solo permite el aterrizaje de aviones comerciales.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se encuentra dentro de una zona militar restringida.', FALSE);

-- Pregunta 47
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En un aeropuerto controlado, los pilotos están obligados a:', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Mantener comunicación por radio y cumplir instrucciones del ATC.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Decidir su propia secuencia de despegue por seguridad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Operar únicamente bajo reglas de vuelo visual (VFR).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Reportar su posición cada 10 metros de rodaje.', FALSE);

-- Pregunta 48
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué significa la inscripción "MIL" con una flecha hacia arriba en un cartel amarillo?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Altitud mínima de cruce.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Destino de arribo para aeronaves militares.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Distancia a la terminal en millas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Marca de fin de pista militar.', FALSE);

-- Pregunta 49
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la acción correspondiente ante un cartel "8-APCH" de fondo rojo?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Iniciar la aproximación final inmediatamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mantener espera del avión en aproximación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Sintonizar la frecuencia de aproximación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Abandonar la pista por la salida más cercana.', FALSE);

-- Pregunta 50
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué se debe evitar hacer mientras se comunica con el ATC?', '12');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Escuchar atentamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Realizar otras tareas no esenciales.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Utilizar la matrícula de la aeronave.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mantener la brevedad en el mensaje.', FALSE);

-- ============================================
-- FIN DE LOS INSERTS DEL CAPÍTULO 12
-- ============================================

