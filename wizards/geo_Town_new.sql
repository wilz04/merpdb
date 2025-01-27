delimiter //

create procedure <?= DB_SCHEMA ?>.geo_Town_new(in __cantonname Varchar(32), in __districtname Varchar(32), in __name Varchar(32), in __zoneid Varchar(4)) begin
	declare __districtid int default -1;
	declare __exists int default 0;

	select d._id into __districtid
	from <?= DB_SCHEMA ?>.geo_cantons c
	left join <?= DB_SCHEMA ?>.geo_districts d on d._canton = c._id
	where c._name like __cantonname and d._name like __districtname;

	select count(t._id) into __exists from <?= DB_SCHEMA ?>.geo_towns t where t._district = __districtid and t._name = __name;
	if __exists = 0 then
		insert into <?= DB_SCHEMA ?>.geo_towns (_district, _zone, _name) values (__districtid, __zoneid, __name);
	end if;
end//

