delimiter //

create procedure <?= DB_SCHEMA ?>.geo_Regional_new(
	in __name Varchar(32))
begin
	declare __regional_exists int default 0;
	select count(r._id) into __regional_exists from <?= DB_SCHEMA ?>.geo_regionals r where r._name like __name;
	if __regional_exists = 0 then
		insert into <?= DB_SCHEMA ?>.geo_regionals (_name) values (__name);
	end if;
end//

