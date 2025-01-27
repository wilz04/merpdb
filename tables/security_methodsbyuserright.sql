create table <?= DB_SCHEMA ?>.security_methodsbyuserright (
	-- _id int not null auto_increment,
	_user int not null,
	_method int not null,
	_neg bit not null,
	-- primary key (_user, _method),
	primary key (_user, _method),
	-- unique key uk_methodsbyuserright_user_method(_user, _method),
	foreign key (_method) references <?= DB_SCHEMA ?>.security_methods(_id),
	foreign key (_user) references <?= DB_SCHEMA ?>.security_users(_id)
)
engine = InnoDB
comment = '';

