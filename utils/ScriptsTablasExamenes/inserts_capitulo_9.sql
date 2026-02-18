-- ============================================
-- INSERCIÓN DE PREGUNTAS Y OPCIONES
-- Capítulo: 9 - Toma de Decisiones Aeronáuticas (ADM)
-- ============================================

-- Pregunta 1
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se define formalmente la Toma de Decisiones Aeronáuticas (ADM)?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Una técnica intuitiva para reaccionar ante emergencias mecánicas imprevistas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una aproximación sistemática al proceso mental utilizado por los pilotos para determinar el mejor curso de acción.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Un método de entrenamiento exclusivo para pilotos de aerolíneas comerciales de gran escala.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un procedimiento estandarizado para aumentar la velocidad de respuesta durante el aterrizaje.', FALSE);

-- Pregunta 2
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué porcentaje aproximado de accidentes de aviación se estima que están relacionados con factores humanos?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '24.1%', FALSE),
((SELECT MAX(id) FROM pregunta), '50%', FALSE),
((SELECT MAX(id) FROM pregunta), '80%', TRUE),
((SELECT MAX(id) FROM pregunta), '95%', FALSE);

-- Pregunta 3
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según las estadísticas presentadas, ¿en qué fases del vuelo se producen la gran mayoría de los accidentes relacionados con factores humanos?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Crucero y descenso.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Despegue y aterrizaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Maniobras y aproximación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Pre-vuelo y ascenso.', FALSE);

-- Pregunta 4
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el objetivo principal del capítulo sobre ADM según el texto?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Sustituir las habilidades de vuelo manual por sistemas automatizados.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ayudar al piloto a mejorar sus habilidades de ADM para mitigar los factores de riesgo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Proporcionar un manual técnico sobre la mecánica de los aviones de aviación general.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Reducir el tiempo de formación teórica de los nuevos pilotos.', FALSE);

-- Pregunta 5
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué elemento es fundamental comprender para entender la ADM y mejorar la seguridad en la cabina?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La programación avanzada de los sistemas MFD.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cómo las actitudes personales influyen en la toma de decisiones.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El historial de mantenimiento mecánico de la aeronave.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La normativa internacional sobre licencias de vuelo comercial.', FALSE);

-- Pregunta 6
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo se define la Gestión de Recursos de un Solo Piloto (SRM)?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El uso exclusivo de la automatización para reducir la fatiga del piloto.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La coordinación entre el piloto al mando y el personal de tierra.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El arte y la ciencia de gestionar todos los recursos disponibles para un solo piloto para asegurar el éxito del vuelo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Un sistema de mantenimiento preventivo para aeronaves monoplaza.', FALSE);

-- Pregunta 7
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál de los siguientes conceptos NO forma parte de los componentes incluidos en SRM?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Gestión de Riesgos (RM).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Conciencia Situacional (SA).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Gestión de Automatización (AM).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mantenimiento de Estructuras (MS).', TRUE);

-- Pregunta 8
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En la instrucción de vuelo, ¿cuándo debe ser más efectiva la comunicación y la definición de roles en la cabina?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Durante la fase de crucero a alta altitud.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cuanto más cerca del suelo se encuentran el instructor y el alumno.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Durante la planificación del vuelo en tierra.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Únicamente cuando fallan los sistemas electrónicos de navegación.', FALSE);

-- Pregunta 9
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la característica principal de la actitud peligrosa "Anti-autoridad"?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Sentir la necesidad de hacer algo inmediatamente sin pensar.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Considerar que las reglas, reglamentos y procedimientos son tontos o innecesarios.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Creer que los accidentes les ocurren a los demás, pero nunca a uno mismo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Tratar de impresionar a los demás asumiendo riesgos innecesarios.', FALSE);

-- Pregunta 10
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué frase define mejor la actitud de "Impulsividad"?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '"No me digas qué hacer".', FALSE),
((SELECT MAX(id) FROM pregunta), '"Hazlo rápido".', TRUE),
((SELECT MAX(id) FROM pregunta), '"No va a pasar a mí".', FALSE),
((SELECT MAX(id) FROM pregunta), '"Yo puedo hacerlo".', FALSE);

-- Pregunta 11
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Un piloto que cree que los accidentes solo les ocurren a otros está demostrando una actitud de:', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Macho.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Resignación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Invulnerabilidad.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Anti-autoridad.', FALSE);

