<?php
define("ACTIONS_ALL", ["open", "list", "new", "get", "put", "rem"]);
define("ACTIONS_OPEN_LIST", ["open", "list"]);

define("PROFILE_TECHNICAL", 4);
define("PROFILE_CONSULTANT", 5);

$security_menu = [
	[
		"_module" => "Localizaci&oacute;n",
		"_controllers" => [
			["_id" => "geocantonsdetail", "_name" => "Detalle de cantones", "_actions" => ACTIONS_ALL], //+
			["_id" => "geodistrictsdetail", "_name" => "Detalle de distritos", "_actions" => ACTIONS_ALL], //+
			["_id" => "geolocations", "_name" => "Localidades", "_actions" => ACTIONS_ALL],
			["_id" => "georegionals", "_name" => "Direcciones Regionales", "_actions" => ACTIONS_ALL], //+
			["_id" => "geoschools", "_name" => "Centros Educativos", "_actions" => ACTIONS_ALL], //+
			["_id" => "geoenrollments", "_name" => "Matr&iacute;cula", "_actions" => ACTIONS_ALL], //+
			["_id" => "geoenrollmentmodes", "_name" => "Modalidades", "_actions" => ACTIONS_ALL], //+
			["_id" => "geotypologies", "_name" => "Tipolog&iacute;as", "_actions" => ACTIONS_ALL] //+
		]
	], [
		"_module" => "N&oacute;mina de C.E.",
		"_controllers" => [
			["_id" => "geoenrollments1", "_name" => "Preescolar independ.", "_actions" => ACTIONS_OPEN_LIST], //+
			["_id" => "geoenrollments2", "_name" => "I y II ciclos", "_actions" => ACTIONS_OPEN_LIST], //+
			["_id" => "geoenrollments3", "_name" => "Colegios", "_actions" => ACTIONS_OPEN_LIST], //+
			["_id" => "geoenrollments4", "_name" => "CNV MTS", "_actions" => ACTIONS_OPEN_LIST], //+
			["_id" => "geoenrollments5", "_name" => "C.E.E.", "_actions" => ACTIONS_OPEN_LIST], //+
			["_id" => "geoenrollments6", "_name" => "CAIPAD", "_actions" => ACTIONS_OPEN_LIST], //+
			["_id" => "geoenrollments7", "_name" => "Esc. nocturna", "_actions" => ACTIONS_OPEN_LIST], //+
			["_id" => "geoenrollments8", "_name" => "IPEC", "_actions" => ACTIONS_OPEN_LIST], //+
			["_id" => "geoenrollments9", "_name" => "CINDEA", "_actions" => ACTIONS_OPEN_LIST], //+
			["_id" => "geoenrollments10", "_name" => "CONED", "_actions" => ACTIONS_OPEN_LIST] //+
		]
	], [
		"_module" => "Cat&aacute;logo",
		"_controllers" => [
			["_id" => "catalogcategories", "_name" => "Categor&iacute;as", "_actions" => ACTIONS_ALL], //+
			["_id" => "catalogproducts", "_name" => "Productos", "_actions" => ACTIONS_ALL] //+
		]
	], [
		"_module" => "An&aacute;lisis",
		"_controllers" => [
			["_id" => "matrixindicators", "_name" => "Indicadores", "_actions" => ACTIONS_ALL], //+
			["_id" => "bizschoolsdetail", "_name" => "Detalle de C.E.", "_actions" => ACTIONS_ALL],
			["_id" => "bizresearch", "_name" => "Investigaciones", "_actions" => ACTIONS_ALL]
		]
	], [
		"_module" => "Mensajer&iacute;a",
		"_controllers" => [
			["_id" => "inforequests", "_name" => "Solicitudes", "_actions" => ["open", "list", "get", "put"]] //+
		]
	], [
		"_module" => "Sistema",
		"_controllers" => [
			["_id" => "securitymethodsbyprofileright", "_name" => "Autorizaci&oacute;n (perfiles)", "_actions" => ACTIONS_ALL],
			["_id" => "securitymethodsbyuserright", "_name" => "Autorizaci&oacute;n (usuarios)", "_actions" => ACTIONS_ALL],
			["_id" => "securityprofiles", "_name" => "Perfiles", "_actions" => ACTIONS_ALL],
			["_id" => "securityuserprofiles", "_name" => "Perfiles por usuarios", "_actions" => ACTIONS_ALL],
			["_id" => "securityusers", "_name" => "Usuarios", "_actions" => ACTIONS_ALL],
			["_id" => "syssettings", "_name" => "Configuraci&oacute;n", "_actions" => ["open", "list", "get", "put"]],
		]
	]
];

$host_format = "(%d, '%s', '%s', NULL)";
$method_format = "(%d, %d, '%s', '%s')";
$methodsbyprofileright_format = "(%d, %d, 0)";

$security_hosts = [];
$security_methods = [];
$security_methodsbyprofileright = [];

$i = 0;
$j = 0;
foreach ($security_menu as $module_key=>$module) {
	foreach ($module["_controllers"] as $controller_key=>$controller) {
		$security_hosts[] = sprintf($host_format, ++$i, $module["_module"], $controller["_id"]);

		foreach ($controller["_actions"] as $action_key=>$action) {
			$security_methods[] = sprintf($method_format, ++$j, $i, $controller["_name"], $action);
			$security_methodsbyprofileright[] = sprintf($methodsbyprofileright_format, PROFILE_TECHNICAL, $j);
			$security_methodsbyprofileright[] = sprintf($methodsbyprofileright_format, PROFILE_CONSULTANT, $j);
		}
	}
}
?>