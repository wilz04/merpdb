create table <?= DB_SCHEMA ?>.catalog_products (
	_id int not null auto_increment comment 'Identificador',
	_title Varchar(64) not null comment 'Título',
	_href Varchar(1024) not null comment 'Enlace',
	_category int null comment 'Categoría',
	primary key (_id),
	unique key uk_categories_title_category (_title, _category),
	foreign key (_category) references <?= DB_SCHEMA ?>.catalog_categories(_id)
)
engine = InnoDB
comment = 'Productos';

