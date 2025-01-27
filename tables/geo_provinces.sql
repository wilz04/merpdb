create table <?= DB_SCHEMA ?>.geo_provinces (
	_id int not null comment 'Identificador',
	_name Varchar(32) not null comment 'Nombre',
	_area Decimal(8, 2) not null comment 'Área (km2)',
	primary key (_id),
	unique (_name)
)
engine = InnoDB
comment = 'Provincias, catálogo 160103';

insert into <?= DB_SCHEMA ?>.geo_provinces (_id, _name, _area) values
(1, 'San José', '4969.73'),
(2, 'Alajuela', '9772.27'),
(3, 'Cartago', '3093.23'),
(4, 'Heredia', '2663.46'),
(5, 'Guanacaste', '10196.32'),
(6, 'Puntarenas', '11298.51'),
(7, 'Limón', '9176.96');

