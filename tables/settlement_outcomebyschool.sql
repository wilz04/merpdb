create table <?= DB_SCHEMA ?>.settlement_outcomebyschool (
	_id int not null auto_increment comment 'Identificador',
	_budgetproject int not null comment 'Proyecto de presupuesto',
	
	_p int null,
	_g int null,
	_sp int null,

	_description Varchar(128) not null comment 'Descripción',
	_amount Decimal(16, 2) not null comment 'Monto',

	primary key (_id),
	foreign key (_budgetproject) references <?= DB_SCHEMA ?>.settlement_budgetprojects(_id),
	foreign key (_sp) references <?= DB_SCHEMA ?>.settlement_subheadings(_id)
)
engine = InnoDB
comment = 'Egreso del centro educativo';

