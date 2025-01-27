create table <?= DB_SCHEMA ?>.geo_enrollmentmodes (
	_id Varchar(8) not null comment 'Identificador',
	_description Varchar(64) not null comment 'Descripción',
	primary key (_id),
	unique (_description)
)
engine = InnoDB
comment = 'Modalidad';

insert into <?= DB_SCHEMA ?>.geo_enrollmentmodes
(_id, _description) values
('AD', 'Atención Directa'),
('AE', 'Aula Edad'),
('BI', 'Bachillerato Internacional'),
('CL', 'Cursos Libres'),
('PR', 'I y II Ciclos'),
('SE', 'De 7mo a 12vo año'),
('EC', 'Educación Convencional'),
('EE', 'Educación Emergente'),
('RC', 'Red de Cuido'),
('PN', 'Plan Nacional'),
('PE', 'Preescolar'),
('PEA', 'Proyecto de Educación Abierta'),

('CNVMTS', 'Colegio Nacional Virtual Marco Tulio Salazar'),
('CEE', 'Centros de Educación Especial'),
('CAIPAD', 'Centros de Atención Integral Para Adultos con Discapacidad'),
('EN', 'Escuela Nocturna'),
('CONED', 'Colegio Nacional de Educación a Distancia');

