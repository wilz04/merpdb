create table <?= DB_SCHEMA ?>.biz_students (
	_id int not null auto_increment comment 'Identificador',
	_graduated bit not null comment 'Graduado de secundaria',
	primary key (_id)
)
engine = InnoDB
comment = 'Estudiantes';

create table <?= DB_SCHEMA ?>.biz_studentsdetail (
	_student int not null auto_increment comment 'Estudiante',
	_school int not null comment 'Centro educativo',
	_diningroomaccess bit null comment 'Beneficiario del Servicio de alimentación',
	_diningroom2ndaccess bit null comment 'Beneficiario del Servicio de alimentación',
	_transportaccess bit null comment 'Beneficiario del programa de Transporte Estudiantil',
	_year Year not null comment 'Año',
	primary key (_student, _year),
	foreign key (_school) references <?= DB_SCHEMA ?>.geo_schools(_id),
	foreign key (_student) references <?= DB_SCHEMA ?>.biz_students(_id)
)
engine = InnoDB
comment = 'Detalle de estudiantes';

create table <?= DB_SCHEMA ?>.biz_teachers (
	_id int not null auto_increment comment 'Identificador',
	_birthdate Datetime not null comment 'Día de nacimiento',
	_hired Datetime not null comment 'Fecha de contratación',
	_property bit not null comment 'Con propiedad',
	primary key (_id)
)
engine = InnoDB
comment = 'Docentes';

create table <?= DB_SCHEMA ?>.biz_teachersbyschools (
	_teacher int not null auto_increment comment 'Docente',
	_school int not null comment 'Centro educativo',
	_year Year not null comment 'Año',
	primary key (_teacher, _year),
	foreign key (_teacher) references <?= DB_SCHEMA ?>.biz_teachers(_id),
	foreign key (_school) references <?= DB_SCHEMA ?>.geo_schools(_id)
)
engine = InnoDB
comment = 'Docentes por centros educativos';

create table <?= DB_SCHEMA ?>.biz_profiles (
	_id int not null auto_increment comment 'Identificador',
	_name Varchar(64) not null comment 'Nombre',
	primary key (_id),
	unique key (_name)
)
engine = InnoDB
comment = 'Perfiles administrativos';

insert into <?= DB_SCHEMA ?>.biz_profiles (_name) values ('Supervisor(a)'), ('Cociner@');

create table <?= DB_SCHEMA ?>.biz_workers (
	_id int not null auto_increment comment 'Identificador',
	_profile int not null comment 'Perfil',
	_startdate Datetime not null comment 'Fecha de inicio',
	_enddate Datetime not null comment 'Fecha de fin',
	primary key (_id),
	foreign key (_profile) references <?= DB_SCHEMA ?>.biz_profiles(_id)
)
engine = InnoDB
comment = 'Administrativos';

create table <?= DB_SCHEMA ?>.biz_workersbyschools (
	_worker int not null auto_increment comment 'Administrativo',
	_school int not null comment 'Centro educativo',
	primary key (_worker),
	foreign key (_worker) references <?= DB_SCHEMA ?>.biz_workers(_id),
	foreign key (_school) references <?= DB_SCHEMA ?>.geo_schools(_id)
)
engine = InnoDB
comment = 'Administrativos por centros educativos';

create table <?= DB_SCHEMA ?>.biz_schoolsdetail (
	_school int not null comment 'Centro educativo',
	_orchard bit null comment 'Con huerta estudiantil',
	_diningroomtimes int null comment 'Tiempos de alimentación',
	_studenttransport int null comment 'Transporte estudiantil',
	_sanitarywarning bit null comment 'Con orden sanitaria',
	_computerlab bit null comment 'Con laboratorio de informática',
	-- _aboriginal bit null comment 'Con cosmovisión de centro indígena',
	_singleteacher bit null comment 'Unidocente',
	_academic bit null comment 'Secundaria académica',
	_technical bit null comment 'Secundaria técnica',
	_bilingual bit null comment 'Secundaria bilingüe',
	_nocturnal bit null comment 'Secundaria nocturna',
	_adultopen bit null comment 'Secundaria abierta para adultos',
	_scientific bit null comment 'Científico',
	_humanistic bit null comment 'Humanístico',
	_connected bit null comment 'Con conectividad',
	_law6746amount <?= TYPE_MONEY ?> null comment 'Monto anual asignado de la ley 6746',
	_year Year not null comment 'Año',
	primary key (_school, _year),
	foreign key (_school) references <?= DB_SCHEMA ?>.geo_schools(_id)
)
engine = InnoDB
comment = 'Detalle de centros educativos';

create table <?= DB_SCHEMA ?>.biz_research (
	_id int not null auto_increment comment 'Identificador',
	_description Varchar(32) not null comment 'Descripción',
	primary key (_id),
	unique key (_description)
)
engine = InnoDB
comment = 'Investigaciones del Departamento de Estudios e Investigación Educativa (DEIE) de la Dirección de Planificación Institucional';

