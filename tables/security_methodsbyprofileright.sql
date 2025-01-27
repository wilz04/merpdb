create table <?= DB_SCHEMA ?>.security_methodsbyprofileright (
	_profile int not null,
	_method int not null,
	_neg bit not null,
	primary key (_profile, _method),
	unique key uk_methodsbyprofileright_profile_method(_profile, _method),
	foreign key (_method) references <?= DB_SCHEMA ?>.security_methods(_id),
	foreign key (_profile) references <?= DB_SCHEMA ?>.security_profiles(_id)
)
engine = InnoDB
comment = '';

insert into <?= DB_SCHEMA ?>.security_methodsbyprofileright (_profile, _method, _neg) values
<?= implode(",\n", $security_methodsbyprofileright) ?>;

