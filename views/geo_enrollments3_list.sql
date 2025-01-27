create view <?= DB_SCHEMA ?>.geo_enrollments3_list as select
	s._id, -- as 'Identificador',
	r._name as _regional, -- as 'Dirección Regional',
	s._circuit, -- as 'Circuito',
	ifNull(s._budgetcode, '0000') as _budgetcode, -- as 'Código Presupuestario',
	s._name, -- as 'Nombre de la Institución',
	concat(p._name, ', ', c._name, ', ', a._name, ', ', t._name) as _town, -- as 'Poblado',
	d._description as _dependence, -- as 'Dependencia',
	z._description as _zone, -- as 'Zona',
	s._phone, -- as 'Teléfono',

	ifNull(bi._amount, 0) as _bi, -- as 'Matrícula Bachillerato Internacional',
	ifNull(se._amount, 0) as _se, -- as 'Matrícula De 7mo a 12vo año',
	ifNull(pn._amount, 0) as _pn, -- as 'Matrícula Plan Nacional',
	ifNull(pea._amount, 0) as _pea, -- as 'Matrícula Proyecto de Educación Abierta',
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

left join <?= DB_SCHEMA ?>.geo_enrollments bi on bi._enrollmentmode = 'BI' and bi._school = s._id and bi._year = y._id
left join <?= DB_SCHEMA ?>.geo_enrollments se on se._enrollmentmode = 'SE' and se._school = s._id and se._year = y._id
left join <?= DB_SCHEMA ?>.geo_enrollments pn on pn._enrollmentmode = 'PN' and pn._school = s._id and pn._year = y._id
left join <?= DB_SCHEMA ?>.geo_enrollments pea on pea._enrollmentmode = 'PEA' and pea._school = s._id and pea._year = y._id
where
	ifNull(bi._amount, 0) > 0 or
	ifNull(se._amount, 0) > 0 or
	ifNull(pn._amount, 0) > 0 or
	ifNull(pea._amount, 0) > 0;

