create view <?= DB_SCHEMA ?>.geo_locations_list as select
	l._id,
	concat(p._name, ', ', c._name, ', ', a._name, ', ', l._name) as _town
from <?= DB_SCHEMA ?>.geo_towns l
left join <?= DB_SCHEMA ?>.geo_districts a on a._id = l._district
left join <?= DB_SCHEMA ?>.geo_cantons c on c._id = a._canton
left join <?= DB_SCHEMA ?>.geo_provinces p on p._id = c._province;

