-- ============================================
-- INSERCIÓN DE PREGUNTAS Y OPCIONES
-- Capítulo: 11 - Reglamentación Aeronáutica (Uruguay)
-- ============================================

-- Pregunta 1
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué organismo es el encargado de gestionar, administrar y dirigir la Aviación Civil Uruguaya como garante del sistema?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'La OACI.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La Dirección Nacional de Aviación Civil e Infraestructura Aeronáutica (DINACIA).', TRUE),
((SELECT MAX(id) FROM pregunta), 'El Ministerio de Defensa Nacional.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La Junta de Infracciones Aeronáuticas.', FALSE);

-- Pregunta 2
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el marco legal que establece específicamente las penas y multas en el ámbito aeronáutico uruguayo?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El Reglamento de Aviación Civil Uruguayo (RAU).', FALSE),
((SELECT MAX(id) FROM pregunta), 'La Publicación de Información Aeronáutica (AIP).', FALSE),
((SELECT MAX(id) FROM pregunta), 'El Código Aeronáutico (Decreto Ley 14.305).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Los Reglamentos de Aviación Latinoamericana (LAR).', FALSE);

-- Pregunta 3
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Según el Art. 10 del Código Aeronáutico, ¿en qué caso NO rige la obligación de partir o aterrizar en aeródromos habilitados?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'En vuelos de instrucción primaria.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En caso de fuerza mayor.', TRUE),
((SELECT MAX(id) FROM pregunta), 'En vuelos comerciales regulares con retraso.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cuando el piloto posea más de 500 horas de vuelo.', FALSE);

-- Pregunta 4
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Ante un aterrizaje de emergencia en un lugar no autorizado, ¿a quién debe comunicar el comandante la circunstancia de inmediato si no puede contactar a la autoridad aeronáutica?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Al propietario del predio.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A la oficina de plan de vuelo más cercana.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A las autoridades militares o policiales más cercanas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Al centro de control de área (ACC).', FALSE);

-- Pregunta 5
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué facultad posee el comandante de una aeronave respecto a la carga y combustible durante el vuelo en caso de necesidad de seguridad?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Puede vender el excedente en aeródromos privados.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Tiene derecho a arrojar mercancías, combustibles y equipajes indispensables para la seguridad.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Debe solicitar permiso por escrito a la DINACIA antes de cualquier deslastre.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Únicamente puede arrojar mercancías peligrosas con autorización del explotador.', FALSE);

-- Pregunta 6
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('De acuerdo con el Art. 202, ¿cuándo se comete un delito relacionado con el certificado de aeronavegabilidad?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Cuando se vuela con el certificado vencido por más de 10 días.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cuando se conduce una aeronave transcurridos seis meses desde el vencimiento de dicho certificado.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Siempre que el certificado no esté físicamente a bordo, aunque sea vigente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Solo si la aeronave sufre un accidente estructural.', FALSE);

-- Pregunta 7
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la consecuencia legal de efectuar vuelos arriesgados que pongan en peligro la vida o bienes de terceros sin autorización?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Suspensión preventiva de la licencia por 30 días.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Una multa que oscila entre 50 UR y 900 UR.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Inhabilitación permanente de por vida.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Trabajo comunitario en el aeródromo local.', FALSE);

-- Pregunta 8
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué pena se establece para quien atraviese la frontera por lugares distintos a los establecidos de forma clandestina o fraudulenta?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Multa de 1000 Unidades Reajustables.', FALSE),
((SELECT MAX(id) FROM pregunta), 'De seis a veinticuatro meses de prisión.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Decomiso inmediato de la aeronave.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Suspensión de la matrícula del avión.', FALSE);

-- Pregunta 9
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿A qué aeronaves NO se aplican los requisitos de la parte LAR 91?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Aeronaves de explotadores extranjeros.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Vehículos ultralivianos motorizados.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Aeronaves de trabajos aéreos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Helicópteros civiles nacionales.', FALSE);

