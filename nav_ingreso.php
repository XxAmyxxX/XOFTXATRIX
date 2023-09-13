<?php
include("conexion.php");

//  valores del formulario
$usuario = $_POST['Numero_documento'];
$Contraseña = $_POST['contraseña'];

// Consulta SQL para obtener la contraseña almacenada en la base de datos
$sql = "SELECT Contraseña FROM usuario WHERE Numero_documento = '$usuario'";

if (!$result = $db->query($sql)) {
    die('Hay un error corriendo en la consulta o datos no encontrados!!! [' . $db->error . ']');
}

if ($row = $result->fetch_assoc()) {
    $hashed_password = $row["Contraseña"];

    // Verificar la contraseña proporcionada por el usuario
    if (password_verify($Contraseña, $hashed_password)) {
        // La contraseña es correcta, redirige al usuario a la página principal
        header("location: pres_usu.php");
        exit; // Termina el script para evitar que se procese más código innecesario
    }
}

// Si la contraseña no es correcta o el usuario no existe, puedes manejarlo aquí

// Cerrar la conexión
mysqli_close($db);
?>
