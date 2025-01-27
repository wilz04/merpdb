create table <?= DB_SCHEMA ?>.settlement_subheadings (
	_id int not null comment 'Identificador',
	_description Varchar(512) null comment 'Descripción',
	_item Varchar(8) null comment 'Ítem presupuestario, IP',
	_fund Varchar(8) null comment 'Fuente de financiamiento, FF',
	_commitment Varchar(8) null comment 'Compromiso de ejercicio, CE',
	_certificate Varchar(8) null comment 'Certificado de disponibilidad presupuestaria, CF',
	_heading int not null comment 'Partida presupuestaria',
	primary key (_id),
	unique (_description),
	foreign key (_heading) references <?= DB_SCHEMA ?>.settlement_headings(_id)
)
engine = InnoDB
comment = 'Subpartidas presupuestarias';

