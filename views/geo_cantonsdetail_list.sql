create view <?= DB_SCHEMA ?>.geo_cantonsdetail_list as select
	d._id, -- Identificador del detalle
	c._id as _cantonid, -- Identificador del cantón
	concat(p._name, ', ', c._name) as _cantonname, -- Cantón
	c._area as _cantonarea, -- Área (km2)
	d._ids, -- 'IDS'
	d._year as _age -- Año
from <?= DB_SCHEMA ?>.geo_cantonsdetail d
left join <?= DB_SCHEMA ?>.geo_cantons c on c._id = d._canton
left join <?= DB_SCHEMA ?>.geo_provinces p on p._id = c._province;

