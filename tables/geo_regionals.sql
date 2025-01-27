create table <?= DB_SCHEMA ?>.geo_regionals (
	_id int not null auto_increment comment 'Identificador',
	_name Varchar(32) not null comment 'Dirección regional',
	primary key (_id),
	unique (_name)
)
engine = InnoDB
comment = 'Regionales';

insert into <?= DB_SCHEMA ?>.geo_regionals (_id, _name) values
(1, 'SAN JOSE CENTRAL'),
(2, 'SAN JOSE NORTE'),
(3, 'SAN JOSE OESTE'),
(4, 'DESAMPARADOS'),
(5, 'PURISCAL'),
(6, 'ALAJUELA'),
(7, 'OCCIDENTE'),
(8, 'SAN CARLOS'),
(9, 'CARTAGO'),
(10, 'TURRIALBA'),
(11, 'HEREDIA'),
(12, 'LIBERIA'),
(13, 'NICOYA'),
(14, 'SANTA CRUZ'),
(15, 'CAÑAS'),
(16, 'PUNTARENAS'),
(17, 'AGUIRRE'),
(18, 'LIMON'),
(19, 'GUAPILES'),
(20, 'PEREZ ZELEDON'),
(21, 'LOS SANTOS'),
(22, 'ZONA NORTE-NORTE'),
(23, 'SARAPIQUI'),
(24, 'COTO'),
(25, 'GRANDE DE TERRABA'),
(26, 'PENINSULAR'),
(27, 'SULA');

