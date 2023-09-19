
<?php
header("Content_Type: text/html;charset=utf-8");
	$db = new mysqli("localhost", "root", "", "intradroxinet"); //base_de_datos es el nombre que le dí a la base de datos en phpMyAdmin
if ($db) {
echo "";
}
else {
echo "Error: No se pudo conectar";
}
?>