create table <?= DB_SCHEMA ?>.security_attrsbyprofileright (
	_profile int not null,
	_attr int not null,
	_neg bit not null,
	primary key (_profile, _attr),
	foreign key (_attr) references <?= DB_SCHEMA ?>.security_attrs(_id),
	foreign key (_profile) references <?= DB_SCHEMA ?>.security_profiles(_id)
)
engine = InnoDB
comment = '';

