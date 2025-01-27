
create table <?= DB_SCHEMA ?>.biz_skidevguides (
	_id int not null auto_increment comment 'Identificador',
	_level int not null comment 'Nivel educativo',
	primary key (_id)
)
engine = InnoDB
comment = 'Guías de desarrollo de competencias';

create table <?= DB_SCHEMA ?>.biz_skidevguidesbyschools (
	_skidevguide int not null comment 'Guía de desarrollo de competencias',
	_school int not null comment 'Centro educativo',
	_year Year not null comment 'Año',
	primary key (_skidevguide, _school),
	foreign key (_skidevguide) references <?= DB_SCHEMA ?>.biz_skidevguides(_id),
	foreign key (_school) references <?= DB_SCHEMA ?>.geo_schools(_id)
)
engine = InnoDB
comment = 'Guías de desarrollo de competencias por centros educativos';

create table <?= DB_SCHEMA ?>.biz_studyprograms (
	_id int not null auto_increment comment 'Identificador',
	_dual bit not null comment 'Modalidad dual',
	_sent bit not null comment 'Presentado ante el CSE',
	primary key (_id)
)
engine = InnoDB
comment = 'Programas de estudio';

create table <?= DB_SCHEMA ?>.biz_orgs (
	_id int not null auto_increment comment 'Identificador',
	primary key (_id)
)
engine = InnoDB
comment = 'Empresas';

create table <?= DB_SCHEMA ?>.biz_orgsbyschools (
	_org int not null comment 'Empresa',
	_school int not null comment 'Centro educativo',
	_dual bit not null comment 'Modalidad dual',
	_year Year not null comment 'Año',
	primary key (_org, _school),
	foreign key (_org) references <?= DB_SCHEMA ?>.biz_orgs(_id),
	foreign key (_school) references <?= DB_SCHEMA ?>.geo_schools(_id)
)
engine = InnoDB
comment = 'Empresas por centros educativos';

create table <?= DB_SCHEMA ?>.biz_areas (
	_id int not null auto_increment comment 'Identificador',
	_highlydemanded bit not null comment 'Alta demanda',
	primary key (_id)
)
engine = InnoDB
comment = 'Áreas';

create table <?= DB_SCHEMA ?>.biz_students (
	_id int not null auto_increment comment 'Identificador',
	_graduated bit not null comment 'Graduado de secundaria',
	primary key (_id)
)
engine = InnoDB
comment = 'Estudiantes';

create table <?= DB_SCHEMA ?>.biz_englishlevel (
	_id int not null comment 'Identificador',
	primary key (_id)
)
engine = InnoDB
comment = 'Niveles de Inglés';

insert into <?= DB_SCHEMA ?>.biz_englishlevel (_id) values (0x0A1), (0x0A2), (0x0B1), (0x0B2), (0x0C1), (0x0C2);

create table <?= DB_SCHEMA ?>.biz_studentsdetail (
	_student int not null auto_increment comment 'Estudiante',
	_area int not null comment 'Área',
	_oralenglish bit not null comment 'Evaluado en sus competencias orales en inglés',
	_level int not null comment 'Nivel educativo',
	_digitaldiagnostic bit not null comment 'Aplicación digital de las pruebas de diagnóstico',
	_digitaldsummative bit not null comment 'Aplicación digital de las pruebas sumativas',
	_leaded bit not null comment 'Recibe acompañamiento',
	_backpackaccess bit not null comment 'Acceso a la mochila digital',
	_diningroomaccess bit not null comment 'Beneficiario del Servicio de alimentación',
	_diningroom2ndaccess bit not null comment 'Beneficiario del Servicio de alimentación',
	_transportaccess bit not null comment 'Beneficiario del programa de Transporte Estudiantil',
	_disability bit not null comment 'Con dispacidad',
	_year Year not null comment 'Año',
	primary key (_student, _year),
	foreign key (_student) references <?= DB_SCHEMA ?>.biz_students(_id),
	foreign key (_area) references <?= DB_SCHEMA ?>.biz_areas(_id)
)
engine = InnoDB
comment = 'Detalle de estudiantes';

create table <?= DB_SCHEMA ?>.biz_teachers (
	_id int not null auto_increment comment 'Identificador',
	_hired Datetime not null comment 'Fecha de contratación',
	_property bit not null comment 'Con propiedad',
	_suitabilitytest bit not null comment 'Prueba de idoneidad',
	primary key (_id)
)
engine = InnoDB
comment = 'Docentes';