-- Pregunta 10
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Respecto al uso de sustancias psicoactivas, el personal que cumple funciones críticas de seguridad operacional debe:', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Consumirlas solo fuera de las horas de servicio activo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Abstenerse de desempeñarlas mientras esté bajo su influencia.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Contar con una receta médica para cualquier estimulante.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Limitar su uso a sustancias que no produzcan somnolencia.', FALSE);

-- Pregunta 11
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En el espacio aéreo sobre altamar, ¿qué normas deben observar las aeronaves de matrícula nacional?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Las reglas de vuelo del Estado más cercano.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Las normas internacionales del Anexo 2 al Convenio sobre Aviación Civil.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Los reglamentos internos del explotador exclusivamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Las directivas de la DINACIA para vuelos domésticos.', FALSE);

-- Pregunta 12
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Quién tiene la autoridad decisiva en todo lo relacionado con la aeronave mientras esté al mando de la misma?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El despachante de vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El Piloto al Mando.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El controlador de tránsito aéreo de turno.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El Gerente de Operaciones de la empresa.', FALSE);

-- Pregunta 13
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Bajo el LAR 91.120, el piloto al mando es responsable de garantizar que no se inicie el vuelo si:', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'No se ha servido el catering a los pasajeros.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Algún miembro de la tripulación de vuelo se halla incapacitado por fatiga.', TRUE),
((SELECT MAX(id) FROM pregunta), 'La aeronave no ha sido lavada en las últimas 24 horas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El plan de vuelo no ha sido firmado por el dueño del avión.', FALSE);

-- Pregunta 14
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué información NO es obligatorio estudiar minuciosamente antes de un vuelo que salga de las inmediaciones de un aeródromo?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Informes y pronósticos meteorológicos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Cálculo de combustible necesario.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El menú de a bordo para los pasajeros.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Longitudes de pista de los aeródromos a ser utilizados.', FALSE);

-- Pregunta 15
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Bajo qué condiciones puede un piloto operar en una zona prohibida publicada en la AIP?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Si el vuelo es de carácter privado y diurno.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Si se ajusta a las condiciones de las restricciones o tiene permiso de la autoridad competente.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Si la aeronave tiene equipos de navegación satelital de última generación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Nunca, bajo ninguna circunstancia, está permitido el ingreso.', FALSE);

-- Pregunta 16
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cómo debe expresarse la posición vertical de una aeronave al atravesar la capa de transición durante el descenso?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'En niveles de vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'En altitudes.', TRUE),
((SELECT MAX(id) FROM pregunta), 'En altura sobre el terreno (AGL).', FALSE),
((SELECT MAX(id) FROM pregunta), 'En niveles de presión absoluta.', FALSE);

-- Pregunta 17
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Al volar al nivel de transición o por encima de este, ¿cuál debe ser el reglaje del altímetro?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El QNH de la estación más cercana.', FALSE),
((SELECT MAX(id) FROM pregunta), '1 013,2 hPa (29.92 pulg. Hg).', TRUE),
((SELECT MAX(id) FROM pregunta), 'El QFE del aeródromo de salida.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La elevación de la pista según el manual de vuelo.', FALSE);

-- Pregunta 18
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En una zona donde la altitud de transición es de 3000 pies y el QNH es de 980.0 hPa, ¿cuál es el nivel de transición según la tabla proporcionada?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'FL 040.', FALSE),
((SELECT MAX(id) FROM pregunta), 'FL 045.', FALSE),
((SELECT MAX(id) FROM pregunta), 'FL 050.', TRUE),
((SELECT MAX(id) FROM pregunta), 'FL 055.', FALSE);

