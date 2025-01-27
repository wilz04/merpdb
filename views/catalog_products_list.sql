create view <?= DB_SCHEMA ?>.catalog_products_list as select
	p._id,
	p._title,
	p._href,
	c._title as _category
from <?= DB_SCHEMA ?>.catalog_products p
left join <?= DB_SCHEMA ?>.catalog_categories c on c._id = p._category;

