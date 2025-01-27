delimiter //

create procedure <?= DB_SCHEMA ?>.geo_Enrollments8_new(
	in __regionalname Varchar(32),
	in __circuit Varchar(2),
	in __budgetcode Varchar(4),
	in __name Varchar(64),
	in __phone int,
	in __ec int,
	in __pn int,
	in __cl int)
begin
	declare __regionalid int default -1;
	declare __schoolid int default -1;
	declare __enrollexists int default -1;

	if __budgetcode = '0000' then
		set __budgetcode = NULL;
	end if;

	select r._id into __regionalid
	from <?= DB_SCHEMA ?>.geo_regionals r
	where r._name like __regionalname;

	select s._id into __schoolid
	from <?= DB_SCHEMA ?>.geo_schools s
	where s._circuit = __circuit and s._regional = __regionalid and ifNull(s._budgetcode, '0000') = ifNull(__budgetcode, '0000') and s._name like __name and s._phone = __phone;

	set __enrollexists = -1;
	select e._id into __enrollexists
	from <?= DB_SCHEMA ?>.geo_enrollments e
	where e._school = __schoolid and e._enrollmentmode = 'EC' and e._year = 2022 and e._amount = __ec;
	if __ec > 0 and __enrollexists = -1 then
		insert into <?= DB_SCHEMA ?>.geo_enrollments (_school, _enrollmentmode, _year, _amount) values
		(__schoolid, 'EC', 2022, __ec);
	end if;

	set __enrollexists = -1;
	select e._id into __enrollexists
	from <?= DB_SCHEMA ?>.geo_enrollments e
	where e._school = __schoolid and e._enrollmentmode = 'PN' and e._year = 2022 and e._amount = __pn;
	if __pn > 0 and __enrollexists = -1 then
		insert into <?= DB_SCHEMA ?>.geo_enrollments (_school, _enrollmentmode, _year, _amount) values
		(__schoolid, 'PN', 2022, __pn);
	end if;

	set __enrollexists = -1;
	select e._id into __enrollexists
	from <?= DB_SCHEMA ?>.geo_enrollments e
	where e._school = __schoolid and e._enrollmentmode = 'CL' and e._year = 2022 and e._amount = __cl;
	if __cl > 0 and __enrollexists = -1 then
		insert into <?= DB_SCHEMA ?>.geo_enrollments (_school, _enrollmentmode, _year, _amount) values
		(__schoolid, 'CL', 2022, __cl);
	end if;
end//

