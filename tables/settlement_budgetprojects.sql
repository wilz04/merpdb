create table <?= DB_SCHEMA ?>.settlement_budgetprojects (
	_id int not null auto_increment comment 'Identificador',
	_school int not null comment 'Centro educativo',
	_until Date not null comment 'Hasta',
	_sessionid Varchar(16) null comment 'Número de la sesión en la que el proyecto de presupuesto fue aprobado',
	_sessiondate Varchar(16) null comment 'Fecha de la sesión en la que el proyecto de presupuesto fue aprobado',
	_minutes Varchar(16) null comment 'Acta, constancia',
	_article Varchar(16) null comment 'Artículo, constancia',
	primary key (_id),
	foreign key (_school) references <?= DB_SCHEMA ?>.geo_schools(_id)
)
engine = InnoDB
comment = 'Proyectos de presupuesto del centro educativo';

