-- ============================================
-- INSERCIÓN DE PREGUNTAS Y OPCIONES
-- Capítulo: 5 - Sistemas de Aeronaves y Motores
-- ============================================

-- Pregunta 1
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la función principal de las alas en una aeronave según el texto?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Alojar los mandos secundarios de control.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Producir la sustentación necesaria para el vuelo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Servir como depósito principal para el sistema hidráulico.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Estabilizar el desplazamiento del avión en tierra.', FALSE);

-- Pregunta 2
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En un tren de aterrizaje de tipo triciclo, ¿cómo se controla la rueda de nariz en tierra?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Mediante el uso diferencial de los frenos de disco.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A través de los alerones ubicados en el empenaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mediante los pedales desde la cabina, con un desplazamiento de 10º a cada lado.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Automáticamente por el sistema hidráulico de doble efecto.', FALSE);

-- Pregunta 3
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué componentes forman estrictamente el "Grupo Motopropulsor"?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El motor, la hélice y el sistema de inducción.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Únicamente el motor de combustión interna.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La hélice y el motor propiamente dicho.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El motor, el alternador y el árbol de levas.', FALSE);

-- Pregunta 4
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál de los siguientes se clasifica como un mando primario de control?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Flaps.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Compensadores.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Timón de dirección.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Cowl flaps.', FALSE);

-- Pregunta 5
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué caracteriza a la construcción de un fuselaje de tipo monocasco?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Es el cuerpo principal del avión diseñado para ser sumergible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Es una estructura donde el revestimiento soporta gran parte de los esfuerzos.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Utiliza una estructura interna de largueros sin revestimiento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Está diseñado exclusivamente para aviones de ala alta por gravedad.', FALSE);

-- Pregunta 6
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Sobre el sistema eléctrico de un avión de aviación general, ¿cuál es la afirmación correcta?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El motor depende del sistema eléctrico para su funcionamiento continuo en vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El sistema eléctrico alimenta exclusivamente a los magnetos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Si se desconecta el sistema eléctrico en vuelo, el motor continúa funcionando.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Produce corriente continua directamente desde el alternador sin conversión.', FALSE);

-- Pregunta 7
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el voltaje estándar más común en la aviación general ligera?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '6 voltios.', FALSE),
((SELECT MAX(id) FROM pregunta), '12 voltios.', FALSE),
((SELECT MAX(id) FROM pregunta), '48 voltios.', FALSE),
((SELECT MAX(id) FROM pregunta), '110 voltios.', FALSE);

-- Pregunta 8
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué dispositivo se encarga de proteger el sistema eléctrico contra sobrecargas?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El amperímetro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El interruptor MASTER.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Los disyuntores o "breakers".', TRUE),
((SELECT MAX(id) FROM pregunta), 'El regulador de voltaje.', FALSE);

-- Pregunta 9
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se monitorea el estado del sistema eléctrico en la cabina?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Mediante el indicador EGT.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A través del amperímetro y/o voltímetro.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Observando la presión en la barra colectora.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mediante la luz de advertencia de pérdida.', FALSE);

-- Pregunta 10
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál de los siguientes componentes NO forma parte del sistema eléctrico?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Alternador.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Magnetos.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Barra colectora.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Motor de arranque.', FALSE);

-- Pregunta 11
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Los motores recíprocos más comunes en aviación ligera tienen sus cilindros dispuestos de forma:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Radial circular.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Opuesta horizontalmente.', TRUE),
((SELECT MAX(id) FROM pregunta), 'En línea vertical.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En estrella doble.', FALSE);

-- Pregunta 12
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En un motor de 4 tiempos, ¿cuántas revoluciones del cigüeñal se requieren para completar un ciclo?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Una revolución.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Dos revoluciones.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Cuatro revoluciones.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ocho revoluciones.', FALSE);

-- Pregunta 13
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Durante el tiempo de "Compresión" en un motor de aviación:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La válvula de admisión está abierta y la de escape cerrada.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ambas válvulas están cerradas y el pistón asciende.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Las bujías encienden la mezcla mientras el pistón baja.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se abre la válvula de escape para liberar gases quemados.', FALSE);

