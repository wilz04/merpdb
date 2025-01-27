create table <?= DB_SCHEMA ?>.settlement_headings (
	_id int not null comment 'Identificador',
	_title Varchar(128) null comment 'Título',
	primary key (_id),
	unique (_title)
)
engine = InnoDB
comment = 'Partidas presupuestarias';

