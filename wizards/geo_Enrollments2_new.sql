delimiter //

create procedure <?= DB_SCHEMA ?>.geo_Enrollments2_new(
	in __regionalname Varchar(32),
	in __circuit Varchar(2),
	in __budgetcode Varchar(4),
	in __name Varchar(64),
	in __phone int,
	in __pr int,
	in __ae int,
	in __pe int,
	in __rc int,
	in __ad int,
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
	where e._school = __schoolid and e._enrollmentmode = 'PR' and e._year = 2022 and e._amount = __pr;
	if __pr > 0 and __enrollexists = -1 then
		insert into <?= DB_SCHEMA ?>.geo_enrollments (_school, _enrollmentmode, _year, _amount) values
		(__schoolid, 'PR', 2022, __pr);
	end if;

	set __enrollexists = -1;
	select e._id into __enrollexists
	from <?= DB_SCHEMA ?>.geo_enrollments e
	where e._school = __schoolid and e._enrollmentmode = 'AE' and e._year = 2022 and e._amount = __ae;
	if __ae > 0 and __enrollexists = -1 then
		insert into <?= DB_SCHEMA ?>.geo_enrollments (_school, _enrollmentmode, _year, _amount) values
		(__schoolid, 'AE', 2022, __ae);
	end if;

	set __enrollexists = -1;
	select e._id into __enrollexists
	from <?= DB_SCHEMA ?>.geo_enrollments e
	where e._school = __schoolid and e._enrollmentmode = 'PE' and e._year = 2022 and e._amount = __pe;
	if __pe > 0 and __enrollexists = -1 then
		insert into <?= DB_SCHEMA ?>.geo_enrollments (_school, _enrollmentmode, _year, _amount) values
		(__schoolid, 'PE', 2022, __pe);
	end if;

	set __enrollexists = -1;
	select e._id into __enrollexists
	from <?= DB_SCHEMA ?>.geo_enrollments e
	where e._school = __schoolid and e._enrollmentmode = 'RC' and e._year = 2022 and e._amount = __rc;
	if __rc > 0 and __enrollexists = -1 then
		insert into <?= DB_SCHEMA ?>.geo_enrollments (_school, _enrollmentmode, _year, _amount) values
		(__schoolid, 'RC', 2022, __rc);
	end if;

	set __enrollexists = -1;
	select e._id into __enrollexists
	from <?= DB_SCHEMA ?>.geo_enrollments e
	where e._school = __schoolid and e._enrollmentmode = 'AD' and e._year = 2022 and e._amount = __ad;
	if __ad > 0 and __enrollexists = -1 then
		insert into <?= DB_SCHEMA ?>.geo_enrollments (_school, _enrollmentmode, _year, _amount) values
		(__schoolid, 'AD', 2022, __ad);
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

