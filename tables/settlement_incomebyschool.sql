create table <?= DB_SCHEMA ?>.settlement_incomebyschool (
	_id int not null auto_increment comment 'Identificador',
	_budgetproject int not null comment 'Proyecto de presupuesto',
	
	_source int not null comment 'Fuente de ingreso',
	_c int null,
	_sc int null,
	_g int null,
	_sg int null,
	_p int null,
	_sp int null,
	_r int null,
	_sr int null,
	_f int null,

	_description Varchar(128) not null comment 'Descripción',
	_amount Decimal(16, 2) not null comment 'Monto',

	primary key (_id),
	foreign key (_budgetproject) references <?= DB_SCHEMA ?>.settlement_budgetprojects(_id),
	foreign key (_source) references <?= DB_SCHEMA ?>.settlement_incomesources(_id)
)
engine = InnoDB
comment = 'Ingreso del centro educativo';

