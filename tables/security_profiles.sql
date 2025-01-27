create table <?= DB_SCHEMA ?>.security_profiles (
	_id int not null auto_increment comment 'Identificador',
	_name varchar(64) not null comment 'Nombre',
	_reserved bit not null default 0 comment 'Reservado para el personal',
	primary key (_id),
	unique key uk_profiles_name(_name)
)
engine = InnoDB
comment = '';

insert into <?= DB_SCHEMA ?>.security_profiles (_id, _name, _reserved) values
(1, 'Dirección de Planificación', 1),
(2, 'Direcciones Generales o Departamentos del Ministerio de Educación', 1),
(3, 'Centros Educativos (desde todas sus ofertas educativas)', 1),
(4, 'Equipo técnico', 1),
(5, 'Consultores', 1),
(6, 'Usuarios u organismos externos', 0),
(7, 'Funcionarios de control y evaluación', 1),
(8, 'Personal de apoyo educativo', 1),
(9, 'Personal de gestión financiera', 1),
(10, 'Medios de comunicación', 0),
(11, 'Estudiantes', 0),
(12, 'Proveedores de servicios educativos', 0),
(13, 'Padre, madre o encargado legal', 0),
(14, 'Personal de capacitación y desarrollo profesional', 1);

