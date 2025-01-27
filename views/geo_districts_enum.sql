create view <?= DB_SCHEMA ?>.geo_districts_enum as select
	d._id, -- Identificador
	concat(p._name, ', ', c._name, ', ', d._name) as _name -- Nombre
from <?= DB_SCHEMA ?>.geo_districts d
left join <?= DB_SCHEMA ?>.geo_cantons c on c._id = d._canton
left join <?= DB_SCHEMA ?>.geo_provinces p on p._id = c._province;