-- Pregunta 19
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la altura mínima permitida para volar sobre aglomeraciones de edificios en ciudades para un vuelo VFR?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '150 m (500 ft) sobre el obstáculo más alto.', FALSE),
((SELECT MAX(id) FROM pregunta), '300 m (1 000 ft) sobre el obstáculo más alto dentro de un radio de 600 m.', TRUE),
((SELECT MAX(id) FROM pregunta), '450 m (1 500 ft) sobre el nivel medio del mar.', FALSE),
((SELECT MAX(id) FROM pregunta), '600 m (2 000 ft) sobre el nivel del suelo.', FALSE);

-- Pregunta 20
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿A partir de qué altura sobre el terreno los vuelos VFR deben nivelarse de acuerdo con la derrota magnética?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Por encima de 300 m (1 000 ft).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Por encima de 600 m (2 000 ft).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Por encima de 900 m (3 000 ft).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Solo por encima del FL 100.', FALSE);

-- Pregunta 21
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Para una derrota magnética de 090º, ¿cuál sería un nivel de vuelo VFR apropiado?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'FL 040.', FALSE),
((SELECT MAX(id) FROM pregunta), 'FL 045.', FALSE),
((SELECT MAX(id) FROM pregunta), 'FL 055.', TRUE),
((SELECT MAX(id) FROM pregunta), 'FL 060.', FALSE);

-- Pregunta 22
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el techo de nubes mínimo requerido para operar VFR en un aeródromo dentro de una zona de control sin autorización especial?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '300 m (1 000 ft).', FALSE),
((SELECT MAX(id) FROM pregunta), '450 m (1 500 ft).', FALSE),
((SELECT MAX(id) FROM pregunta), '600 m (2 000 ft).', TRUE),
((SELECT MAX(id) FROM pregunta), '900 m (3 000 ft).', FALSE);

-- Pregunta 23
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la visibilidad mínima en tierra para autorizar un vuelo VFR especial?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1 000 m.', FALSE),
((SELECT MAX(id) FROM pregunta), '1 500 m.', TRUE),
((SELECT MAX(id) FROM pregunta), '2 500 m.', FALSE),
((SELECT MAX(id) FROM pregunta), '5 km.', FALSE);

-- Pregunta 24
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Salvo autorización del ATC, ¿cuál es la velocidad máxima indicada para aeronaves por debajo de 10 000 pies?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '200 nudos.', FALSE),
((SELECT MAX(id) FROM pregunta), '250 nudos.', TRUE),
((SELECT MAX(id) FROM pregunta), '300 nudos.', FALSE),
((SELECT MAX(id) FROM pregunta), 'La velocidad de crucero máxima estructural (Vne).', FALSE);

-- Pregunta 25
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Cuando dos aeronaves se aproximan de frente y hay peligro de colisión, ¿qué maniobra deben realizar ambas?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Ascender inmediatamente.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Alterar su rumbo hacia la derecha.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Alterar su rumbo hacia la izquierda.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mantener rumbo y velocidad.', FALSE);

-- Pregunta 26
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En una convergencia a niveles iguales, ¿qué tipo de aeronave tiene prioridad sobre un aerodino propulsado mecánicamente?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Otro aerodino de mayor peso.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un dirigible.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Una aeronave en vuelo de instrucción.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un avión comercial en ruta.', FALSE);

-- Pregunta 27
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué ángulo define a una aeronave que "alcanza" a otra por detrás con respecto al plano de simetría de la delantera?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Menor de 45º.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Menor de 70º.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Exactamente 90º.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Mayor de 110º.', FALSE);

-- Pregunta 28
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Al aproximarse dos aerodinos a un aeródromo para aterrizar, ¿cuál tiene la prioridad de paso?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'El que vuele a mayor nivel.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El que esté más bajo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'El que tenga mayor velocidad de aproximación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'El que haya declarado primero su intención por radio.', FALSE);

-- Pregunta 29
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué periodo es obligatorio que las aeronaves en vuelo ostenten luces anticolisión y de navegación?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Únicamente cuando la visibilidad sea menor a 5 km.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Entre la puesta y la salida del sol.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Durante todo el vuelo, independientemente de la hora.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Solo cuando operen en espacio aéreo clase A.', FALSE);

