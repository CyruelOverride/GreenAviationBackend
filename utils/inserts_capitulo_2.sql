-- ============================================
-- INSERCIÓN DE PREGUNTAS Y OPCIONES
-- Capítulo: 2 - Sistemas de Control de Vuelo
-- ============================================

-- Pregunta 1
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el propósito fundamental de los mandos primarios de control de vuelo?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Mantener la velocidad de crucero mediante el ajuste de la potencia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Provocar desplazamientos controlados sobre los ejes de giro del avión.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Reducir la resistencia aerodinámica en maniobras de aterrizaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Compensar automáticamente las variaciones de presión atmosférica.', FALSE);

-- Pregunta 2
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué componentes mecánicos se mencionan como parte de los diseños originales que aún se utilizan hoy en día?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Sistemas hidráulicos, actuadores eléctricos y microprocesadores.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Barras, cables, poleas y cadenas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Sensores de presión, servomotores y unidades de control lógico.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Estabilizadores automáticos y sistemas de transferencia de combustible.', FALSE);

-- Pregunta 3
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál de los siguientes es un mando primario de vuelo?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Los compensadores.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Los flaps.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El timón de profundidad.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Los spoilers.', FALSE);

-- Pregunta 4
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Dónde se sitúan los alerones y qué función principal cumplen?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'En el borde de ataque; aumentan la sustentación a bajas velocidades.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En los extremos de las alas junto al borde de salida; provocan descompensación aerodinámica entre las alas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'En el estabilizador horizontal; controlan el movimiento de picada.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En el empenaje vertical; controlan el movimiento de guiñada.', FALSE);

-- Pregunta 5
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué fenómeno ocurre cuando el alerón que desciende produce más sustentación pero también más resistencia?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Alabeo diferencial.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Estabilidad longitudinal excesiva.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Guiñada adversa.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Cabeceo por compensación.', FALSE);

-- Pregunta 6
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Desde la perspectiva del piloto, ¿hacia dónde se produce la guiñada adversa?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'En la misma dirección del banqueo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hacia la nariz del avión de forma vertical.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En dirección opuesta al banqueo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Únicamente hacia el ala que sube.', FALSE);

-- Pregunta 7
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la función técnica de los alerones diferenciales?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Permitir que ambos alerones suban simultáneamente para actuar como frenos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hacer que un alerón se eleve una distancia mayor de lo que el otro baja.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Eliminar por completo el arrastre parásito en el ala ascendente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Conectar mecánicamente los pedales con el movimiento de las alas.', FALSE);

-- Pregunta 8
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué efecto tienen los alerones diferenciales sobre la guiñada adversa?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La eliminan completamente mediante la fricción.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La aumentan para facilitar el viraje coordinado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La reducen, aunque no la eliminan por completo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'No tienen efecto sobre la guiñada, solo sobre el alabeo.', FALSE);

-- Pregunta 9
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Sobre qué eje provoca un desequilibrio aerodinámico el timón de profundidad?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Eje longitudinal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Eje lateral.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Eje vertical.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Eje de simetría axial.', FALSE);

-- Pregunta 10
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En vuelo recto y nivelado, ¿cómo se encuentra el timón de profundidad respecto al estabilizador?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Desviado hacia arriba para mantener la nariz alta.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Desviado hacia abajo para compensar el peso del motor.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Alineado con el estabilizador.', TRUE),
((SELECT MAX(id) FROM pregunta), 'En movimiento constante de oscilación.', FALSE);

-- Pregunta 11
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se denomina el movimiento descendente del avión al empujar el comando?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cabreado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Alabeo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Picado.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Guiñada.', FALSE);

-- Pregunta 12
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué acción debe realizar el piloto para iniciar un ascenso o "cabreado"?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Girar el volante hacia la izquierda.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Tirar del volante hacia atrás.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Oprimir el pedal derecho.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Empujar el comando hacia adelante.', FALSE);

-- Pregunta 13
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Dónde se localiza el timón de dirección?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'En el extremo del estabilizador horizontal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En la parte trasera del estabilizador vertical.', TRUE),
((SELECT MAX(id) FROM pregunta), 'En el borde de salida de los alerones.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Debajo del fuselaje central.', FALSE);

-- Pregunta 14
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se opera el timón de dirección desde la cabina?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Mediante el giro del volante.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Tirando o empujando el comando principal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Por desplazamiento de los pedales o paloniers.', TRUE),
((SELECT MAX(id) FROM pregunta), 'A través de una palanca lateral de compensación.', FALSE);

-- Pregunta 15
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es el Centro de Gravedad (CG) en un avión?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El punto más alto de la aeronave donde se genera la sustentación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El centro de equilibrio donde se cruzan los 3 ejes de giro.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El límite máximo de carga de combustible en las alas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La línea imaginaria que recorre el borde de ataque.', FALSE);

-- Pregunta 16
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la ubicación aproximada del Centro de Gravedad respecto al ala?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'En el borde de salida exacto.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A un cuarto del borde de ataque.', TRUE),
((SELECT MAX(id) FROM pregunta), 'En la punta de las alas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Justo en la pared cortafuegos.', FALSE);

