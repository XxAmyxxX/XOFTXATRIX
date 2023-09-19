<?php
include("conexion.php");



if (isset($_POST['id_producto'])) {
    $id_producto = $_POST['id_producto'];
    $nombre_producto = $_POST['nombre_producto'];
    $precio = $_POST['precio'];
    $id_Categoria = $_POST['id_Categoria'];
    $id_proveedor = $_POST['id_proveedor'];
    $Cantidad_productos = $_POST['Cantidad_productos'];

    $sql = "UPDATE producto SET nombre_producto='$nombre_producto', precio='$precio', id_Categoria='$id_Categoria', id_proveedor='$id_proveedor', Cantidad_productos='$Cantidad_productos' WHERE id_producto='$id_producto'";

    $query = mysqli_query($db, $sql);

    if ($query) {
        header("Location: vista_salud.php"); // Redireccionar a la página de vista después de la actualización.
    } else {
        echo "Error al actualizar el producto: " . mysqli_error($db);
    }
} else {
    echo "No se ha proporcionado un ID de producto válido.";
}
?>
