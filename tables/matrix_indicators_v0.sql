create table <?= DB_SCHEMA ?>.matrix_indicators (
	_id int not null auto_increment comment 'Identificador',
	_description Varchar(512) not null comment 'Descripción',
	_firstyear Year null comment 'Año base',
	_firstvalue Decimal(8, 4) null comment 'Línea base',
	primary key (_id),
	unique key (_description)
)
engine = InnoDB
comment = 'Indicadores';

insert into <?= DB_SCHEMA ?>.matrix_indicators (_id, _description, _firstyear, _firstvalue) values
(1, 'Cantidad de Guías elaboradas para el desarrollo de competencias según el nivel educativo.', 2022, '0.0000'),
(2, 'Porcentaje de Centros Educativos aplicando las Guías de desarrollo de competencias.', 2022, '0.0000'),
(3, 'Porcentaje de avance en la propuesta de actualización de los programas de estudios orientándolos al desarrollo de competencias.', 2022, '0.0000'),
(4, 'Porcentaje de la oferta formativa implementada.', 2022, '0.0000'),
(5, 'Porcentaje de actualización del Reglamento de Evaluación de los Aprendizajes (REA).', 2022, '0.0000'),
(6, 'Porcentaje de avance de la implementación de la ruta de lectura.', 2022, '0.0000'),
(7, 'Cantidad de programas de estudio elaborados y presentados ante el CSE.', 2022, '0.0000'),
(8, 'Cantidad de estudiantes evaluados en sus competencias orales en inglés.', 2022, '0.0000'),
(9, 'Cantidad de empresas participantes implementando CTP modalidad dual.', 2022, '0.0000'),
(10, 'Cantidad de Programas de estudio modalidad dual elaborados y presentado al CSE.', NULL, NULL),
(11, 'Cantidad de docentes certificados en áreas de mayor demanda laboral.', NULL, NULL),
(12, 'Cantidad de estudiantes certificados en áreas de mayor demanda laboral.', NULL, NULL),
(13, 'Cantidad de centros educativos que cuentan con docentes de inglés en C1 (Preescolar).', 2022, '19.9000'),
(14, 'Cantidad de centros educativos que cuentan con docentes de inglés en C1 (Primaria).', 2022, '90.0000'),
(15, 'Cantidad de recursos pedagógicos elaborados.', 2022, '0.0000'),
(16, 'DDC - Cantidad de documentos actualizados.', NULL, NULL), --
(17, 'Cantidad de campañas de divulgación sobre los documentos elaborados.', NULL, NULL),
(18, 'Cantidad de cuadernos complementarios actualizados.', NULL, NULL),
(19, 'Cantidad de cuadernos complementarios elaborados.', NULL, NULL),
(20, 'Cantidad de estrategias de divulgación de cuadernos complementarios.', NULL, NULL),
(21, 'Porcentaje de avance del modelo pedagógico para centros de educación especial.', 2023, '100.0000'),
(22, 'Porcentaje de avance de la implementación de la Estrategia.', 2022, '0.0000'),
(23, 'Cantidad de etapas implementadas de la ruta vocacional.', 2022, '0.0000'),
(24, 'Porcentaje de estudiantes que aplican las pruebas diagnósticas en forma digital.', 2023, '0.0000'),
(25, 'Porcentaje de estudiantes que aplican las pruebas sumativas en forma digital.', 2023, '0.0000'),
(26, 'Cantidad de cursos diseñados.', 2022, '1.0000'),
(27, 'Cantidad de cursos implementados.', NULL, NULL),
(28, 'Porcentaje de avance para la implementación del Bachillerato para la Empleabilidad.', NULL, NULL),
(29, 'Porcentaje de avance en la implementación del Sistema de Acreditación de Calidad Educativa.', 2022, '0.0000'),
(30, 'Cantidad de documentos.', 2022, '0.0000'),
(31, 'Cantidad de lineamientos técnicos referidos a las Pruebas comprensivas.', 2022, '0.0000'),
(32, 'Porcentaje de estudiantes que se les aplica las acciones de acompañamiento.', NULL, NULL),
(33, 'Cantidad de asesoramientos realizados.', 2022, '1.0000'),
(34, 'Porcentaje de avance en la implementación del Sistema de Evaluación Ágil (SEA).', NULL, NULL),
(35, 'Porcentaje de recursos digitales y aceleradores disponibles en la mochila digital.', NULL, NULL),
(36, 'Cantidad de estudiantes beneficiados con el acceso a la \"Mochila Digital\"', NULL, NULL),
(37, 'Porcentaje de recursos digitales y aceleradores disponibles en la caja de herramientas.', NULL, NULL),
(38, 'Cantidad de docentes que acceden a la Caja de Herramientas\".2023.', NULL, NULL),
(39, 'Cantidad de asesorías brindadas a las personas funcionarias de la atención de la niñez en Alternativas de Cuido y Desarrollo Infantil.', 2022, '2.0000'),
(40, 'Porcentaje de población estudiantil registrada digitalmente.', 2022, '100.0000'),
(41, 'Porcentaje de Centros Educativos acreditados registrados.', 2022, '100.0000'),
(42, 'Cantidad de mapeos realizados a la población con necesidades de cuidado integral.', 2023, '0.0000'),
(43, 'Porcentaje de servicios existentes de Educación Preescolar en Alternativas de Cuidado y Desarrollo Infantil.', 2022, '100.0000'),
(44, 'Cantidad de actualizaciones de los procedimientos de acreditación para que se brinde el servicio educativo en el nivel de Educación Preescolar.', 2022, '2.0000'),
(45, 'Cantidad de centros educativos públicos y privados fiscalizados en el componente educativo y de cuidado integral en Alternativas de Cuidado y Desarrollo Infantil.', 2022, '0.0000'),
(46, 'Porcentaje de avance en la actualización del subsistema de Educación Indígena.', NULL, NULL),
(47, 'Porcentaje de avance en la elaboración de los programas de estudio del subsistema de Educación Indígena.', 2022, '0.0000'),
(48, 'Cantidad de recursos pedagógicos para concientizar al personal docente para la atención de estudiantes de pueblos indígenas elaborados.', 2023, '0.0000'),
(49, 'Cantidad de recursos para concientizar al personal administrativo del MEP para la atención de estudiantes de pueblos indígenas.', NULL, NULL),
(50, 'Cantidad de congresos nacionales para visibilizar la educación indígena y los saberes propios de los pueblos originarios, realizados.', NULL, NULL),
(51, 'Cantidad de planes de convivencia intercultural (de Buen Vivir) de los pueblos indígenas para el fortalecimiento de la pertinencia cultural, desarrollados.', 0000, NULL),
(52, 'Porcentaje de avance en la conectividad optima de centros educativos.', NULL, NULL),
(53, 'Cantidad de CE con energía alternativa.', 2022, '0.0000'),
(54, 'Cantidad de nuevos beneficiarios del Servicio de alimentación en prescolar y primaria.', 2022, '0.0000'),
(55, 'Cantidad de estudiantes, beneficiarias del servicio de alimentación en el comedor estudiantil, de preescolar y primaria, ubicados en zonas de bajo y muy bajo IDS, con un segundo tiempo de alimentación aprobado.', 2022, '0.0000'),
(56, 'Cantidad de Centros Educativos con huerta estudiantil implementada.', 2022, '0.0000'),
(57, 'Cantidad de Centros Educativos en territorios indígenas con el nuevo menú implementado.', 2022, '0.0000'),
(58, 'Porcentaje de avance en el desarrollo del Reglamento.', 2022, '0.0000'),
(59, 'Cantidad de nuevos estudiantes beneficiarios en situación de discapacidad que ingresan al programa.', 2022, '0.0000'),
(60, 'Porcentaje de centros educativos que implementan el nuevo modelo de contratación regional para el servicio transporte estudiantil.', 2022, '0.0000'),
(61, 'Cantidad de Centros Educativos con declaratoria de emergencia por eventos de desastres, reconstruidos.', 2022, '0.0000'),
(62, 'Cantidad de Centros Educativos con resolución de riesgos inminentes para la vida humana, reconstruidos.', 2022, '0.0000'),
(63, 'Cantidad de terrenos o edificaciones inscritos a nombre del MEP.', 2022, '0.0000'),
(64, 'Cantidad de Centros Educativos con cosmovisión de centros indígenas, construidos.', 2022, '0.0000'),
(65, 'Cantidad de proyectos que cuentan con recursos en Caja Única, analizados.', 2022, '1477.0000'),
(66, 'Cantidad de órdenes sanitarias atendidas.', 2022, '0.0000'),
(67, 'Porcentaje de avance de la construcción y oficialización del documento marco del perfil idóneo para la docencia en el Ministerio de Educación Pública.', NULL, NULL),
(68, 'Porcentaje de avance en la confección de las pruebas de idoneidad a los nuevos docentes que se contraten en propiedad.', NULL, NULL),
(69, 'Porcentaje de nuevos docentes contratados en propiedad aplicando la prueba de idoneidad.', NULL, NULL),
(70, 'Porcentaje de avance de la oferta formativa implementada.', NULL, NULL),
(75, 'Porcentaje de avance en la elaboración del proyecto de ley que permita el traslado de personal docente por arraigo.', NULL, NULL),
(76, 'Porcentaje de avance en el diseño de las pruebas de idoneidad elaborados.', NULL, NULL),
(77, 'Porcentaje de avance en la implementación del nuevo modelo de evaluación del desempeño.', 2023, '10.0000'),
(78, 'Porcentaje de población usuaria de la plataforma tecnológica.', NULL, NULL),
(79, 'Porcentaje de avance en la implementación de la estrategia.', NULL, NULL),
(80, 'Cantidad de proyectos articulados y desarrollados con otras instancias.', 2023, '0.0000'),
(81, 'Porcentaje de avance de la estrategia.', NULL, NULL),
(82, 'Porcentaje de avance de la estrategia de articulación implementada.', NULL, NULL),
(83, 'Cantidad de campañas de divulgación para dar a conocer las diferentes líneas de crédito habilitadas por CONAPE para docentes y estudiantes en idiomas y áreas técnicas de las ciencias.', NULL, NULL),
(84, 'Porcentaje de avance de la creación del reglamento conducta.', 2022, '0.0000'),
(85, 'Porcentaje de avance en el cumplimiento de estrategia y lineamientos para la mejora de la formulación presupuestaria.', NULL, NULL),
(86, 'Porcentaje de avance en la elaboración del inventario de centros (Infraestructura).', NULL, NULL),
(87, 'Porcentaje de avance en la implementación del modelo de gestión por resultados.', NULL, NULL),
(88, 'Porcentaje de avance en la implementación del Reglamento de Educación Privada.', NULL, NULL),
(89, 'Porcentaje de avance en la elaboración del reglamento para la acreditación, supervisión, socialización, inspección y control de los centros educativos privados.', NULL, NULL),
(90, 'Cantidad de centros educativos que utilizan en módulo de alerta temprana.', NULL, NULL),
(91, 'Porcentaje de avance en la creación de una ventanilla.', 2022, '0.0000'),

(92, 'DRE - Porcentaje de acompañamientos realizados a docentes de servicios de apoyo en relación con las líneas de acción (meta 100% por año de solicitudes atendidas).', 2022, '1.0000'), -- 16
(93, 'DRE - Porcentaje de acompañamientos realizados a docentes de servicios de apoyo en relación con las líneas de acción (meta 100% por año de solicitudes atendidas) (2).', 2022, '1.0000'), -- 17
(94, 'DRE - Porcentaje de acompañamientos realizados a docentes de servicios de apoyo en relación con las líneas de acción (meta 100% por año de solicitudes atendidas) (3).', 2022, '3.0000'), -- 18
(95, 'DRE - Porcentaje de acompañamientos realizados a docentes de servicios de apoyo en relación con las líneas de acción (meta 100% por año de solicitudes atendidas) (4).', 2022, '0.0000'), -- 19
(96, 'DRE - Porcentaje de acompañamientos realizados a docentes de servicios de apoyo en relación con las líneas de acción (meta 100% por año de solicitudes atendidas) (5).', 2022, '0.0000'); -- 20

