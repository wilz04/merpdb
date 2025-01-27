delimiter //

create procedure <?= DB_SCHEMA ?>.security_Methods_enforce(in __service Varchar(32), in __path Varchar(32), in __userid int, in __token Varchar(32)) __as:begin
	declare __methodid int default -1;
	declare __allowed bit default 0;

	select 1 into __allowed
	from <?= DB_SCHEMA ?>.security_users u
	where u._id = __userid and u._password = __token;
	if __allowed = 0 then
		select __allowed as _allow;
		leave __as;
	end if;

	set __allowed = 0;
	
	select m._id into __methodid
	from <?= DB_SCHEMA ?>.security_methods m
	left join <?= DB_SCHEMA ?>.security_hosts h on h._id = m._host
	where m._path = __path and h._svc = __service;

	select 1 into __allowed
	from <?= DB_SCHEMA ?>.security_methodsbyprofileright x
	inner join <?= DB_SCHEMA ?>.security_userprofiles p on (p._user = __userid or p._profile = 1) and (p._profile = x._profile or x._profile = 1) and x._method = __methodid and x._neg = 0
	group by x._method;

	select 0 into __allowed
	from <?= DB_SCHEMA ?>.security_methodsbyprofileright x
	inner join <?= DB_SCHEMA ?>.security_userprofiles p on (p._user = __userid or p._profile = 1) and (p._profile = x._profile or x._profile = 1) and x._method = __methodid and x._neg = 1
	group by x._method;

	select 1 into __allowed
	from <?= DB_SCHEMA ?>.security_methodsbyuserright x
	where x._user = __userid and x._method = __methodid and x._neg = 0;

	select 0 into __allowed
	from <?= DB_SCHEMA ?>.security_methodsbyuserright x
	where x._user = __userid and x._method = __methodid and x._neg = 1;

	select __allowed as _allow;
end//

delimiter ;

