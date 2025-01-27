create table <?= DB_SCHEMA ?>.pat_milestones (
	_id int not null comment 'Identificador',
	_name Varchar(64) not null comment 'Nombre',
	_description Varchar(512) null comment 'Descripción',
	_matrixmilestone int not null comment 'Resultado',
	primary key (_id),
	unique key uk_milestones_goals_name (_name, _matrixmilestone) -- ,
	-- foreign key (_matrixmilestone) references <?= DB_SCHEMA ?>.matrix_milestones(_id)
)
engine = InnoDB
comment = 'Resultados PAT';

