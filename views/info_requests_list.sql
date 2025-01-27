create view <?= DB_SCHEMA ?>.info_requests_list as select
	i._id, -- Identificador,

	concat(
		'<div>Nombres y apellidos / Raz&oacute;n social: ', i._fullname, '</div>',
		'<div>C&eacute;dula de identidad / Pasaporte / Dimex: ', i._nid, '</div>',
		'<div>Nombres y apellidos del apoderado: ', ifNull(i._advisor, ''), '</div>',
		'<div>C&eacute;dula jur&iacute;dica: ', ifNull(i._legalid, ''), '</div>',
		'<div>Direcci&oacute;n: ', i._address, '</div>',
		'<div>Provincia, cant&oacute;n, distrito: ', i._location, '</div>',
		'<div>Tel&eacute;fono 1: ', i._phone1, '</div>',
		'<div>Tel&eacute;fono 2: ', ifNull(i._phone2, ''), '</div>',
		'<div>Otras se&ntilde;as: ', ifNull(i._signs, ''), '</div>',
		'<div>Correo electr&oacute;nico: ', i._email, '</div>'
	) as _applicant, -- Identificación del solicitante

	concat(
		'<div>Nombre de la direcci&oacute;n y / o departamento a la que se dirige la solicitud: ', i._department, '</div>',
		'<div>Identificaci&oacute;n de la informaci&oacute;n solicitada. Materia, fecha de emisi&oacute;n o período de vigencia, origen o destino, soporte, entre otros: ', i._subject, '</div>',
		'<div>', (case when i._notifyme = 1 then '[&check;]' else '[&nbsp;]' end), ' Notificar por correo electr&oacute;nico</div>',
		'<div>', (case when i._pickup = 1 then '[&check;]' else '[&nbsp;]' end), ' Retiro en ventanilla</div>'
	) as _description, -- Información de la solicitud

	concat(
		'<div>Fecha: ', date_format(i._date, "%d-%m-%Y"), '</div>',
		'<div>Nombre del solicitante: ', i._applicant, '</div>'
	) as _detail, -- Información relevante

	i._mailto, -- Receptor del emai
	case when i._mailsent = 1 then '&check;' else '' end as _mailsent, -- Enviado

	concat(
		'<div>Fecha de recepci&oacute;n: ', date_format(i._recvdate, "%d-%m-%Y"), '</div>',
		'<div>Unidad receptora: ', i._recvunit, '</div>',
		'<div>Nombre del funcionario que recibe: ', i._recvreceptor, '</div>',
		'<div>Notificado a: ', i._recvnotified, '</div>'
	) as _recvackn -- Acuse de recibido
from <?= DB_SCHEMA ?>.info_requests i;