create table <?= DB_SCHEMA ?>.biz_teachersbyschools (
	_teacher int not null auto_increment comment 'Docente',
	_school int not null comment 'Centro educativo',
	_area int not null comment 'Área',
	_englishlevel int not null comment 'Nivel de Inglés',
	_toolkitaccess bit not null comment 'Acceso a la caja de herramientas',
	_year Year not null comment 'Año',
	primary key (_teacher, _year),
	foreign key (_teacher) references <?= DB_SCHEMA ?>.biz_teachers(_id),
	foreign key (_school) references <?= DB_SCHEMA ?>.geo_schools(_id),
	foreign key (_area) references <?= DB_SCHEMA ?>.biz_areas(_id),
	foreign key (_englishlevel) references <?= DB_SCHEMA ?>.biz_englishlevel(_id)
)
engine = InnoDB
comment = 'Docentes por centros educativos';

create table <?= DB_SCHEMA ?>.biz_educationalresourcetargets (
	_id int not null auto_increment comment 'Identificador',
	_description Varchar(32) not null comment 'Descripción',
	primary key (_id),
	unique key (_description)
)
engine = InnoDB
comment = 'Público meta';

insert into <?= DB_SCHEMA ?>.biz_educationalresourcetargets (_description) values ('Estudiantes'), ('Personal docente'), ('Personal administrativo');

create table <?= DB_SCHEMA ?>.biz_educationalresources (
	_id int not null auto_increment comment 'Identificador',
	_author int not null comment 'Docente',
	_target int not null comment 'Público meta',
	_preschoolservice bit not null comment 'Servicio preescolar',
	_childcareordevelopmentalt bit not null comment 'servicio en Alternativas de Cuidado y Desarrollo Infantil',
	_aboriginal bit not null comment 'Sobre la atención de estudiantes de pueblos indígenas',
	_digital bit not null comment 'Digital',
	_backpackavailability bit not null comment 'Disponible en la mochila digital',
	_toolkitavailability bit not null comment 'Disponible en la caja de herramientas',
	primary key (_id),
	foreign key (_author) references <?= DB_SCHEMA ?>.biz_teachers(_id),
	foreign key (_target) references <?= DB_SCHEMA ?>.biz_educationalresourcetargets(_id)
)
engine = InnoDB
comment = 'Recursos pedagógicos';

create table <?= DB_SCHEMA ?>.biz_complementarynotebooks (
	_id int not null auto_increment comment 'Identificador',
	_title Varchar(32) not null comment 'Título',
	_created Date null comment 'Fecha de elaboración',
	_updated Date null comment 'Fecha de actualización',
	primary key (_id)
)
engine = InnoDB
comment = 'Cuadernos complementarios';

insert into <?= DB_SCHEMA ?>.biz_complementarynotebooks (_title, _created) values ('#1', '2000-01-01'), ('#2', '2000-01-01'), ('#3', '2000-01-01');
insert into <?= DB_SCHEMA ?>.biz_complementarynotebooks (_title) values ('Discapacidad múltiple'), ('Discapacidad intelectual'), ('Audición y lenguaje'), ('Terapía del lenguaje'), ('Problemas de aprendizaje');

create table <?= DB_SCHEMA ?>.biz_vocationalroute (
	_stage int not null auto_increment comment 'Identificador',
	_implemented bit not null comment 'Implementada',
	primary key (_stage)
)
engine = InnoDB
comment = 'Ruta vocacional, etapas';

create table <?= DB_SCHEMA ?>.biz_selftrainingcourses (
	_id int not null auto_increment comment 'Identificador',
	_implemented bit not null comment 'Implementado',
	primary key (_id)
)
engine = InnoDB
comment = 'Cursos de autoformación';

create table <?= DB_SCHEMA ?>.biz_reareform (
	_document int not null auto_increment comment 'Identificador',
	primary key (_document)
)
engine = InnoDB
comment = 'Reforma integral al Reglamento de Evaluación de los Aprendizajes, documentos';

create table <?= DB_SCHEMA ?>.biz_guidelines (
	_id int not null auto_increment comment 'Identificador',
	primary key (_id)
)
engine = InnoDB
comment = 'Lineamientos técnicos referidos a las Pruebas comprensivas';

create table <?= DB_SCHEMA ?>.biz_advices (
	_id int not null auto_increment comment 'Identificador',
	_tochildcareofficials bit not null comment 'Brindada a funcionarios de atención de la niñez en Alternativas de Cuido y Desarrollo Infantil',
	primary key (_id)
)
engine = InnoDB
comment = 'Asesoramientos';

create table <?= DB_SCHEMA ?>.biz_accreditationprocedures (
	_id int not null auto_increment comment 'Identificador',
	_level int not null comment 'Nivel',
	primary key (_id)
)
engine = InnoDB
comment = 'Procedimientos de acreditación';

create table <?= DB_SCHEMA ?>.biz_accreditationprocedureversioning (
	_id int not null auto_increment comment 'Identificador',
	_accreditationprocedure int not null comment 'Procedimiento de acreditación',
	_version Varchar(32) not null comment 'Actualización',
	primary key (_id),
	unique key uk_accprocver_accrproc_ver (_accreditationprocedure, _version),
	foreign key (_accreditationprocedure) references <?= DB_SCHEMA ?>.biz_accreditationprocedures(_id)
)
engine = InnoDB
comment = 'Procedimientos de acreditación, actualizaciones';