-- Pregunta 17
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Quién establece los márgenes del límite anterior y posterior del CG?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El piloto antes de cada despegue basándose en el clima.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El fabricante en el manual de vuelo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El personal de mantenimiento durante la carga de combustible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La torre de control según la longitud de la pista.', FALSE);

-- Pregunta 18
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿De qué depende el desplazamiento del CG dentro de sus límites establecidos?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'De la velocidad del viento de frente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'De cómo se cargue el avión.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Únicamente del ángulo de deflexión de los alerones.', FALSE),
((SELECT MAX(id) FROM pregunta), 'De la presión de los neumáticos del tren de aterrizaje.', FALSE);

-- Pregunta 19
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es una forma común de expresar la ubicación del CG en aviones pequeños?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'En grados de inclinación respecto al horizonte.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En pulgadas desde una línea llamada Datum.', TRUE),
((SELECT MAX(id) FROM pregunta), 'En kilogramos por metro cuadrado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En metros desde la cola del avión.', FALSE);

-- Pregunta 20
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué suele utilizarse comúnmente como línea de referencia o "Datum"?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El borde de salida del ala.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La pared cortafuegos.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El eje del estabilizador vertical.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El centro del panel de instrumentos.', FALSE);

-- Pregunta 21
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Además de pulgadas, ¿en qué otra unidad se puede expresar el CG?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Porcentaje de la cuerda aerodinámica media (MAC).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Newton-metros de torque.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porcentaje de la envergadura total.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Pies de altitud de presión.', FALSE);

-- Pregunta 22
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué dificultad presenta un avión con el Centro de Gravedad muy adelantado?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El avión tiende a caer de cola espontáneamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se necesita gran esfuerzo para levantar la nariz.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El avión se vuelve extremadamente inestable en el eje vertical.', FALSE),
((SELECT MAX(id) FROM pregunta), 'No se puede mantener el vuelo recto y nivelado por falta de potencia.', FALSE);

-- Pregunta 23
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué fases de vuelo es crítica una situación de CG muy adelantado?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Solo durante el crucero a gran altitud.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En el despegue y en una arremetida.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Durante el rodaje en pista solamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Al realizar virajes con gran ángulo de banqueo.', FALSE);

-- Pregunta 24
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué ocurre si el CG se encuentra ubicado detrás del límite posterior?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El avión se vuelve más estable y fácil de aterrizar.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El avión se cae de cola y se hace inestable.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Aumenta la eficiencia de los alerones diferenciales.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se requiere menos potencia para mantener la altitud.', FALSE);

-- Pregunta 25
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Entre un CG muy adelantado y uno muy atrasado, ¿cuál se considera la situación más peligrosa?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El CG muy adelantado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ambas son igualmente seguras si se vuela lento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El CG muy atrasado.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El texto no indica cuál es más peligrosa.', FALSE);

-- Pregunta 26
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuántos ejes imaginarios de giro tiene un avión?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Dos (x e y).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Tres (longitudinal, lateral y vertical).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Cuatro, incluyendo el eje temporal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Uno solo, que atraviesa el fuselaje.', FALSE);

-- Pregunta 27
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué eje va desde la nariz hasta la cola del avión?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Eje lateral.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Eje vertical.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Eje longitudinal.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Eje de cabeceo.', FALSE);

-- Pregunta 28
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se denomina el movimiento que se produce sobre el eje longitudinal?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cabeceo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Guiñada.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Rolido o alabeo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Picado.', FALSE);

-- Pregunta 29
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué tipo de estabilidad se ve afectada principalmente por el eje longitudinal?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Estabilidad longitudinal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Estabilidad lateral direccional.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Estabilidad de sustentación estática.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Estabilidad de presión dinámica.', FALSE);

-- Pregunta 30
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué puntos une el eje lateral del avión?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La nariz con el timón de dirección.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Las puntas de las alas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El techo de la cabina con el tren de aterrizaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Los estabilizadores horizontales con el motor.', FALSE);

-- Pregunta 31
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el nombre del movimiento producido sobre el eje lateral?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Alabeo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Guiñada.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cabeceo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Banqueo.', FALSE);

-- Pregunta 32
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué estabilidad se asocia directamente con el eje lateral?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Estabilidad lateral direccional.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Estabilidad longitudinal.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Estabilidad de guiñada adversa.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Estabilidad de alabeo diferencial.', FALSE);

-- Pregunta 33
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo corta el eje vertical a los otros dos ejes de giro?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'De forma paralela al eje longitudinal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Perpendicularmente.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Con un ángulo de 45 grados respecto al eje lateral.', FALSE),
((SELECT MAX(id) FROM pregunta), 'De forma tangencial al borde de ataque.', FALSE);