-- Pregunta 14
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué componente transforma el movimiento rectilíneo del pistón en movimiento rotatorio?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El árbol de levas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La biela conectada al cigüeñal.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Las válvulas de admisión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El alternador.', FALSE);

-- Pregunta 15
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué tiempo del motor la mezcla de aire/combustible ingresa al cilindro?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Explosión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Escape.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Admisión.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Compresión.', FALSE);

-- Pregunta 16
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el método principal de enfriamiento en la mayoría de los motores de aviación ligera?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Circulación de líquido refrigerante.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aire forzado a través de aletas de aluminio.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Uso constante de la bomba auxiliar eléctrica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Enfriamiento por expansión de gases de escape.', FALSE);

-- Pregunta 17
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El instrumento CHT (Cylinder Head Temperature) toma la temperatura de:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El cilindro más cercano a la entrada de aire.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El cilindro menos refrigerado (usualmente el de más atrás).', TRUE),
((SELECT MAX(id) FROM pregunta), 'El aceite justo antes de entrar al radiador.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El promedio de todos los cilindros del motor.', FALSE);

-- Pregunta 18
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Si un avión no posee "cowl flaps", ¿qué acción puede tomar el piloto para reducir la temperatura del motor?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Disminuir la velocidad de vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Enriquecer la mezcla de combustible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Empobrecer la mezcla para quemar menos combustible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aumentar la potencia para generar más flujo de aire.', FALSE);

-- Pregunta 19
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Por qué el indicador de temperatura de aceite se considera una medición indirecta del enfriamiento?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Porque mide la temperatura de la bujía.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porque tiene una indicación retardada respecto a la temperatura real del motor.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Porque solo funciona cuando el alternador está encendido.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porque mide únicamente la fricción en el cigüeñal.', FALSE);

-- Pregunta 20
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué función cumplen los "cowl flaps" en aviones de alta potencia?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Controlar la sustentación en las puntas de las alas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Regular el flujo de aire que pasa a través del motor para controlar su temperatura.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Actuar como frenos aerodinámicos durante el aterrizaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Dirigir los gases de escape hacia el turbocompresor.', FALSE);

-- Pregunta 21
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El sistema de encendido en aviación es redundante porque cuenta con:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Dos baterías de 24 voltios cada una.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Dos magnetos independientes.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Un alternador y un generador de respaldo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una bujía central de alta capacidad.', FALSE);

-- Pregunta 22
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué sucede si se desconecta el sistema de encendido (magnetos) durante el vuelo?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El motor continúa funcionando gracias a la batería.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El motor se detiene inmediatamente.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El motor baja sus RPM pero sigue operando por autoinflamación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El sistema eléctrico asume la generación de chispa.', FALSE);

-- Pregunta 23
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la función específica de las bujías?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Generar energía eléctrica para el alternador.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Producir la chispa que enciende la mezcla dentro del cilindro.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Distribuir el aceite a las partes móviles.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Sincronizar la apertura de las válvulas de escape.', FALSE);

-- Pregunta 24
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En la llave de encendido, la posición "L" (Left) significa que:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Solo el magneto izquierdo está funcionando y el derecho está a tierra.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El motor de arranque está girando hacia la izquierda.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Solo las bujías inferiores del motor están activas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El sistema eléctrico está cargando la batería desde el lado izquierdo.', FALSE);

-- Pregunta 25
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué componente transporta el pulso eléctrico desde el magneto hasta las bujías?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La barra colectora.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El árbol de levas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El arnés de encendido o cables.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El venturi sonic.', FALSE);

-- Pregunta 26
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El sistema de alimentación de combustible por gravedad se encuentra típicamente en:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aviones de ala baja.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aviones de ala alta (ej. Cessna).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Aviones con motores turboalimentados.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aeronaves que utilizan combustible Jet A.', FALSE);

