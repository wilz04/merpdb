create table <?= DB_SCHEMA ?>.settlement_accounting (
	_id int not null comment 'Identificador',
	_year Year not null comment 'Año',
	_subheading int not null comment 'Subpartida presupuestaria',

	_initialbudget Decimal(16, 2) not null comment 'Presupuesto inicial',
	_currentbudget Decimal(16, 2) not null comment 'Presupuesto actual',
	_underexecution Decimal(16, 2) not null comment 'Subejecución oficializada por los programas presupuestarios',
	_h002 Decimal(16, 2) not null comment 'Traslado de partidas compromisos no devengados (h-002)',
	_required Decimal(16, 2) not null comment 'Solicitado',
	_engaged Decimal(16, 2) not null comment 'Comprometido',
	_receivcommodity Decimal(16, 2) not null comment 'Recep. mercancia',
	_accrued Decimal(16, 2) not null comment 'Devengado',
	_paid Decimal(16, 2) not null comment 'Pagado',
	_availreleased Decimal(16, 2) not null comment 'Disponible liberado',
	_locked Decimal(16, 2) not null comment 'Monto bloqueado',

	primary key (_id),
	unique key uk_accounting_year_subheading (_year, _subheading),
	foreign key (_subheading) references <?= DB_SCHEMA ?>.settlement_subheadings(_id)
)
engine = InnoDB
comment = 'Subpartidas presupuestarias (montos) por año';

