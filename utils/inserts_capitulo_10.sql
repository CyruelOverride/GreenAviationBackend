-- ============================================
-- INSERCIÓN DE PREGUNTAS Y OPCIONES
-- Capítulo: 10 - Factores Aeromédicos
-- ============================================

-- Pregunta 1
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la principal preocupación fisiológica respecto a la hipoxia en el ámbito aeronáutico?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La muerte inmediata de los tejidos musculares periféricos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La vulnerabilidad del cerebro ante la falta de oxígeno.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El aumento excesivo de la presión arterial sistólica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La degradación espontánea de los glóbulos blancos.', FALSE);

-- Pregunta 2
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué tipo de hipoxia se define como la incapacidad de las células para utilizar eficazmente el oxígeno?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Hipoxia hipóxica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hipoxia anémica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hipoxia estancada.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hipoxia histotóxica.', TRUE);

-- Pregunta 3
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿A partir de qué altitud la visión nocturna empieza a sufrir pequeñas perturbaciones por falta de oxígeno?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1.500 metros.', FALSE),
((SELECT MAX(id) FROM pregunta), '3.000 metros.', FALSE),
((SELECT MAX(id) FROM pregunta), '5.000 metros.', TRUE),
((SELECT MAX(id) FROM pregunta), '5.500 metros.', FALSE);

-- Pregunta 4
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el factor más importante que influye en la aparición de una situación de hipoxia?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El consumo de tabaco previo al vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El estado de hidratación del piloto.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La altitud de vuelo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El tipo de alimentación durante el crucero.', FALSE);

-- Pregunta 5
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según el texto, ¿cuál es el Tiempo de Conciencia Útil (TUC) estimado a una altitud de 35,000 pies MSL?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '15 a 20 segundos.', FALSE),
((SELECT MAX(id) FROM pregunta), '30 a 60 segundos.', TRUE),
((SELECT MAX(id) FROM pregunta), '1 a 2 minutos.', FALSE),
((SELECT MAX(id) FROM pregunta), '3 a 5 minutos.', FALSE);

-- Pregunta 6
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué respuesta fisiológica compensatoria genera el cuerpo ante la hipoxia?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Una disminución del ritmo circulatorio.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una reducción del ritmo respiratorio.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La puesta en circulación de una gran cantidad de glóbulos rojos.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La contracción de los vasos sanguíneos cerebrales.', FALSE);

-- Pregunta 7
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál de los siguientes es un síntoma común de la hipoxia mencionado en las fuentes?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Hiperactividad extrema.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cianosis (uñas y labios azules).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Aumento de la agudeza auditiva.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mejora de la coordinación muscular.', FALSE);

-- Pregunta 8
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Para evitar la hipoxia, ¿cuál es la recomendación general de altitud para el vuelo sin oxígeno suplementario?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Volar siempre por debajo de los 15.000 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Volar por debajo de los 10.000 pies.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Mantenerse por debajo de los 5.000 metros.', FALSE),
((SELECT MAX(id) FROM pregunta), 'No superar los 18.000 pies de altitud de presión.', FALSE);

-- Pregunta 9
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué define técnicamente a la hiperventilación?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El aumento de la presión parcial de oxígeno en los pulmones.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La frecuencia y profundidad excesiva de la respiración que conduce a la pérdida de CO2.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La incapacidad de los alvéolos para intercambiar gases con la sangre.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una reacción alérgica a los contaminantes del aire en cabina.', FALSE);

-- Pregunta 10
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Por qué la hiperventilación puede conducir a la pérdida del conocimiento?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Debido a una obstrucción mecánica de las vías aéreas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Por el mecanismo del sistema respiratorio para recuperar el control de la respiración.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Por la falta total de hemoglobina en el torrente sanguíneo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Debido a una expansión súbita de los gases intestinales.', FALSE);

-- Pregunta 11
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es un síntoma compartido entre la hipoxia y la hiperventilación según las fuentes?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cianosis severa.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Sensación de mareos o vértigo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Euforia extrema constante.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Somnolencia profunda inmediata.', FALSE);

-- Pregunta 12
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según la Ley de Boyle-Mariotte aplicada al organismo, ¿qué sucede con los gases intestinales durante el ascenso?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Su volumen disminuye proporcionalmente a la altitud.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Su volumen varía de forma inversamente proporcional a la presión atmosférica.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Los gases se disuelven completamente en la sangre.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La presión del gas se duplica cada 1.000 metros.', FALSE);

