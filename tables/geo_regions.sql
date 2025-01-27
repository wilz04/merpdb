create table <?= DB_SCHEMA ?>.geo_regions (
	_id int not null auto_increment comment 'Identificador',
	_name Varchar(32) not null comment 'Nombre',
	primary key (_id),
	unique (_name)
)
engine = InnoDB
comment = 'Regiones';

insert into <?= DB_SCHEMA ?>.geo_regions (_id, _name) values
(1, 'Región Central'),
(2, 'Región Chorotega'),
(3, 'Región Pacífico Central'),
(4, 'Región Brunca'),
(5, 'Región Huetar Caribe'),
(6, 'Región Huetar Norte');

