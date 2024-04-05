<?php
// Permitir solicitudes desde cualquier origen
header("Access-Control-Allow-Origin: *");

// Permitir los métodos GET, POST, PUT, DELETE, OPTIONS
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");

// Permitir los encabezados Content-Type y Authorization
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "intradroxinet";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Recibir datos del formulario
$data = json_decode(file_get_contents('php://input'), true);

// Verificar y obtener los valores de los campos del formulario
$Nombres = isset($data['Nombres']) ? $data['Nombres'] : '';
$Apellidos = isset($data['Apellidos']) ? $data['Apellidos'] : '';
$Email = isset($data['Email']) ? $data['Email'] : '';
$Num_celular = isset($data['Num_celular']) ? $data['Num_celular'] : '';
$id_documento = isset($data['id_documento']) ? $data['id_documento'] : '';
$Numero_documento = isset($data['Numero_documento']) ? $data['Numero_documento'] : '';
$contraseña = isset($data['contraseña']) ? $data['contraseña'] : '';

// Validar campos obligatorios
if(empty($Nombres) || empty($Apellidos) || empty($Email) || empty($Num_celular) || empty($id_documento) || empty($Numero_documento) || empty($contraseña)) {
    $response = array("success" => false, "message" => "Todos los campos son obligatorios");
    echo json_encode($response);
    exit();
}

// Encriptar la contraseña
$contraseña_encriptada = password_hash($contraseña, PASSWORD_DEFAULT);

// Insertar datos en la base de datos
$sql = "INSERT INTO usuario (Nombres, Apellidos, Email, Num_celular, Id_documento, Numero_documento, Contraseña)
VALUES ('$Nombres', '$Apellidos', '$Email', '$Num_celular', '$id_documento', '$Numero_documento', '$contraseña_encriptada')";

if ($conn->query($sql) === TRUE) {
    $response = array("success" => true, "message" => "Usuario registrado exitosamente");
    echo json_encode($response);
} else {
    $response = array("success" => false, "message" => "Error al registrar usuario: " . $conn->error);
    echo json_encode($response);
}

// Cerrar conexión
$conn->close();
?>