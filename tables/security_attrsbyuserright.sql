create table <?= DB_SCHEMA ?>.security_attrsbyuserright (
	_user int not null,
	_attr int not null,
	_neg bit not null,
	primary key (_user, _attr),
	foreign key (_attr) references <?= DB_SCHEMA ?>.security_attrs(_id),
	foreign key (_user) references <?= DB_SCHEMA ?>.security_users(_id)
)
engine = InnoDB
comment = '';