-- Pregunta 13
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Si un piloto asciende hasta los 5.000 metros, ¿qué proporción de su volumen inicial tenderán a ocupar los gases intestinales?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La mitad del volumen inicial.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El doble de su volumen inicial.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Cuatro veces su volumen inicial.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se mantendrán constantes por la elasticidad abdominal.', FALSE);

-- Pregunta 14
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué alimentos se recomienda evitar antes del vuelo para prevenir molestias por expansión de gases?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Carnes rojas y pescados blancos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Judías, cebolla o melón.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Frutos secos y agua mineral.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Pastas y cereales integrales.', FALSE);

-- Pregunta 15
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la función principal de la trompa de Eustaquio en el oído medio?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Transmitir las ondas sonoras al oído interno.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mantener la misma presión en ambas caras del tímpano.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Secretar mucosidad para lubricar el canal auditivo externo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Alojar la cadena de huesecillos para la audición.', FALSE);

-- Pregunta 16
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué fase del vuelo es más probable que se produzca la Otitis Barotraumática si la trompa de Eustaquio está obstruida?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Durante el despegue.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Durante el ascenso prolongado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Durante el vuelo de crucero a alta altitud.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Durante el descenso.', TRUE);

-- Pregunta 17
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué maniobra se recomienda para liberar la trompa de Eustaquio y equilibrar presiones?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Mantener la respiración por 30 segundos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Apretar los orificios nasales y soplar manteniendo los labios cerrados.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Realizar una inspiración profunda con la boca abierta.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Sacudir la cabeza lateralmente con rapidez.', FALSE);

-- Pregunta 18
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Por qué el monóxido de carbono (CO) es tan peligroso para un piloto?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Porque tiene un olor fétido que causa náuseas inmediatas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porque la hemoglobina se combina con él 200 veces más rápido que con el oxígeno.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Porque aumenta drásticamente la temperatura de la cabina.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porque destruye los glóbulos blancos al contacto.', FALSE);

-- Pregunta 19
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es una causa común de presencia de monóxido de carbono en la cabina de un avión pequeño?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Una fuga en el sistema de combustible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una rotura en el tubo de escape del motor que entra por la calefacción.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El uso excesivo de luces de aterrizaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La evaporación de fluidos hidráulicos.', FALSE);

-- Pregunta 20
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Ante la detección de monóxido de carbono, ¿qué acción inmediata debe tomar el piloto?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aumentar la calefacción para quemar el gas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Quitar la calefacción, abrir ventanillas y aterrizar lo antes posible.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Ascender a una altitud mayor para encontrar aire puro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cerrar todas las tomas de aire para evitar corrientes.', FALSE);

-- Pregunta 21
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué porcentaje de accidentes analizados en aviación general presentaron síntomas de alcohol en la sangre según el texto?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '10,5%.', FALSE),
((SELECT MAX(id) FROM pregunta), '25,0%.', FALSE),
((SELECT MAX(id) FROM pregunta), '34,5%.', TRUE),
((SELECT MAX(id) FROM pregunta), '50,0%.', FALSE);

-- Pregunta 22
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo afecta el alcohol la capacidad de reacción de un piloto en comparación con un conductor?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El piloto necesita el doble de alcohol para verse afectado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Con la cuarta parte del alcohol necesario para un conductor, el piloto ya presenta disminución en su capacidad.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El alcohol no afecta la coordinación fina en vuelo, solo el juicio.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El efecto del alcohol desaparece instantáneamente con la altitud.', FALSE);

-- Pregunta 23
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según el LAR 91.17, ¿cuánto tiempo debe transcurrir como mínimo entre el consumo de alcohol y la actuación como tripulante?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '4 horas.', FALSE),
((SELECT MAX(id) FROM pregunta), '8 horas.', FALSE),
((SELECT MAX(id) FROM pregunta), '12 horas.', FALSE),
((SELECT MAX(id) FROM pregunta), '24 horas.', TRUE);

-- Pregunta 24
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el límite permitido de alcohol en sangre para un tripulante ante una espirometría?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '0,00%.', TRUE),
((SELECT MAX(id) FROM pregunta), '0,02%.', FALSE),
((SELECT MAX(id) FROM pregunta), '0,04%.', FALSE),
((SELECT MAX(id) FROM pregunta), '0,05%.', FALSE);

