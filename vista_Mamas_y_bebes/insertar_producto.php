<?php
include("conexion.php");


$id_producto = $_POST['id_producto'];
$nombre_producto = $_POST['nombre_producto'];
$precio = $_POST['precio'];
$categorias = $_POST['categorias'];
$id_Categoria = $_POST['id_Categoria'];
$proveedores = $_POST['proveedores'];
$id_proveedor= $_POST['id_proveedor'];
$Cantidad_productos = $_POST['Cantidad_productos'];

$sql="INSERT INTO producto VALUES('$id_producto','$nombre_producto','$precio','$id_Categoria','$id_proveedor','$Cantidad_productos')";
$query= mysqli_query($db,$sql);

if($query){
    Header("Location: vista_salud.php");
    
}else {
}
?>

<?php

