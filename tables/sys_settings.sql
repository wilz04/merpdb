create table <?= DB_SCHEMA ?>.sys_settings (
	_id int not null auto_increment comment 'Identificador',
	_key Varchar(32) not null comment 'Llave',
	_value Varchar(64) not null comment 'Valor',
	primary key (_id),
	unique key uk_settings_key (_key)
)
engine = InnoDB
comment = 'Configuración';

insert into <?= DB_SCHEMA ?>.sys_settings (_key, _value) values
('MAP_WIDTH', '100%'),
('MAP_HEIGHT', '768'),
('MAP_SRC', 'https://arcg.is/1nvbfy'),
('INFO_TO', 'equipo.datos.abiertos@mep.go.cr'),
('INFO_SUBJECT', 'Solicitud de Acceso a Información Pública'),
('INFO_SUMMARY', ''),
('REMINDER_FROM', 'no-responder@mep.go.cr'),
('REMINDER_SUBJECT', 'Nueva contraseña'),
('REMINDER_MESSAGE', 'Hola %s, tu nueva contraseña es %s');