-- Pregunta 25
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué efecto pueden tener las medicinas como los antihistamínicos en un piloto en vuelo?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Mejora de la visión nocturna.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Afectación del buen juicio y la coordinación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Aumento de la resistencia a la hipoxia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Reducción del tiempo de reacción ante emergencias.', FALSE);

-- Pregunta 26
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Si un piloto toma medicación, ¿cuál es el período recomendado de espera antes de volver a volar?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'De 1 a 4 horas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Entre 24 horas y una semana, según la dosis.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Exactamente 48 horas en todos los casos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'No es necesario esperar si la medicina es de venta libre.', FALSE);

-- Pregunta 27
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué sistema utiliza el cuerpo para determinar la orientación mediante nervios en la piel, músculos y articulaciones?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Sistema vestibular.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Sistema somatosensorial.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Sistema visual.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Sistema auditivo central.', FALSE);

-- Pregunta 28
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué tipo de vuelo la orientación espacial se consigue principalmente por el sentido de la vista comparando con la superficie terrestre?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Vuelo instrumental (IFR).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Vuelo nocturno sobre el océano.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Vuelo visual (VFR).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Vuelo dentro de nubes densas.', FALSE);

-- Pregunta 29
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué debe hacer un piloto si experimenta desorientación espacial durante un vuelo instrumental?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cerrar los ojos para resetear el sistema vestibular.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Confiar plenamente en lo que indican los instrumentos de vuelo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Hacer movimientos rápidos de cabeza para despejar el vértigo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Seguir sus sensaciones corporales aunque contradigan al horizonte artificial.', FALSE);

-- Pregunta 30
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Dónde se encuentran situados los canales semicirculares encargados de detectar el movimiento?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'En el oído externo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En el oído medio.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En el oído interno.', TRUE),
((SELECT MAX(id) FROM pregunta), 'En la corteza cerebral occipital.', FALSE);

-- Pregunta 31
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué se entiende por fatiga aguda en el contexto aeronáutico?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Un cansancio a largo plazo con raíces psicológicas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El cansancio normal después de un esfuerzo extenuante o falta de sueño que se cura con descanso.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Una enfermedad subyacente que requiere tratamiento médico prolongado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La pérdida total de la capacidad de comunicarse por estrés postraumático.', FALSE);

-- Pregunta 32
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el método principal para curar la fatiga aguda?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Una dieta estricta alta en carbohidratos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Tratamiento médico psiquiátrico.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Descanso después del esfuerzo y 8 horas de sueño profundo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El uso de estimulantes permitidos bajo prescripción.', FALSE);

-- Pregunta 33
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué caracteriza a la fatiga crónica según el texto?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Se alivia rápidamente con una siesta de 2 horas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Generalmente tiene raíces psicológicas y requiere tratamiento médico.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Es un hecho normal de la vida diaria tras el ejercicio.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se produce únicamente por la falta de oxígeno en vuelos cortos.', FALSE);

-- Pregunta 34
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué tipo de células del ojo son responsables de la visión del color?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Bastones.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Conos.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Cilios.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Fóveas.', FALSE);

-- Pregunta 35
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la función principal de los bastones en la retina?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Apreciar los sutiles matices de una pintura.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Detectar movimiento y proporcionar visión en la penumbra.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Enfocar objetos lejanos durante el día.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Registrar las imágenes en el centro de la fóvea.', FALSE);

-- Pregunta 36
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuántas veces más sensibles a la luz son los bastones comparados con los conos una vez adaptados a la oscuridad?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '100 veces.', FALSE),
((SELECT MAX(id) FROM pregunta), '1.000 veces.', FALSE),
((SELECT MAX(id) FROM pregunta), '10.000 veces.', TRUE),
((SELECT MAX(id) FROM pregunta), '100.000 veces.', FALSE);

-- Pregunta 37
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Por qué existe un "punto ciego nocturno" en el centro del campo de visión?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Porque los bastones se concentran excesivamente en la fóvea.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porque los conos están concentrados en la fóvea y no responden bien a la baja intensidad de luz.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Debido a una falta de circulación sanguínea en el nervio óptico por la noche.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Por el reflejo de las luces de la cabina en el cristalino.', FALSE);

-- Pregunta 38
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Para ver un objeto claramente de noche, ¿hacia dónde debe mirar el piloto?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Directamente al centro del objeto.', FALSE),
((SELECT MAX(id) FROM pregunta), 'De 5° a 10° fuera del centro del objeto.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Únicamente utilizando la visión periférica superior a 30°.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cerrando un ojo para evitar la fatiga visual.', FALSE);