-- Pregunta 30
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿De qué color deben ser las luces de iluminación de cabina de acuerdo con el manual?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Blancas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Azules.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Rojas.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Verdes.', FALSE);

-- Pregunta 31
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es un requisito esencial para realizar vuelos simulados por instrumentos?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Que el vuelo se realice en condiciones nocturnas.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que la aeronave esté provista de doble mando en funcionamiento.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Que el piloto al mando tenga al menos 1000 horas de vuelo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que se realice fuera de zonas de control terminal (TMA).', FALSE);

-- Pregunta 32
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Hacia qué lado se deben hacer los virajes en un circuito de tránsito de aeródromo a menos que se ordene lo contrario?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Hacia la derecha.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Hacia la izquierda.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Según la dirección del viento dominante.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Siempre a discreción del piloto al mando.', FALSE);

-- Pregunta 33
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Con cuánta antelación mínima debe presentarse un plan de vuelo para un servicio de control antes de la salida?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '30 minutos.', FALSE),
((SELECT MAX(id) FROM pregunta), '60 minutos.', FALSE),
((SELECT MAX(id) FROM pregunta), '90 minutos.', TRUE),
((SELECT MAX(id) FROM pregunta), '2 horas.', FALSE);

-- Pregunta 34
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En la casilla 8 del formulario de plan de vuelo OACI, ¿qué letra se utiliza si el vuelo es VFR y luego cambiará a IFR?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Y.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Z.', FALSE),
((SELECT MAX(id) FROM pregunta), 'V.', FALSE),
((SELECT MAX(id) FROM pregunta), 'I.', FALSE);

-- Pregunta 35
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En la categoría de estela turbulenta, la letra "M" (Medium) corresponde a aeronaves con un peso de:', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Menos de 7.000 kg.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Entre 7.000 kg y 136.000 kg.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Más de 136.000 kg.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Exactamente 5.700 kg.', FALSE);

-- Pregunta 36
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En un plan de vuelo, ¿qué significa el código "H" en la casilla 10 de equipo?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Que posee equipo VOR.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que posee equipo HF.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Que la aeronave es un helicóptero.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Que requiere tratamiento especial médico.', FALSE);

-- Pregunta 37
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es el código de transponder (SSR) que indica una falla en las comunicaciones?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '7500.', FALSE),
((SELECT MAX(id) FROM pregunta), '7600.', TRUE),
((SELECT MAX(id) FROM pregunta), '7700.', FALSE),
((SELECT MAX(id) FROM pregunta), '2000.', FALSE);

-- Pregunta 38
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Ante una falla de comunicaciones en vuelo VFR, ¿cuál es la acción recomendada después de poner el código correspondiente en el transponder?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Continuar el vuelo hasta el destino original a toda costa.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aterrizar en el aeródromo adecuado más próximo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Ascender a un nivel de vuelo IFR para mayor seguridad.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Realizar esperas sobre el aeródromo por 30 minutos.', FALSE);

-- Pregunta 39
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la frecuencia internacional de emergencia en VHF?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '118.1 MHz.', FALSE),
((SELECT MAX(id) FROM pregunta), '121.5 MHz.', TRUE),
((SELECT MAX(id) FROM pregunta), '123.45 MHz.', FALSE),
((SELECT MAX(id) FROM pregunta), '122.8 MHz.', FALSE);

-- Pregunta 40
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('En una identificación visual por interceptación (Fase I), ¿dónde debe situarse normalmente la aeronave interceptora?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'A la derecha (estribor) y ligeramente por debajo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'A la izquierda (babor), ligeramente por encima y por delante.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Directamente frente a la cabina para ser visible.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Por detrás y por debajo en el punto ciego.', FALSE);

-- Pregunta 41
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Si una aeronave interceptora alabea y enciende/apaga luces a intervalos irregulares, ¿qué significa para la aeronave interceptada?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Usted ha sido interceptado, sígame.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Prosiga su ruta original.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Aterrice de inmediato en el campo de abajo.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Su tren de aterrizaje parece tener una falla.', FALSE);

