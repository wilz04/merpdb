-- 2
create view dash_geo_studentsbyschool as select
	s._name,
	concat(l._latitude, ', ', l._longitude) as _coordinates,
	sum(e._amount) as _amount,
	d._description as _dependence,
	e._year
from geo_schools s
left join geo_dependences d on d._id = s._dependence
left join geo_towns t on t._id = s._town
inner join geo_locations l on l._id = t._location
left join geo_enrollments e on e._school = s._id
group by s._name, concat(l._latitude, ', ', l._longitude), e._year, s._dependence;

-- 5
-- create view dash_geo_diningrooms

-- 12, 13
create view dash_geo_schoolsbyzone as select
	case
		when z._id = 1 then 'Urbano'
		when z._id = 2 then 'Urbano'
		when z._id = 3 then 'Rural'
		when z._id = 4 then 'Rural'
		else 'otros'
	end as _id,
	z._description,
	count(s._id) as _amount
from geo_schools s
left join geo_towns t on t._id = s._town and s._disabled is null
inner join geo_locations l on l._id = t._location
left join geo_zones z on z._id = l._zone
group by z._description;

-- 14
create view dash_geo_schoolsbytypology as select
	case
		when a._id = 10 then a._description
		else 'otros'
	end as _aboriginal,
	a._description,
	count(s._id) as _amount
from geo_schools s
left join geo_towns t on t._id = s._town and s._disabled is null
inner join geo_locations l on l._id = t._location
left join geo_typologies a on a._id = l._typology
group by a._id, a._description;

-- 18
create view dash_geo_schoolsbydependence as select
	d._description,
	count(s._id) as _amount
from geo_schools s
inner join geo_dependences d on d._id = s._dependence and s._disabled is null
group by d._description;

-- 20
create view dash_geo_enrollmentbyregional as select
	r._name,
	sum(e._amount) as _amount,
	e._year
from geo_schools s
left join geo_regionals r on r._id = s._regional and s._disabled is null
left join geo_enrollments e on e._school = s._id
group by r._name, e._year;

-- 21
create view dash_geo_schoolsbyregional as select
	r._name,
	count(s._id) as _amount
from geo_schools s
left join geo_regionals r on r._id = s._regional and s._disabled is null
group by r._name;

-- 47, 48, 49, 50, 51
create view dash_geo_schoolsbyids as select
	case
		when dd._ids >= 80 then 'Muy alto'
		when dd._ids >= 60 and dd._ids < 80 then 'Alto'
		when dd._ids >= 40 and dd._ids < 60 then 'Medio'
		when dd._ids >= 20 and dd._ids < 40 then 'Bajo'
		else 'Muy bajo'
	end as _description,
	count(dd._ids) as _amount
from geo_schools s
left join geo_towns t on t._id = s._town
left join geo_districts d on d._id = t._district
left join geo_districtsdetail dd on dd._district = d._id
group by case
	when dd._ids >= 80 then 'Muy alto'
	when dd._ids >= 60 and dd._ids < 80 then 'Alto'
	when dd._ids >= 40 and dd._ids < 60 then 'Medio'
	when dd._ids >= 20 and dd._ids < 40 then 'Bajo'
	else 'Muy bajo'
end;