create table <?= DB_SCHEMA ?>.biz_diningmenu (
	_id int not null auto_increment comment 'Identificador',
	_opening datetime not null comment 'Inicio',
	primary key (_id)
)
engine = InnoDB
comment = 'Menús de comedor';

create table <?= DB_SCHEMA ?>.biz_studenttransport (
	_id int not null auto_increment comment 'Identificador',
	_model datetime not null comment 'Modelo',
	primary key (_id)
)
engine = InnoDB
comment = 'Transporte de estudiantes';

create table <?= DB_SCHEMA ?>.biz_schoolsdetail (
	_id int not null auto_increment comment 'Identificador',
	_accredited bit not null comment 'Acreditado',
	_supervised bit not null comment 'Fiscalizado en el componente educativo y de cuidado integral en Alternativas de Cuidado y Desarrollo Infantil',
	_altenergy bit not null comment 'Energía alternativa',
	_orchard bit not null comment 'Con huerta estudiantil',
	_diningmenu int null comment 'Menú de comedor',
	_studenttransport int null comment 'Transporte estudiantil',
	_warning bit null comment 'Declaratoria de emergencia por eventos de desastres, reconstruídos',
	_earlywarningmoduleimplemented bit not null comment 'Utiliza el módulo de alerta temprana',
	_mepbuilding bit null comment 'Terreno/edificio del MEP',
	_aboriginal bit not null comment 'Con cosmovisión de centro indígena',
	primary key (_id),
	foreign key (_id) references <?= DB_SCHEMA ?>.geo_schools(_id),
	foreign key (_diningmenu) references <?= DB_SCHEMA ?>.biz_diningmenu(_id),
	foreign key (_studenttransport) references <?= DB_SCHEMA ?>.biz_studenttransport(_id)
)
engine = InnoDB
comment = 'Detalle de centros educativos';

create table <?= DB_SCHEMA ?>.biz_mappingsofneeds (
	_id int not null auto_increment comment 'Identificador',
	primary key (_id)
)
engine = InnoDB
comment = 'Mapeos realizados a la población con necesidades de cuidado integral';

create table <?= DB_SCHEMA ?>.biz_eventtypes (
	_id int not null auto_increment comment 'Identificador',
	_description Varchar(32) not null comment 'Descripción',
	primary key (_id),
	unique key (_description)
)
engine = InnoDB
comment = 'Tipos de evento';

insert into <?= DB_SCHEMA ?>.biz_eventtypes (_description) values ('Campaña de divulgación'), ('Congreso');

create table <?= DB_SCHEMA ?>.biz_eventsubjects (
	_id int not null auto_increment comment 'Identificador',
	_description Varchar(32) not null comment 'Descripción',
	primary key (_id),
	unique key (_description)
)
engine = InnoDB
comment = 'Temas de evento';

insert into <?= DB_SCHEMA ?>.biz_eventsubjects (_description) values ('Servicios de apoyo educativo'), ('Educación indígena'), ('CONAPE');

create table <?= DB_SCHEMA ?>.biz_events (
	_id int not null auto_increment comment 'Identificador',
	_type int not null comment 'Tipo de evento',
	_subject int not null comment 'Asunto',
	primary key (_id),
	foreign key (_type) references <?= DB_SCHEMA ?>.biz_eventtypes(_id),
	foreign key (_subject) references <?= DB_SCHEMA ?>.biz_eventsubjects(_id)
)
engine = InnoDB
comment = 'Eventos';

create table <?= DB_SCHEMA ?>.biz_projecttypes (
	_id int not null auto_increment comment 'Identificador',
	_description Varchar(32) not null comment 'Descripción',
	primary key (_id),
	unique key (_description)
)
engine = InnoDB
comment = 'Tipos de proyecto';

insert into <?= DB_SCHEMA ?>.biz_projecttypes (_description) values ('Plan de convivencia intercultural de los pueblos indígenas'), ('Infraestructural');

create table <?= DB_SCHEMA ?>.biz_projects (
	_id int not null auto_increment comment 'Identificador',
	_type int not null comment 'Tipo',
	_assisted bit not null comment 'Articulados y desarrollados con otras instancias',
	_singlefund bit not null comment 'Cuenta con recursos en Caja Única',
	_finished bit not null comment 'Desarrollado',
	primary key (_id),
	foreign key (_type) references <?= DB_SCHEMA ?>.biz_projecttypes(_id)
)
engine = InnoDB
comment = 'Proyectos';

create table <?= DB_SCHEMA ?>.biz_sanitaryorders (
	_id int not null auto_increment comment 'Identificador',
	_attended bit not null comment 'Atendida',
	primary key (_id)
)
engine = InnoDB
comment = 'Órdenes sanitarias';

