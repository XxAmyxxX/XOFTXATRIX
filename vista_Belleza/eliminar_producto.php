<?php

class Salud
{
    public function eliminar($id_producto)
    { 
        include("conexion.php");

        mysqli_query($db,"DELETE FROM producto WHERE id_producto = $id_producto");
        header("Location: vista_salud.php");
        exit(); // Agrega una salida para evitar ejecución adicional
    }
}

$final = new Salud();

if (isset($_POST['id_producto'])) {
    // Llamar al método eliminar con el ID de producto
    $final->eliminar($_POST['id_producto']);
} else {
    echo "ID de producto no proporcionado.";
}
?>
