create table <?= DB_SCHEMA ?>.info_requests (
	_id int not null auto_increment comment 'Identificador',
	_fullname Varchar(128) not null comment 'Nombres y apellidos / Razón social',
	_nid Varchar(16) not null comment 'Cédula de identidad / Pasaporte / Dimex',
	_advisor Varchar(128) null comment 'Nombres y apellidos del apoderado (si corresponde)',
	_legalid Varchar(16) null comment 'Cédula jurídica (si corresponde)',
	_address Text not null comment 'Dirección',
	_location Varchar(128) not null comment 'Provincia, cantón, distrito',
	_phone1 Varchar(16) not null comment 'Teléfono: Opción (1)',
	_phone2 Varchar(16) null comment 'Opción (2)',
	_signs Varchar(128) null comment 'Otras señas',
	_email Varchar(128) not null comment 'Correo electrónico',
	_department Text not null comment 'Nombre de la dirección y / o departamento a la que se dirige la solicitud',
	_subject Text not null comment 'Identificación de la información solicitada. Materia, fecha de emisión o período de vigencia, origen o destino, soporte, entre otros.',
	_notifyme bit not null comment 'Notificar por correo electrónico',
	_pickup bit not null comment 'Retiro en ventanilla',
	_date Date not null comment 'Fecha',
	_applicant Varchar(128) not null comment 'Nombre del solicitante',

	_recvdate Date null comment 'Acuse de recibido: Fecha',
	_recvunit Varchar(64) null comment 'Acuse de recibido: Unidad receptora',
	_recvreceptor Varchar(128) null comment 'Acuse de recibido: Nombre del funcionario que recibe',
	_recvnotified Varchar(128) null comment 'Acuse de recibido: Notificado a',

	_mailto Varchar(128) not null comment 'Receptor del email',
	_mailsubject Text not null comment 'Asunto del email',
	_mailsummary Text null comment 'Resumen del email',
	_mailheaders Varchar(1024) not null comment 'Encabezados del email',
	_mailsent bit not null comment 'Enviado',
	primary key (_id)
)
engine = InnoDB
comment = 'Solicitudes de acceso a información pública';

