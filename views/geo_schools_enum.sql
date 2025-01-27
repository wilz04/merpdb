create view <?= DB_SCHEMA ?>.geo_schools_enum as select
	s._id, -- Identificador
	concat("[", ifNull(s._budgetcode, '0000'), "] ", s._name) as _name -- Nombre de la Institución
from <?= DB_SCHEMA ?>.geo_schools s;

