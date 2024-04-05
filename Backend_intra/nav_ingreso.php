<?php
include("conexion.php");
session_start();

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $json = file_get_contents('php://input');
    $data = json_decode($json);

    if (isset($data->Numero_documento) && isset($data->contraseña)) {
        $usuario = $data->Numero_documento;
        $Contraseña = $data->contraseña;

        // Consulta SQL para obtener la contraseña del usuario
        $sql = "SELECT Contraseña FROM usuario WHERE Numero_documento = '$usuario'";
        if ($result = $db->query($sql)) {
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $hashed_password = $row["Contraseña"];

                // Verificar la contraseña
                if (password_verify($Contraseña, $hashed_password)) {
                    // Consulta SQL para obtener el rol del usuario
                    $sql_rol = "SELECT id_rol FROM usuariorol WHERE Numero_documento = '$usuario'";
                    if ($result_rol = $db->query($sql_rol)) {
                        if ($result_rol->num_rows > 0) {
                            $row_rol = $result_rol->fetch_assoc();
                            $id_rol = $row_rol["id_rol"];

                            // Guardar el ID del rol en la sesión
                            $_SESSION['id_rol'] = $id_rol;

                            // Redirigir al usuario según su rol
                            if ($id_rol == 1) {
                                header('Content-Type: application/json');
                                echo json_encode(array("success" => true, "role" => "admin"));
                            } else if ($id_rol == 2) {
                                header('Content-Type: application/json');
                                echo json_encode(array("success" => true, "role" => "cajero"));
                            } else {
                                header('Content-Type: application/json');
                                echo json_encode(array("success" => false, "message" => "Rol no definido."));
                            }
                            exit();
                        } else {
                            header('Content-Type: application/json');
                            echo json_encode(array("success" => false, "message" => "Usuario sin rol asignado."));
                            exit();
                        }
                        $result_rol->free();
                    } else {
                        header('Content-Type: application/json');
                        echo json_encode(array("success" => false, "message" => "Error en la consulta del rol."));
                        exit();
                    }
                } else {
                    header('Content-Type: application/json');
                    echo json_encode(array("success" => false, "message" => "Contraseña incorrecta."));
                    exit();
                }
            } else {
                header('Content-Type: application/json');
                echo json_encode(array("success" => false, "message" => "Usuario no encontrado."));
                exit();
            }
            $result->free();
        } else {
            header('Content-Type: application/json');
            echo json_encode(array("success" => false, "message" => "Error en la consulta de la contraseña."));
            exit();
        }
    } else {
        header('Content-Type: application/json');
        echo json_encode(array("success" => false, "message" => "Datos del formulario no recibidos correctamente."));
        exit();
    }
}

mysqli_close($db);
exit();
?>