-- Pregunta 12
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué motiva a un piloto con la actitud peligrosa "Macho"?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El resentimiento hacia las normas establecidas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La falta de confianza en sus propias habilidades de vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El deseo de demostrar que es mejor que los demás para dar un espectáculo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La creencia de que el destino está fuera de su control.', FALSE);

-- Pregunta 13
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Un piloto que piensa "¿Qué puedo hacer?" ante una situación adversa y deja la acción a los demás refleja:', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Resignación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Impulsividad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Prudencia extrema.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Gestión de tareas efectiva.', FALSE);

-- Pregunta 14
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según el texto, ¿qué prerrogativa tiene un piloto frente a la autoridad?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Ignorar las reglas si el vuelo se retrasa.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cuestionar la autoridad si siente que está en un error.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Modificar los procedimientos de aterrizaje según su criterio personal.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Delegar su responsabilidad legal en el controlador de tráfico aéreo.', FALSE);

-- Pregunta 15
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué dos elementos evalúa la herramienta básica conocida como "Matriz de Riesgos"?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Velocidad del aire y consumo de combustible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Probabilidad de que ocurra un evento y la consecuencia de ese evento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Experiencia del piloto y complejidad de la aviónica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Altitud de vuelo y severidad de las turbulencias.', FALSE);

-- Pregunta 16
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según la Matriz de Riesgo, si la probabilidad es "Ocasional" y la severidad es "Catastrófica", el nivel de riesgo es:', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Low (Bajo).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Medium (Medio).', FALSE),
((SELECT MAX(id) FROM pregunta), 'High (Alto).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Serious (Serio).', TRUE);

-- Pregunta 17
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es una forma válida de mitigar el riesgo según el manual?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aumentar la velocidad para atravesar una zona de mal tiempo rápidamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Esperar a que el tiempo mejore a condiciones de reglas de vuelo visual (VFR).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Volar en condiciones IFR sin estar certificado si el GPS funciona correctamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ignorar las listas de verificación para reducir el estrés en cabina.', FALSE);

-- Pregunta 18
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En la lista de verificación IMSAFE, ¿qué representa la letra "M"?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Mantenimiento de la aeronave.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Medicación que pueda afectar el juicio o causar somnolencia.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Meteorología en el aeropuerto de destino.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Motivación para completar la misión de vuelo.', FALSE);

-- Pregunta 19
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuánto tiempo se menciona que incluso una pequeña cantidad de alcohol (una cerveza) puede afectar las habilidades de vuelo?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Solo durante la primera hora después de beber.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Antes de 8 o 24 horas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Únicamente si el piloto no ha comido lo suficiente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'No afecta si el vuelo se realiza por debajo de los 5,000 pies.', FALSE);

-- Pregunta 20
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Por qué la fatiga se considera uno de los peligros más insidiosos?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Porque es fácilmente detectable mediante los instrumentos de cabina.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porque puede no ser evidente para el piloto hasta que se cometen errores graves.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Porque solo afecta a pilotos que vuelan de noche.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Porque desaparece inmediatamente al aumentar la carga de trabajo.', FALSE);

-- Pregunta 21
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué es la Conciencia Situacional (SA)?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La capacidad de programar un plan de vuelo en el MFD.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La imagen mental de lo que está sucediendo y la percepción exacta de todos los factores de riesgo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El conocimiento técnico de la estructura alar del avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La comunicación constante con otros pilotos en la misma frecuencia.', FALSE);

-- Pregunta 22
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuáles son los cinco elementos fundamentales de riesgo sobre los que se debe mantener conciencia?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Combustible, Tiempo, Distancia, Altitud y Velocidad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Vuelo, Piloto, Avión, Meteorología y Tipo de operación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Radio, GPS, Transpondedor, Flaps y Tren de aterrizaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Instructor, Alumno, Escuela de vuelo, ATC y Aeropuerto.', FALSE);

-- Pregunta 23
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué factores pueden causar que un piloto se "fije" en un solo elemento, reduciendo su conciencia situacional global?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El uso de listas de verificación y el monitoreo de radio.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La fatiga, el estrés y la sobrecarga de trabajo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Una buena planificación previa y el descanso adecuado.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La actualización frecuente de las bases de datos de navegación.', FALSE);

-- Pregunta 24
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué efecto tiene una gestión eficaz de la carga de trabajo?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Elimina la necesidad de realizar listas de verificación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Garantiza la realización de operaciones esenciales mediante la planificación y priorización de tareas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Permite al piloto realizar maniobras acrobáticas en cualquier fase del vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aumenta la velocidad de procesamiento de datos del GPS.', FALSE);

