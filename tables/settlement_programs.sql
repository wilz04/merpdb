create table <?= DB_SCHEMA ?>.settlement_programs (
	_id int not null comment 'Identificador',
	_title Varchar(128) not null comment 'Título',
	_owner int not null comment 'Nombre del jefe',
	_subprogram int not null comment 'Subprograma presupuestario',
	primary key (_id),
	unique (_title),
	foreign key (_subprogram) references <?= DB_SCHEMA ?>.settlement_subprograms(_id)
)
engine = InnoDB
comment = 'Programas presupuestarios';

