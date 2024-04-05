<?php 
header('Access-Control-Allow-Origin: *'); 
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

$json = file_get_contents('php://input');
$params = json_decode($json);

require("conexion.php");
$con = retornarConexion();

// Escapar y sanitizar los valores de entrada para evitar inyección SQL
$id_Usurol = mysqli_real_escape_string($con, $params->id_Usurol);
$Numero_documento = mysqli_real_escape_string($con, $params->Numero_documento);
$id_rol = mysqli_real_escape_string($con, $params->id_rol);

mysqli_query($con, "UPDATE usuariorol SET Numero_documento='$Numero_documento', id_rol=$id_rol WHERE id_Usurol=$id_Usurol");

class Result {}

$response = new Result();
$response->resultado = 'OK';
$response->mensaje = 'datos modificados';

header('Content-Type: application/json');
echo json_encode($response);  
?>
