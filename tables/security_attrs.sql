create table <?= DB_SCHEMA ?>.security_attrs (
	_id int not null auto_increment,
	_method int not null,
	_name varchar(256) not null,
	primary key (_id),
	unique key uk_attrs_method_name (_method, _name),
	foreign key (_method) references <?= DB_SCHEMA ?>.security_methods(_id)
)
engine = InnoDB
comment = '';

