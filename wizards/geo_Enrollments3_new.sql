delimiter //

create procedure <?= DB_SCHEMA ?>.geo_Enrollments3_new(
	in __regionalname Varchar(32),
	in __circuit Varchar(2),
	in __budgetcode Varchar(4),
	in __name Varchar(64),
	in __phone int,
	in __se int,
	in __bi int,
	in __pn int,
	in __pea int)
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
	where e._school = __schoolid and e._enrollmentmode = 'SE' and e._year = 2022 and e._amount = __se;
	if __se > 0 and __enrollexists = -1 then
		insert into <?= DB_SCHEMA ?>.geo_enrollments (_school, _enrollmentmode, _year, _amount) values
		(__schoolid, 'SE', 2022, __se);
	end if;

	set __enrollexists = -1;
	select e._id into __enrollexists
	from <?= DB_SCHEMA ?>.geo_enrollments e
	where e._school = __schoolid and e._enrollmentmode = 'BI' and e._year = 2022 and e._amount = __bi;
	if __bi > 0 and __enrollexists = -1 then
		insert into <?= DB_SCHEMA ?>.geo_enrollments (_school, _enrollmentmode, _year, _amount) values
		(__schoolid, 'BI', 2022, __bi);
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
	where e._school = __schoolid and e._enrollmentmode = 'PEA' and e._year = 2022 and e._amount = __pea;
	if __pea > 0 and __enrollexists = -1 then
		insert into <?= DB_SCHEMA ?>.geo_enrollments (_school, _enrollmentmode, _year, _amount) values
		(__schoolid, 'PEA', 2022, __pea);
	end if;
end//

