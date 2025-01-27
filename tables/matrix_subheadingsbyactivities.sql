create table <?= DB_SCHEMA ?>.matrix_subheadingsbyactivities (
	_id int not null comment 'Identificador',
	_subheading int not null comment 'Subpartida presupuestaria',
	_activity int not null comment 'Actividad',
	primary key (_id),
	unique key uk_subheadingsbyactivities_subheading_activity (_subheading, _activity),
	foreign key (_subheading) references <?= DB_SCHEMA ?>.settlement_subheadings(_id) -- ,
	-- foreign key (_activity) references <?= DB_SCHEMA ?>.matrix_activities(_id)
)
engine = InnoDB
comment = 'Subpartidas por actividad';

