create view <?= DB_SCHEMA ?>.geo_enrollments_list as select
	e._id, -- Identificador
	r._name as _regional, -- Dirección Regional
	s._circuit, -- Circuito
	concat(e._enrollmentmode, ifNull(s._budgetcode, '0000')) as _budgetcode, -- Código Presupuestario
	s._name as _school, -- Nombre de la Institución
	concat(p._name, ', ', c._name, ', ', a._name, ', ', t._name) as _town, -- Poblado
	d._description as _dependence, -- Dependencia
	z._description as _zone, -- Zona
	s._phone, -- Teléfono

	m._description as _enrollmentmode, -- Modalidad
	ifNull(e._amount, 0) as _amount, -- Matrícula
	e._year as _age -- Año
from <?= DB_SCHEMA ?>.geo_enrollments e
left join <?= DB_SCHEMA ?>.geo_enrollmentmodes m on m._id = e._enrollmentmode
left join <?= DB_SCHEMA ?>.geo_schools s on s._id = e._school
left join <?= DB_SCHEMA ?>.geo_towns t on t._id = s._town
left join <?= DB_SCHEMA ?>.geo_districts a on a._id = t._district
left join <?= DB_SCHEMA ?>.geo_cantons c on c._id = a._canton
left join <?= DB_SCHEMA ?>.geo_provinces p on p._id = c._province
left join <?= DB_SCHEMA ?>.geo_regionals r on r._id = s._regional
left join <?= DB_SCHEMA ?>.geo_dependences d on d._id = s._dependence
left join <?= DB_SCHEMA ?>.geo_zones z on z._id = t._zone;

