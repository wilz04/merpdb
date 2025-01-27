create view <?= DB_SCHEMA ?>.security_profiles_list as select
	_id, -- Identificador
	_name, -- Nombre
	case when p._reserved = 1 then '&check;' else '&nbsp;' end as _reserved -- Reservado para el personal
from <?= DB_SCHEMA ?>.security_profiles p;

