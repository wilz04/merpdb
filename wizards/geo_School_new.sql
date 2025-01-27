delimiter //

create procedure <?= DB_SCHEMA ?>.geo_School_new(
	in __regionalname Varchar(32),
	in __circuit Varchar(2),
	in __budgetcode Varchar(4),
	in __name Varchar(64),
	in __provincename Varchar(32),
	in __cantonname Varchar(32),
	in __districtname Varchar(32),
	in __townname Varchar(32),
	in __dependence Varchar(4),
	in __phone int)
begin
	declare __regionalid int default -1;
	declare __townid int default -1;
	declare __school_exists int default 0;

	if __budgetcode = '0000' then
		set __budgetcode = NULL;
	end if;

	select t._id into __townid
	from <?= DB_SCHEMA ?>.geo_towns t
	left join <?= DB_SCHEMA ?>.geo_districts d on d._id = t._district
	left join <?= DB_SCHEMA ?>.geo_cantons c on c._id = d._canton
	left join <?= DB_SCHEMA ?>.geo_provinces p on p._id = c._province
	where p._name like __provincename and c._name like __cantonname and d._name like __districtname and t._name like __townname;

	select r._id into __regionalid
	from <?= DB_SCHEMA ?>.geo_regionals r
	where r._name like __regionalname;

	-- insert into merp.dev_logging (_value) select concat('select d._id
	-- from <?= DB_SCHEMA ?>.geo_towns t
	-- left join <?= DB_SCHEMA ?>.geo_districts d on d._id = t._district
	-- left join <?= DB_SCHEMA ?>.geo_cantons c on c._id = d._canton
	-- left join <?= DB_SCHEMA ?>.geo_provinces p on p._id = c._province
	-- where p._name like ', __provincename, ' and c._name like ', __cantonname, ' and d._name like ', __districtname, ' and t._name like ', __townname);

	-- insert into merp.dev_logging (_value) select concat('select count(s._id) into __school_exists
	-- from <?= DB_SCHEMA ?>.geo_schools s
	-- where s._circuit = ', ifNull(__circuit, -1), ' and s._town = ', ifNull(__townid, -1), ' and s._regional = ', ifNull(__regionalid, -1), ' and s._budgetcode = ', ifNull(__budgetcode, -1), ' and s._name like ', ifNull(__name, -1), ' and s._dependence = ', ifNull(__dependence, -1), ' and s._phone = ', ifNull(__phone, -1), ';');

	select count(s._id) into __school_exists
	from <?= DB_SCHEMA ?>.geo_schools s
	where s._circuit = __circuit and s._town = __townid and s._regional = __regionalid and ifNull(s._budgetcode, '0000') = ifNull(__budgetcode, '0000') and s._name like __name and s._dependence = __dependence and s._phone = __phone;
	if __school_exists = 0 then
		-- select __circuit, __townid, __regionalid, __budgetcode, __name, __dependence, __phone;
		insert into <?= DB_SCHEMA ?>.geo_schools (_circuit, _town, _regional, _budgetcode, _name, _dependence, _phone)
		values (__circuit, __townid, __regionalid, __budgetcode, __name, __dependence, __phone);
	end if;
end//


delimiter //

create procedure <?= DB_SCHEMA ?>.gep_School_fix(
	in __id int,
	in __circuit Varchar(2),
	in __town int,
	in __regional int,
	in __budgetcode Varchar(4),
	in __name Varchar(64),
	in __dependence Varchar(4),
	in __phone int)
begin
	if __regional = 36 then
		set __regional = 22;
	end if;

	if __regional = 37 then
		set __regional = 23;
	end if;

	if __regional = 50 then
		set __regional = 24;
	end if;

	if __regional = 51 then
		set __regional = 25;
	end if;

	if __regional = 56 then
		set __regional = 26;
	end if;

	if __regional = 57 then
		set __regional = 27;
	end if;

	insert into <?= DB_SCHEMA ?>.geo_schools (_circuit, _town, _regional, _budgetcode, _name, _dependence, _phone)
	values (__circuit, __town, __regional, __budgetcode, __name, __dependence, __phone);
end//
/*
update merp.geo_towns t
inner join merp.geo_locations l on l._district = t._district and (
	l._name like concat('%', t._name, '%') or
	l._officialname like concat('%', t._name, '%') or
	l._fullname like concat('%', t._name, '%') or

	l._place like concat('%', t._name, '%') or
	l._code like concat('%', t._name, '%') or
	l._note like concat('%', t._name, '%') or
	l._description like concat('%', t._name, '%') or
	l._law like concat('%', t._name, '%') or
	l._segregated like concat('%', t._name, '%') or

	t._name like concat('%', l._name, '%') or
	t._name like concat('%', l._officialname, '%') or
	t._name like concat('%', l._fullname, '%') or
	
	t._name like concat('%', ifNull(l._place, ''), '%') or
	t._name like concat('%', ifNull(l._code, ''), '%') or
	t._name like concat('%', ifNull(l._note, ''), '%') or
	t._name like concat('%', ifNull(l._description, ''), '%') or
	t._name like concat('%', ifNull(l._law, ''), '%') or
	t._name like concat('%', ifNull(l._segregated, ''), '%')
)
set t._location = l._id;
*/

