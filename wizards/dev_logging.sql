
create table <?= DB_SCHEMA ?>.dev_logging (
	_key int not null auto_increment,
	_value text not null,
	primary key (_key)
) engine = InnoDB;

