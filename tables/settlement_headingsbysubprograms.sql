create table <?= DB_SCHEMA ?>.settlement_headingsbysubprograms (
	_id int not null comment 'Identificador',
	_heading int not null comment 'Partida presupuestaria',
	_subprogram int not null comment 'Subprograma presupuestario',
	primary key (_id),
	unique key uk_headingsbysubprograms_heading_subprogram (_heading, _subprogram),
	foreign key (_heading) references <?= DB_SCHEMA ?>.settlement_headings(_id),
	foreign key (_subprogram) references <?= DB_SCHEMA ?>.settlement_subprograms(_id)
)
engine = InnoDB
comment = 'Subpartidas por actividad';

