create table <?= DB_SCHEMA ?>.geo_dependences (
	_id Varchar(4) not null comment 'Identificador',
	_description Varchar(32) not null comment 'Descripción',
	primary key (_id),
	unique (_description)
)
engine = InnoDB
comment = 'Dependencia';

insert into <?= DB_SCHEMA ?>.geo_dependences
(_id, _description) values
('PUB', 'Público'),
('PRI', 'Privado'),
('SUB', 'Subvencionado');

