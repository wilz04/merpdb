-- Hay que devolver un perfil por defecto.
create view <?= DB_SCHEMA ?>.security_users_list as select
	u._id,
	concat(u._1stname, ' ', ifNull(u._2ndname, ''), ' ', u._3rdname, ' ', ifNull(u._4thname, '')) as _fullname,
	u._email,
	u._phone,
	u._photo,
	case when u._status = 1 then '&check;' else '' end as _status
from <?= DB_SCHEMA ?>.security_users u;

