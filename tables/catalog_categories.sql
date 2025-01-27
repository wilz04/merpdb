create table <?= DB_SCHEMA ?>.catalog_categories (
	_id int not null auto_increment comment 'Identificador',
	_title Varchar(64) not null comment 'Título',
	_category int null comment 'Súper-categoría',
	primary key (_id),
	unique key uk_categories_title_category (_title, _category),
	foreign key (_category) references <?= DB_SCHEMA ?>.catalog_categories(_id)
)
engine = InnoDB
comment = 'Categorías';

