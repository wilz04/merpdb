create view <?= DB_SCHEMA ?>.reporting_menu as select
	m._id as _id,
	m._path as _action,
	concat(h._svc, "/", m._path) as _href,
	m._name as _label,
	h._domain as _container
from <?= DB_SCHEMA ?>.security_hosts h
left join <?= DB_SCHEMA ?>.security_methods m on m._host = h._id;

