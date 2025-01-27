<?php
header("Content-Type: text/plain");

define("DB_SCHEMA", "u320685534_merp");
// define("DB_SCHEMA", "merptesting");
define("TYPE_MONEY", "Decimal(16, 2)");

// geo
include_once("tables/geo_dependences.sql");
include_once("tables/geo_enrollmentmodes.sql");
include_once("tables/geo_provinces.sql");
include_once("tables/geo_regionals.sql");
include_once("tables/geo_zones.sql");

include_once("tables/geo_typologies.sql");
include_once("tables/geo_regions.sql");

include_once("tables/geo_cantons.sql");
include_once("tables/geo_cantonsdetail.sql");
include_once("tables/geo_districts.sql");
include_once("tables/geo_districtsdetail.sql");
include_once("tables/geo_towns.sql");
include_once("tables/geo_locations.sql");
include_once("tables/geo_schools.sql");
include_once("tables/geo_enrollments.sql");

include_once("views/geo_cantonsdetail_list.sql");
include_once("views/geo_cantons_enum.sql");
include_once("views/geo_districtsdetail_list.sql");
include_once("views/geo_districts_enum.sql");
include_once("views/geo_locations_list.sql");
include_once("views/geo_schools_list.sql");
include_once("views/geo_schools_enum.sql");

// settlement
include_once("tables/settlement_subprograms.sql");
include_once("tables/settlement_programs.sql");
include_once("tables/settlement_headings.sql");
include_once("tables/settlement_headingsbysubprograms.sql");
include_once("tables/settlement_subheadings.sql");
include_once("tables/settlement_accounting.sql");

include_once("tables/settlement_budgetprojects.sql");
include_once("tables/settlement_incomesources.sql");
include_once("tables/settlement_incomebyschool.sql");
include_once("tables/settlement_outcomebyschool.sql");

// security
include_once("wizards/security_menu.php");
include_once("tables/security_profiles.sql");
include_once("tables/security_users.sql");
include_once("tables/security_groups.sql");
include_once("tables/security_userprofiles.sql");
include_once("tables/security_hosts.sql");
include_once("tables/security_methods.sql");
include_once("tables/security_methodsbyuserright.sql");
include_once("tables/security_methodsbyprofileright.sql");
// include_once("tables/security_attrs.sql");
// include_once("tables/security_attrsbyuserright.sql");
// include_once("tables/security_attrsbyprofileright.sql");

include_once("views/security_profiles_list.sql");
include_once("views/security_users_list.sql");

include_once("procedures/security_Methods_enforce.sql");

// matrix
include_once("tables/matrix_indicators.sql");
// include_once("tables/matrix_indicatorcheckpoints.sql");
// include_once("tables/matrix_goals.sql");
// include_once("tables/matrix_milestones.sql");
// include_once("tables/matrix_activities.sql");
include_once("tables/matrix_subheadingsbyactivities.sql");

// pat
include_once("tables/pat_milestones.sql");

// biz
include_once("tables/biz.sql");

// catalog
include_once("tables/catalog_categories.sql");
include_once("tables/catalog_products.sql");

include_once("views/catalog_categories_list.sql");
include_once("views/catalog_products_list.sql");

// system
include_once("tables/sys_settings.sql");

// info
include_once("tables/info_requests.sql");
include_once("views/info_requests_list.sql");

// reporting
include_once("views/reporting_ages.sql");
include_once("views/geo_enrollments_list.sql");
include_once("views/geo_enrollments1_list.sql");
include_once("views/geo_enrollments2_list.sql");
include_once("views/geo_enrollments3_list.sql");
include_once("views/geo_enrollments4_list.sql");
include_once("views/geo_enrollments5_list.sql");
include_once("views/geo_enrollments6_list.sql");
include_once("views/geo_enrollments7_list.sql");
include_once("views/geo_enrollments8_list.sql");
include_once("views/geo_enrollments9_list.sql");
include_once("views/geo_enrollments10_list.sql");
include_once("views/reporting_menu.sql");

// dev
/*
include_once("wizards/dev_Town_New.sql");
include_once("wizards/dev_Regional_New.sql");
include_once("wizards/dev_School_New.sql");
include_once("wizards/dev_Enrollments1_New.sql");
include_once("wizards/dev_Enrollments2_New.sql");
include_once("wizards/dev_Enrollments3_New.sql");
include_once("wizards/dev_Enrollments4_New.sql");
include_once("wizards/dev_Enrollments5_New.sql");
include_once("wizards/dev_Enrollments6_New.sql");
include_once("wizards/dev_Enrollments7_New.sql");
include_once("wizards/dev_Enrollments8_New.sql");
include_once("wizards/dev_Enrollments9_New.sql");
include_once("wizards/dev_Enrollments10_New.sql");
*/

/*
20?
8 y 12?


UWL, base de datos:

indicadores
estudiantes
docentes
asistencia
calificaciones
planes de estudio
programas de apoyo
programas educativos
actividades educativas
recursos educativos
servicios educativos
mensajes
programas de formación y desarrollo profesional del personal educativo
--
presupuesto actual + traslado de partidas compromisos no devengados = presupuesto actual ajustado
*/
?>