-- Pregunta 25
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el primer efecto notable de una situación de sobrecarga de trabajo en un piloto?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El piloto toma decisiones más rápidas y precisas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El piloto puede trabajar más duro, pero lograr menos.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Se produce un aumento inmediato de la conciencia situacional.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El piloto delega automáticamente todas las tareas a la automatización.', FALSE);

-- Pregunta 26
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Ante una situación de saturación de tareas, ¿qué debe hacer el piloto?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Acelerar el ritmo de trabajo para despejar las tareas pendientes.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Detenerse, pensar, reducir la velocidad y priorizar.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Apagar la radio para evitar distracciones externas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Confiar en la suerte para que la situación se resuelva sola.', FALSE);

-- Pregunta 27
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué peligro presentan los MFD (pantallas multifunción) respecto a la navegación?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Consumen demasiada batería en aeronaves pequeñas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que los pilotos confíen únicamente en los mapas móviles para la navegación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Que no muestran información sobre el espacio aéreo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que requieren una conexión constante a internet para funcionar.', FALSE);

-- Pregunta 28
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según la Asociación Británica de Pilotos de Aerolíneas, ¿cuál es la preocupación respecto a la automatización?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Que los sistemas son demasiado caros para la aviación general.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que los pilotos carecen cada vez más de habilidades básicas de vuelo por la dependencia de la automatización.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Que los mapas electrónicos son menos precisos que los de papel.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que la automatización aumenta el consumo de combustible de forma innecesaria.', FALSE);

-- Pregunta 29
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El término "stick and rudder" se refiere a:', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El uso de sistemas de navegación satelital avanzados.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Las habilidades del piloto para utilizar los comandos manualmente.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El proceso de mantenimiento de la cola del avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La gestión de recursos entre la tripulación y el despacho de vuelos.', FALSE);

-- Pregunta 30
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué se identificó como un "efecto secundario imprevisto" de las cabinas automatizadas?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Una mejora absoluta en la comunicación con el ATC.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que la automatización, en ocasiones, generaba errores mucho mayores o complacencia.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La eliminación total de los accidentes durante el aterrizaje.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un aumento en la resistencia física de los pilotos.', FALSE);

-- Pregunta 31
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué se recomienda hacer respecto a los cálculos de planificación de vuelo, independientemente del método utilizado?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Ignorarlos si el GPS está encendido.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Comprobar y confirmar siempre los cálculos.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Utilizar únicamente los valores proporcionados por la base de datos sin cuestionar.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Delegarlos íntegramente en el instructor de vuelo.', FALSE);

-- Pregunta 32
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según el gráfico de carga de trabajo, ¿en qué fase suele haber un pico máximo de requerimiento de trabajo?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Pre-vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Crucero.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aproximación y aterrizaje.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Taxi.', FALSE);

-- Pregunta 33
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El "Margen de Seguridad" se define en el gráfico como la diferencia entre:', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El combustible disponible y el necesario.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Las capacidades del piloto y los requerimientos de trabajo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La velocidad de crucero y la velocidad de pérdida.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El tiempo de vuelo previsto y el real.', FALSE);

-- Pregunta 34
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué acción previa ayuda a reducir la carga de trabajo al acercarse al aeropuerto de destino?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Configurar las frecuencias de radio con suficiente antelación.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Esperar a estar en el patrón de tráfico para leer la carta de navegación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Desconectar el piloto automático para centrarse en la radio.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Solicitar al ATC que realice la navegación por el piloto.', FALSE);

-- Pregunta 35
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En la matriz de riesgo, un riesgo "Serious" (Serio) se produce cuando:', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La severidad es marginal y la probabilidad es improbable.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La severidad es crítica y la probabilidad es remota.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La severidad es despreciable y la probabilidad es probable.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La severidad es catastrófica y la probabilidad es improbable.', TRUE);

-- Pregunta 36
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué componente de la lista IMSAFE se refiere a problemas de dinero, salud o familia?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Medicación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Estrés.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Emoción/Comida.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Enfermedad.', FALSE);

-- Pregunta 37
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Un aprendizaje por "experiencia indirecta" en seguridad ocurre cuando:', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Un piloto sufre un incidente y aprende de él.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un ser querido se lesiona en un accidente por no seguir una norma.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Se estudia un manual técnico de aerodinámica.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se instalan cinturones de seguridad más modernos en el avión.', FALSE);

