create table <?= DB_SCHEMA ?>.security_hosts (
	_id int not null auto_increment,
	_svc Varchar(32) null,
	_domain Varchar(32) null,
	_port int null,
	primary key (_id),
	unique key uk_hosts_domain_port (_domain, _port)
)
engine = InnoDB
comment = '';

insert into <?= DB_SCHEMA ?>.security_hosts (_id, _domain, _svc, _port) values
<?= implode(",\n", $security_hosts) ?>;