-- Pregunta 42
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la reserva de combustible final requerida para un vuelo VFR diurno?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '15 minutos.', FALSE),
((SELECT MAX(id) FROM pregunta), '30 minutos a altitud normal de crucero.', TRUE),
((SELECT MAX(id) FROM pregunta), '45 minutos a altitud normal de crucero.', FALSE),
((SELECT MAX(id) FROM pregunta), '60 minutos a potencia máxima.', FALSE);

-- Pregunta 43
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué equipo de supervivencia es obligatorio para aviones monomotores que vuelen sobre el agua a una distancia superior a la de planeo?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Una balsa salvavidas con suministros para 7 días.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un chaleco salvavidas para cada persona a bordo.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Un radiofaro multibanda de corto alcance.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Trajes de inmersión térmica para toda la tripulación.', FALSE);

-- Pregunta 44
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Un avión cuyo certificado de aeronavegabilidad se expidió después del 1 de julio de 2008 debe llevar obligatoriamente:', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Un ELT manual de flotación.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un ELT automático.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Dos transmisores ELT de 121.5 MHz.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Un sistema de seguimiento satelital comercial.', FALSE);

-- Pregunta 45
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿En qué fase del servicio de alerta se encuentra una aeronave que no ha llegado dentro de los 30 minutos de la hora prevista de arribo?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Fase de Incertidumbre (INCERFA).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Fase de Alerta (ALERFA).', TRUE),
((SELECT MAX(id) FROM pregunta), 'Fase de Peligro (DETRESFA).', FALSE),
((SELECT MAX(id) FROM pregunta), 'Fase de Rescate (SARFA).', FALSE);

-- Pregunta 46
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la separación vertical mínima por encima de 29.000 pies (FL 290)?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '1000 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), '2000 pies.', TRUE),
((SELECT MAX(id) FROM pregunta), '3000 pies.', FALSE),
((SELECT MAX(id) FROM pregunta), '500 pies.', FALSE);

-- Pregunta 47
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la edad mínima para optar por una licencia de alumno piloto de avión?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '15 años.', FALSE),
((SELECT MAX(id) FROM pregunta), '16 años.', TRUE),
((SELECT MAX(id) FROM pregunta), '17 años.', FALSE),
((SELECT MAX(id) FROM pregunta), '18 años.', FALSE);

-- Pregunta 48
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('Para mantener la experiencia reciente, un piloto debe haber realizado 3 despegues y aterrizajes dentro de los últimos:', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '30 días.', FALSE),
((SELECT MAX(id) FROM pregunta), '60 días.', FALSE),
((SELECT MAX(id) FROM pregunta), '90 días.', TRUE),
((SELECT MAX(id) FROM pregunta), '120 días.', FALSE);

-- Pregunta 49
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Qué clase de certificado médico es el mínimo requerido para una licencia de Piloto Comercial?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), 'Clase 1.', TRUE),
((SELECT MAX(id) FROM pregunta), 'Clase 2.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Clase 3.', FALSE),
((SELECT MAX(id) FROM pregunta), 'Clase 4.', FALSE);

-- Pregunta 50
INSERT INTO pregunta (enunciado, capitulo) VALUES 
('¿Cuál es la validez de un certificado médico Clase 1 para un piloto menor de 40 años?', '11');
INSERT INTO opcion (pregunta_id, texto, es_correcta) VALUES 
((SELECT MAX(id) FROM pregunta), '6 meses.', FALSE),
((SELECT MAX(id) FROM pregunta), '12 meses.', TRUE),
((SELECT MAX(id) FROM pregunta), '24 meses.', FALSE),
((SELECT MAX(id) FROM pregunta), '36 meses.', FALSE);

-- ============================================
-- FIN DE LOS INSERTS DEL CAPÍTULO 11
-- ============================================

