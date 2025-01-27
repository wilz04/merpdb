create table <?= DB_SCHEMA ?>.matrix_goals (
	_id int not null auto_increment comment 'Identificador (Propósito - eje competencia)',
	-- _axis Varchar(64) not null comment 'Propósito - eje competencia',
	_description Varchar(512) not null comment 'Descripción',
	primary key (_id),
	unique (_description)
)
engine = InnoDB
comment = 'Objetivos';

insert into <?= DB_SCHEMA ?>.matrix_goals (_id, _description) values
(2, 'Mejorar el ambiente educativo mediante adecuación de la infraestructura, acceso a la conectividad, recursos didácticos y apoyos sociales que promuevan la igualdad de género e inclusión social.'),
(3, 'Mejorar la gestión educativa de los Centros Educativos, las Direcciones Regionales de Educación y la Administración central del MEP, mediante la reorganización, la automatización de procesos los controles y alianzas estratégicas.'),
(1, 'Mejorar las competencias en las personas estudiantes mediante ofertas educativas con currículo pertinente, mediación pedagógica, docentes capacitados, y evaluación continua.');