-- Pregunta 27
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Para qué se utiliza la bomba de combustible auxiliar (eléctrica) en sistemas de bomba?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Para filtrar impurezas sólidas del combustible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Para el arranque del motor y como refuerzo en caso de falla de la bomba mecánica.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Para transferir combustible entre los tanques de las alas en vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Para aumentar el octanaje del combustible antes de la inyección.', FALSE);

-- Pregunta 28
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la función de los drenadores en el sistema de combustible?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Permitir la entrada de aire para evitar el vacío en los tanques.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Detectar y eliminar el agua acumulada en la parte más baja del sistema.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Inyectar combustible vaporizado en los cilindros para el arranque en frío.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Controlar la presión de admisión en motores turbo.', FALSE);

-- Pregunta 29
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El dispositivo que vaporiza combustible en uno o dos cilindros para facilitar el arranque en frío se llama:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Mezclador.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Primer.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Alternador.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Selector.', FALSE);

-- Pregunta 30
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué indica el color azul en el combustible de aviación?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Que es grado AVGAS 80.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que es combustible Jet A para turbinas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que es grado 100LL (Low Lead).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Que el combustible está contaminado con agua.', FALSE);

-- Pregunta 31
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la proporción de mezcla óptima entre aire y combustible?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1 parte de aire por 10 de combustible.', FALSE),
((SELECT MAX(id) FROM pregunta), '15 partes de aire por 1 de combustible.', TRUE),
((SELECT MAX(id) FROM pregunta), '10 partes de aire por 1 de combustible.', FALSE),
((SELECT MAX(id) FROM pregunta), '5 partes de aire por 5 de combustible.', FALSE);

-- Pregunta 32
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El "hielo en el carburador" se produce principalmente debido a:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Las bajas temperaturas del aire exterior por encima de 30,000 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El enfriamiento por vaporización del combustible y la expansión del aire en el venturi.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La falta de lubricación en las válvulas de admisión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El uso de combustible con octanaje superior al recomendado.', FALSE);

-- Pregunta 33
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el rango de temperatura exterior más propicio para la formación de hielo en el carburador?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Entre -20 ºC y -40 ºC.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Entre -7 ºC y +21 ºC.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Únicamente por debajo de los 0 ºC.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Entre +25 ºC y +40 ºC.', FALSE);

-- Pregunta 34
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Un síntoma claro de formación de hielo en el carburador en un avión con hélice de paso fijo es:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Un aumento repentino de la temperatura de aceite.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una disminución en las RPM del motor.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Un incremento en la presión de admisión (Manifold Press).', FALSE),
((SELECT MAX(id) FROM pregunta), 'La desconexión automática del interruptor MASTER.', FALSE);

-- Pregunta 35
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Por qué se debe enriquecer la mezcla al iniciar un descenso desde una altitud de crucero?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Para evitar que el motor se congele por el aire frío.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porque la densidad del aire aumenta al descender.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Para reducir el consumo de combustible en ralentí.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Para aumentar la presión diferencial en la cabina.', FALSE);

-- Pregunta 36
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Una ventaja del sistema de inyección de combustible sobre el de carburador es:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Mayor facilidad de arranque con el motor en caliente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Menor susceptibilidad a la formación de hielo en la inducción.', TRUE),
((SELECT MAX(id) FROM pregunta), 'No requiere bomba de combustible eléctrica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Utiliza aire caliente del escape de forma constante.', FALSE);

-- Pregunta 37
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué instrumento permite al piloto ajustar la mezcla de forma precisa midiendo los gases de escape?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'CHT.', FALSE),
((SELECT MAX(id) FROM pregunta), 'EGT (Exhaust Gas Temperature).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Tacómetro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Manifold Pressure.', FALSE);

-- Pregunta 38
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('La detonación en un motor puede ser causada por:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Usar una mezcla demasiado rica en el despegue.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Utilizar un combustible de octanaje más bajo del apropiado.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Volar a altitudes superiores a la altitud crítica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mantener los tanques de combustible parcialmente llenos.', FALSE);

