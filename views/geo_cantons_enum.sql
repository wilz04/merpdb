create view <?= DB_SCHEMA ?>.geo_cantons_enum as select
	c._id, -- Identificador
	concat(p._name, ', ', c._name) as _name -- Nombre
from <?= DB_SCHEMA ?>.geo_cantons c
left join <?= DB_SCHEMA ?>.geo_provinces p on p._id = c._province;

