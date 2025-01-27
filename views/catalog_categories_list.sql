create view <?= DB_SCHEMA ?>.catalog_categories_list as select
	c._id,
	c._title,
	s._title as _category
from <?= DB_SCHEMA ?>.catalog_categories c
left join <?= DB_SCHEMA ?>.catalog_categories s on s._id = c._category;

