create table <?= DB_SCHEMA ?>.geo_zones (
	_id int not null comment 'Identificador',
	_description Varchar(32) not null comment 'Descripción',
	primary key (_id),
	unique (_description)
)
engine = InnoDB
comment = 'Zonas';

insert into <?= DB_SCHEMA ?>.geo_zones
(_id, _description) values
(1, 'Urbano'),
(2, 'Predominantemente Urbano'),
(3, 'Rural'),
(4, 'Predominantemente Rural');
-- ('URB', 'Urbano'),
-- ('RUR', 'Rural');

