create view <?= DB_SCHEMA ?>.geo_districtsdetail_list as select
	e._id, -- Identificador del detalle
	d._id as _districtid, -- Identificador del distrito
	concat(p._name, ', ', c._name, ', ', d._name) as  _districtname, -- Distrito
	d._area as _districtarea, -- Área (km2)
	e._economic, -- Económica
	e._voterturnout, -- Participación electoral
	e._health, -- Salud
	e._education, -- Educación
	e._security, -- Seguridad
	e._population, -- Población
	e._ids, -- 'IDS'
	e._year as _age -- Año
from <?= DB_SCHEMA ?>.geo_districtsdetail e
left join <?= DB_SCHEMA ?>.geo_districts d on d._id = e._district
left join <?= DB_SCHEMA ?>.geo_cantons c on c._id = d._canton
left join <?= DB_SCHEMA ?>.geo_provinces p on p._id = c._province;

