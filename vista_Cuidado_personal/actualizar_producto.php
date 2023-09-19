<?php
include("conexion.php");

$id_producto = $_POST['id_producto'];

$sql = "SELECT * FROM producto WHERE id_producto='$id_producto'";
$query = mysqli_query($db, $sql);

if (!$query) {
    die('Error al obtener datos del producto: ' . mysqli_error($db));
}

$row = mysqli_fetch_array($query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Actualizar Producto</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
            <h1 style='text-shadow: 5px 2px 3px indianred; font-family: Felix Titling'>ACTUALIZAR DATOS</h1>
        </div>
        <div class="col-sm-12 col-md-8 p-3 mb-2 p-3 mb-2 bg-info text-dark">
        <form action="update.php" method="POST">
                <input type="hidden" name="id_producto" value="<?php echo $row['id_producto']; ?>">
                <h3>PRODUCTO</h3>
                <input type="text" class="form-control mb-3" name="nombre_producto" placeholder="Producto" value="<?php echo $row['nombre_producto']; ?>">
                <h3>PRECIO</h3>
                <input type="text" class="form-control mb-3" name="precio" placeholder="Precio" value="<?php echo $row['precio']; ?>">
                <h3>CATEGORÍA</h3>
                <input type="text" class="form-control mb-3" name="id_Categoria" placeholder="Categoría" value="<?php echo $row['id_Categoria']; ?>">
                <h3>PROVEEDOR</h3>
                <input type="text" class="form-control mb-3" name="id_proveedor" placeholder="Proveedor" value="<?php echo $row['id_proveedor']; ?>">
                <h3>CANTIDAD</h3>
                <input type="text" class="form-control mb-3" name="Cantidad_productos" placeholder="Cantidad" value="<?php echo $row['Cantidad_productos']; ?>">
                <input type="submit" class="btn btn-primary btn-block" value="Actualizar">
            </form>
        </div>
    </div>
</div>
</body>
</html>