-- Pregunta 38
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('La ADM busca que el piloto determine el mejor curso de acción basado en:', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Intuiciones basadas en el instinto.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La información más reciente que tiene disponible.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Lo que otros pilotos han hecho en situaciones similares hace años.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Únicamente las instrucciones que recibe del controlador, sin evaluarlas.', FALSE);

-- Pregunta 39
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es un paso necesario para una buena toma de decisiones según el proceso de ADM?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Ignorar las actitudes personales para ser más objetivo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Identificar las actitudes personales peligrosas para la seguridad del vuelo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Delegar la evaluación de riesgos en el equipo de mantenimiento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Evitar el uso de recursos externos para no saturarse.', FALSE);

-- Pregunta 40
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué factor ha permanecido constante como causa de errores a pesar de los avances tecnológicos?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La calidad del combustible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El factor humano.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La precisión de los altímetros analógicos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La potencia de los motores de aviación general.', FALSE);

-- Pregunta 41
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el porcentaje de accidentes que ocurren durante el aterrizaje según el texto?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '2%', FALSE),
((SELECT MAX(id) FROM pregunta), '15.7%', FALSE),
((SELECT MAX(id) FROM pregunta), '23.4%', FALSE),
((SELECT MAX(id) FROM pregunta), '24.1%', TRUE);

-- Pregunta 42
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué habilidad permite al piloto prepararse para periodos de alta carga de trabajo?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La capacidad de volar a altas velocidades.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Reconocer las futuras necesidades de carga de trabajo durante momentos de baja carga.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El uso de sistemas de navegación inercial.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La memorización de todos los códigos de transpondedor.', FALSE);

-- Pregunta 43
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué puede causar una distracción que desvía la atención del piloto de los instrumentos?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Una falla total del motor.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un problema menor que comienza como algo insignificante.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El uso correcto de la lista de verificación IMSAFE.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una comunicación clara y concisa con el ATC.', FALSE);

-- Pregunta 44
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El entrenamiento en SRM ayuda al piloto a:', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aumentar la velocidad de crucero del avión.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mantener la conciencia de la situación y gestionar la automatización.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Eliminar la necesidad de contacto con el control de tráfico aéreo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Reducir el costo operativo por hora de vuelo.', FALSE);

-- Pregunta 45
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la definición de "Riesgo" en el contexto de la matriz de riesgos?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La cantidad de combustible remanente al final del vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La combinación de la probabilidad de un evento y su consecuencia.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El costo de las reparaciones tras un aterrizaje duro.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La posibilidad de que el instructor cancele la clase.', FALSE);

-- Pregunta 46
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En la lista IMSAFE, ¿qué se evalúa con la "E" final?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Experiencia y Entrenamiento.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Emoción y Comer (Eating).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Emergencia y Equipo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Electricidad y Electrónica.', FALSE);

-- Pregunta 47
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué sucede con las habilidades de vuelo manual si hay una excesiva dependencia de las computadoras?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Se fortalecen debido a la mayor disponibilidad de tiempo mental.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se deterioran.', TRUE),
((SELECT MAX(id) FROM pregunta), 'No se ven afectadas, ya que son habilidades instintivas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Se vuelven innecesarias en la aviación moderna.', FALSE);

-- Pregunta 48
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('El monitoreo de las comunicaciones por radio para el tráfico y el tiempo ayuda a:', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Reducir la vida útil de los equipos de comunicación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Desarrollar una imagen mental de lo que está sucediendo (Conciencia Situacional).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Cumplir únicamente con requisitos legales de la autoridad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Evitar tener que mirar los instrumentos de navegación.', FALSE);

-- Pregunta 49
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué debe hacer un piloto si se siente bajo presión psicológica del trabajo o tiene problemas financieros?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Volar para distraerse y reducir el estrés.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Evaluar su estado en la categoría de "Estrés" de la lista IMSAFE antes de volar.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Aumentar la automatización para compensar la falta de concentración.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Ignorar el problema, ya que el vuelo requiere atención total.', FALSE);

-- Pregunta 50
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué se recomienda sobre el uso de listas de verificación en fases de alta densidad de tráfico?', '9');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'No utilizarlas para poder mirar fuera de la cabina todo el tiempo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Completarlas con suficiente antelación para centrarse en el tráfico e instrucciones del ATC.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Realizarlas de memoria para ganar tiempo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Delegarlas en los pasajeros si es posible.', FALSE);

-- ============================================
-- FIN DE LOS INSERTS DEL CAPÍTULO 9
-- ============================================