-- Pregunta 39
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Para evitar la contaminación por agua, se recomienda:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Mantener los tanques de combustible casi vacíos para que el aire circule.', FALSE),
((SELECT MAX(id) FROM pregunta), 'No llenar los tanques por encima de la mitad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'No dejar los tanques parcialmente llenos por mucho tiempo para evitar la condensación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Usar únicamente tambores de plástico para el reabastecimiento.', FALSE);

-- Pregunta 40
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Al reabastecer combustible, ¿qué medida de seguridad es crítica contra la electricidad estática?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Apagar las luces de navegación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Colocar una descarga estática del avión al piso.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Utilizar teléfonos celulares para monitorear la carga.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mantener el motor en ralentí durante la carga.', FALSE);

-- Pregunta 41
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuáles son los dos propósitos fundamentales del sistema de lubricación?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Generar chispa y limpiar los filtros de aire.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Lubricar piezas móviles y disipar calor.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Controlar las RPM y presurizar la cabina.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mover los flaps y el tren de aterrizaje.', FALSE);

-- Pregunta 42
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Si tras arrancar el motor no se obtiene presión de aceite en 20 segundos, el piloto debe:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aumentar la potencia para cebar la bomba.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Conectar la bomba de combustible auxiliar.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Detener el motor inmediatamente.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Ignorar la lectura hasta que el motor caliente.', FALSE);

-- Pregunta 43
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En una hélice, el "paso geométrico" se define como:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La distancia real que el avión avanza en una revolución.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La distancia teórica que avanzaría la hélice en un medio sólido.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El ángulo de ataque de la pala en la raíz.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La diferencia entre el paso efectivo y el deslizamiento.', FALSE);

-- Pregunta 44
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Para el despegue y aterrizaje, ¿qué ajuste de hélice de paso variable se debe utilizar?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Paso grueso (bajas RPM).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Paso fino (máxima potencia).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Paso intermedio para ahorro de combustible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Paso de bandera para evitar resistencia.', FALSE);

-- Pregunta 45
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué controla el acelerador en un avión con hélice de velocidad constante?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Las RPM del motor directamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La presión de admisión (Manifold Pressure).', TRUE),
((SELECT MAX(id) FROM pregunta), 'El flujo de corriente del alternador.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La temperatura de la cabeza de cilindro.', FALSE);

-- Pregunta 46
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('La "altitud crítica" en un motor turboalimentado es:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La altura mínima para que el carburador no se congele.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La altura máxima a la que el motor puede producir su potencia nominal de nivel del mar.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La altitud donde la presión diferencial de cabina llega a cero.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La altura donde el motor de émbolo deja de funcionar por falta de oxígeno.', FALSE);

-- Pregunta 47
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En un sistema hidráulico, ¿qué componente convierte la energía del fluido en trabajo mecánico?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El acumulador.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El actuador o servo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La válvula de alivio.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El filtro de micrones.', FALSE);

-- Pregunta 48
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El fluido hidráulico más común en aviones pequeños es de base mineral y tiene su origen en:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aceite vegetal refinado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un producto derivado del petróleo (queroseno).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Fluido sintético no inflamable.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Agua destilada con aditivos anticorrosivos.', FALSE);

-- Pregunta 49
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Un sistema de presurización típico mantiene una altitud de cabina de aproximadamente:', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Nivel del mar (0 pies).', FALSE),
((SELECT MAX(id) FROM pregunta), '8,000 pies.', TRUE),
((SELECT MAX(id) FROM pregunta), '12,500 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La misma altitud real a la que vuela el avión.', FALSE);

-- Pregunta 50
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué dispositivo regula la presión de la cabina permitiendo la salida controlada de aire al exterior?', '5');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Venturi sonic.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Válvula de flujo de salida (outflow valve).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Compresor de gases de escape.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Sonda de temperatura ambiente.', FALSE);

-- ============================================
-- FIN DE LOS INSERTS DEL CAPÍTULO 5
-- ============================================

