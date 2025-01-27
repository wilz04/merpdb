create table <?= DB_SCHEMA ?>.security_userprofiles (
	_user int not null,
	_profile int not null,
	primary key (_user, _profile),
	unique key uk_userprofiles_user_profile(_user, _profile),
	foreign key (_user) references <?= DB_SCHEMA ?>.security_users(_id),
	foreign key (_profile) references <?= DB_SCHEMA ?>.security_profiles(_id)
)
engine = InnoDB
comment = '';

insert into <?= DB_SCHEMA ?>.security_userprofiles (_user, _profile) values
(1, 4),
(2, 5);