-- Pregunta 34
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué movimiento se asocia al eje vertical y qué estabilidad afecta?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cabeceo / Estabilidad longitudinal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Alabeo / Estabilidad lateral.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Guiñada / Estabilidad lateral direccional.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Picado / Estabilidad de cabeceo.', FALSE);

-- Pregunta 35
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuántos mandos secundarios de control de vuelo se mencionan en el texto?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Tres principales.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Dos (flaps y slats).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cuatro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cinco, incluyendo el tren de aterrizaje.', FALSE);

-- Pregunta 36
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la función principal de los compensadores?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aumentar la velocidad máxima del avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mantener la posición del avión aliviando el esfuerzo sobre los mandos.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Sustituir a los alerones en caso de emergencia mecánica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Modificar el centro de gravedad durante el vuelo.', FALSE);

-- Pregunta 37
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué tipo de compensadores son los más usados comúnmente?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Compensadores de alerones en aviones monomotores.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Compensadores de profundidad.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Compensadores de slats automáticos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Compensadores de flujo de aire en los spoilers.', FALSE);

-- Pregunta 38
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En aviones multimotores, ¿qué compensadores adquieren gran relevancia?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Solo los de profundidad para el despegue.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Los de dirección y de alerones.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Los compensadores de borde de ataque.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Los compensadores de las ranuras fijas.', FALSE);

-- Pregunta 39
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué superficie utilizan algunos aviones para que funcione como compensador?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El desplazamiento del estabilizador horizontal.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La extensión total de los flaps de borde de salida.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El ajuste manual de los slats en vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El timón de dirección en posición neutral.', FALSE);

-- Pregunta 40
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuándo deben ajustarse los compensadores fijos?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Constantemente durante el vuelo por el piloto.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Por el copiloto durante la fase de aproximación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En tierra previo al vuelo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Automáticamente por el sistema de datos de aire.', FALSE);

-- Pregunta 41
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Para qué se utilizan los compensadores fijos?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Para aumentar el ángulo de picada en aterrizajes cortos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Para limitar el efecto de los llamados "vicios" de los aviones.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Para bloquear los mandos primarios durante el estacionamiento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Para facilitar el movimiento de los spoilers en planeadores.', FALSE);

-- Pregunta 42
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Dónde se ubican usualmente los spoilers y cuál es su función?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Debajo del ala; aumentan la presión del aire para subir.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En la parte superior del ala; interrumpen el flujo de aire.', TRUE),
((SELECT MAX(id) FROM pregunta), 'En el borde de ataque; permiten volar a menores velocidades.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En el fuselaje trasero; actúan como frenos de emergencia.', FALSE);

-- Pregunta 43
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué tipos de aeronaves son muy utilizados los spoilers?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Únicamente en aviones de aviación general mecánica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En planeadores (vuelo a vela) y aviones a reacción.', TRUE),
((SELECT MAX(id) FROM pregunta), 'En helicópteros y aeronaves de despegue vertical.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En aviones antiguos con mandos de cables y poleas.', FALSE);

-- Pregunta 44
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué son los slats y dónde se ubican?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Superficies en el borde de salida que aumentan la resistencia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ranuras ubicadas en el borde de ataque del ala.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Pequeñas aletas en el empenaje para control de guiñada.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cables reforzados que conectan los pedales.', FALSE);

-- Pregunta 45
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el beneficio de utilizar slats en el ala?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Permiten aumentar el ángulo de ataque y volar a velocidades menores.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Reducen el consumo de combustible al eliminar el alabeo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Permiten bloquear el timón de profundidad en crucero.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Evitan que el centro de gravedad se mueva hacia adelante.', FALSE);

-- Pregunta 46
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué otros dispositivos de borde de ataque se mencionan como menos comunes en aviación general?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Alerones diferenciales y compensadores móviles.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Slots (ranuras fijas) y flaps de borde de ataque.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Timones de profundidad duales y spoilers inferiores.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cadenas de transmisión y rondanas de alta fricción.', FALSE);

-- Pregunta 47
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué tipo de aeronaves suelen utilizar flaps de borde de ataque?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aviones de gran porte.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Planeadores de vuelo a vela ligeros.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aviones de entrenamiento básico monomotores.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aeronaves experimentales de cola en V.', FALSE);

-- Pregunta 48
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿A qué se refieren los "otros mandos de control" mencionados al final del texto?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Al uso de pilotos automáticos avanzados.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A la disposición y cantidad de timones de profundidad y dirección.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Al control de los motores mediante palancas de gases.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A los sistemas de navegación por satélite.', FALSE);

-- Pregunta 49
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál de estos es un ejemplo de una disposición alternativa de mandos?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Alas de geometría variable.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cola en T o Cola en V.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Aerofrenos de fuselaje central.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hélices de paso variable.', FALSE);

-- Pregunta 50
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué configuración sitúa superficies de control en la parte delantera del avión?', '2');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cola en T.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Estabilizadores múltiples traseros.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Canard.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Slats fijos de fuselaje.', FALSE);

-- ============================================
-- FIN DE LOS INSERTS DEL CAPÍTULO 2
-- ============================================

