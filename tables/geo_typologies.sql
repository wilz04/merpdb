create table <?= DB_SCHEMA ?>.geo_typologies (
	_id int not null auto_increment comment 'Identificador',
	_description Varchar(32) not null comment 'Descripción',
	primary key (_id),
	unique (_description)
)
engine = InnoDB
comment = 'Tipologías';

insert into <?= DB_SCHEMA ?>.geo_typologies
(_id, _description) values
(1, 'Ciudad'),
(2, 'Centro'),
(3, 'Barrio'),
(4, 'Urbanización'),
(5, 'Residencial'),
(6, 'Condominio'),
(7, 'Precario'),
(8, 'Poblado'),
(9, 'Caserio'),
(10, 'Comunidad Indigena'),
(11, 'Asentamiento');

