create table <?= DB_SCHEMA ?>.settlement_incomesources (
	_id int not null auto_increment comment 'Identificador',
	_description Varchar(32) not null comment 'Descripción',
	primary key (_id)
)
engine = InnoDB
comment = 'Fuentes de ingreso';

insert into <?= DB_SCHEMA ?>.settlement_incomesources (_description) values ('Ingresos corrientes'), ('Ingreso de capital'), ('Financiamiento');

