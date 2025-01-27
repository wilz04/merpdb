create view <?= DB_SCHEMA ?>.geo_enrollments6_list as select
	s._id, -- as 'Identificador',
	r._name as _regional, -- as 'Dirección Regional',
	s._circuit, -- as 'Circuito',
	ifNull(s._budgetcode, '0000') as _budgetcode, -- as 'Código Presupuestario',
	s._name, -- as 'Nombre de la Institución',
	concat(p._name, ', ', c._name, ', ', a._name, ', ', t._name) as _town, -- as 'Poblado',
	d._description as _dependence, -- as 'Dependencia',
	z._description as _zone, -- as 'Zona',
	s._phone, -- as 'Teléfono',

	ifNull(caipad._amount, 0) as _caipad, -- as 'Matrícula Centros de Atención Integral Para Adultos con Discapacidad',
	y._id as _age
from <?= DB_SCHEMA ?>.reporting_ages y
left join <?= DB_SCHEMA ?>.geo_schools s on 1 = 1
left join <?= DB_SCHEMA ?>.geo_towns t on t._id = s._town
left join <?= DB_SCHEMA ?>.geo_districts a on a._id = t._district
left join <?= DB_SCHEMA ?>.geo_cantons c on c._id = a._canton
left join <?= DB_SCHEMA ?>.geo_provinces p on p._id = c._province
left join <?= DB_SCHEMA ?>.geo_regionals r on r._id = s._regional
left join <?= DB_SCHEMA ?>.geo_dependences d on d._id = s._dependence
left join <?= DB_SCHEMA ?>.geo_zones z on z._id = t._zone

left join <?= DB_SCHEMA ?>.geo_enrollments caipad on caipad._enrollmentmode = 'CAIPAD' and caipad._school = s._id and caipad._year = y._id
where
	ifNull(caipad._amount, 0) > 0;