-- Pregunta 39
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué causa la ilusión visual de "autocinesis"?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La mirada fija en un solo punto de luz contra un fondo oscuro por varios segundos.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Volar hacia la orilla de un océano con estrellas brillantes.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La confusión entre luces de trenes en movimiento y luces de pista.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un descenso rápido que afecta el fluido endolinfa.', FALSE);

-- Pregunta 40
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo puede un piloto evitar la ilusión de autocinesis?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Mirando fijamente el objetivo para confirmar su posición.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Enfocando los ojos en objetos a diferentes distancias y manteniendo un patrón de lectura normal.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Apagando todas las luces internas de la cabina.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aumentando la velocidad del avión para cambiar la perspectiva.', FALSE);

-- Pregunta 41
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuándo puede ocurrir la ilusión de "Falso Horizonte"?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cuando se vuela sobre una pista muy ancha.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cuando el horizonte natural está oscurecido y se confunden estrellas con luces de ciudades.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Al realizar una aproximación bajo la lluvia intensa.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Debido a la fatiga crónica tras 8 horas de vuelo.', FALSE);

-- Pregunta 42
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué tendencia natural genera el volar sobre terreno sin luz durante la noche?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Realizar una aproximación por encima de lo normal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Realizar una aproximación por debajo de lo normal.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Aumentar la velocidad de aproximación por desorientación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Nivelar el avión antes de llegar al umbral de la pista.', FALSE);

-- Pregunta 43
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué ilusión pueden producir las luces de pista muy brillantes?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La ilusión de estar demasiado bajo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La ilusión de estar mucho más lejos de la pista.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La sensación de que la pista es más corta de lo real.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La percepción de que el avión está invertido.', FALSE);

-- Pregunta 44
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El término "Mal de alturas" se utiliza frecuentemente para referirse a:', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La desorientación espacial en nubes.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La hipoxia y sus alteraciones en el razonamiento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El miedo irracional a volar a altas velocidades.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La otitis producida por el ruido del motor.', FALSE);

-- Pregunta 45
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el síntoma mental más peligroso de la hipoxia según las fuentes?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La agudeza visual extrema.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La total inconsciencia del peligro mortal que amenaza al individuo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El aumento de la capacidad de toma de decisiones bajo presión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La memorización involuntaria de datos irrelevantes.', FALSE);

-- Pregunta 46
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué sucede con el sentido del oído ante el aumento de la altitud?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Se vuelve más sensible a las frecuencias bajas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Existe una demostrada disminución de la agudeza auditiva.', TRUE),
((SELECT MAX(id) FROM pregunta), 'No sufre variaciones hasta los 10.000 metros.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mejora debido a la menor densidad del aire.', FALSE);

-- Pregunta 47
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En un vuelo dentro de nubes, ¿qué sensación falsa es común si el piloto no confía en sus instrumentos?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La sensación de estar volando perfectamente levelado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La sensación de estar volando invertido.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La percepción de que el avión ha acelerado bruscamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El sentimiento de estar estático en el aire.', FALSE);

-- Pregunta 48
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿A qué se le denomina comúnmente como "la mano del gigante"?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Al exceso de fuerza necesario para mover los controles.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A la situación de desorientación espacial o vértigos.', TRUE),
((SELECT MAX(id) FROM pregunta), 'A la presión que ejerce el cinturón de seguridad en turbulencia.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Al efecto de la gravedad en virajes de gran inclinación alar.', FALSE);

-- Pregunta 49
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Por qué no deben transportarse por aire personas recién operadas del abdomen?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Por el riesgo de infecciones virales en cabina.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porque la expansión de gases intestinales puede afectar las suturas y causar dolor.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Debido a que la hipoxia anula el efecto de los antibióticos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Por la imposibilidad de mantener una temperatura corporal estable.', FALSE);

-- Pregunta 50
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué se recomienda hacer si aparece dolor de oídos severo durante el descenso a pesar de los intentos de equilibrar presión?', '10');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Ascender inmediatamente a la altitud de crucero original.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aplicar gotas analgésicas y tratar de liberar la trompa de Eustaquio (tragar, mascar chicle).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Realizar un descenso mucho más rápido para terminar el vuelo pronto.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Tapar los oídos con algodón herméticamente.', FALSE);

-- ============================================
-- FIN DE LOS INSERTS DEL CAPÍTULO 10
-- ============================================

