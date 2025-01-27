create table <?= DB_SCHEMA ?>.security_users (
	_id int not null auto_increment,
	_1stname varchar(32) not null,
	_2ndname varchar(32) null,
	_3rdname varchar(32) not null,
	_4thname varchar(32) null,
	_email varchar(32) not null,
	_password varchar(32) not null default md5('unicef'),
	_phone int null,
	_photo varchar(32) null,
	_status int not null default '1',
	primary key (_id),
	unique key (_email)
)
engine = innodb
comment = '';

insert into <?= DB_SCHEMA ?>.security_users (
	_1stname, _3rdname, _email, _password, _status
) values (
	'You', 'C', 'you@unicef.org', md5('yellow2009'), 1
), (
	'Wil', 'C', 'wil@unicef.org', md5('unicef'), 1
);

