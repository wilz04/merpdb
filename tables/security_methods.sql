create table <?= DB_SCHEMA ?>.security_methods (
	_id int not null auto_increment,
	_host int not null,
	_name varchar(32) not null,
	_path varchar(1024) null,
	primary key (_id),
	-- unique key uk_methods_host_name_path (_host, _name),
	foreign key (_host) references <?= DB_SCHEMA ?>.security_hosts(_id)
)
engine = InnoDB
comment = '';

insert into <?= DB_SCHEMA ?>.security_methods (_id, _host, _name, _path) values
<?= implode(",\n", $security_methods) ?>;

