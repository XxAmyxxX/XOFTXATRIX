<?php

class Mamás
{  
    private $db;
    public function __construct()
    {
        include("conexion.php"); // Incluye el archivo de conexión a la base de datos.
        $this->db = $db;
        echo '<link rel="stylesheet" type="text/css" href="estilo_crud_mamás.css">';
    }
    public function listar ()
    {
        echo "<table border='2'>";  
       echo "<caption>  <div class='titulo-container'> MAMÁS Y BEBES
       </div></caption>";
      
        echo "<th>PRODUCTO</th>";
        echo "<th>PRECIO</th>";
        echo "<th>CATEGORIA</th>";
        echo "<th>PROVEEDOR</th>";
        echo "<th>CANTIDAD</th>";
        echo "<th>ELIMINAR</th>";
        echo "<th>ACTUALIZAR</th>";
        echo "</tr>";

       
            //Registrando en la BD
            
            $sql = "SELECT p.id_producto, p.nombre_producto, p.precio, p.Cantidad_productos, c.categorias, pr.proveedores
            FROM producto p
            INNER JOIN categorias c ON p.id_Categoria = c.id_Categoria
            INNER JOIN proveedor pr ON p.id_proveedor = pr.id_proveedor
            WHERE p.id_Categoria = 5";

if (!$result = $this->db->query($sql)) {
    die('Hay un error corriendo en la consulta o datos no encontrados!!! [' . $this->db->error . ']');
}
    while($row = $result->fetch_assoc())
    {

        $id_producto = $row["id_producto"]; 
        $nombre_producto = stripslashes($row["nombre_producto"]);
        $precio = stripcslashes($row["precio"]);
        $categorias = stripcslashes($row["categorias"]);
        $proveedores = stripcslashes($row["proveedores"]);
        $Cantidad_productos = stripcslashes($row["Cantidad_productos"]);

        echo "<tr>";
        echo "<td>$nombre_producto</td>";
        echo "<td>$precio</td>";
        echo "<td>$categorias</td>";
        echo "<td>$proveedores</td>";
        echo "<td>$Cantidad_productos</td>";  
 // eliminar un producto
            echo "<td>";
            echo "<form class=boton method='POST' action='eliminar_producto.php'>";
            echo "<input type='hidden' name='id_producto' value='$id_producto'>";
            echo "<input type='submit' value='Eliminar'>";
            echo "</form>";
            echo "</td>";
            

            // Actualizar un producto
            echo "<td>";
            echo "<form class=boton  method='POST' action='actualizar_producto.php'>";
            echo "<input name='id_producto' type='hidden' value='$id_producto'>";
            echo "<input type='submit' value='Actualizar'>";
            echo "</form>";
            echo "</td>";
            echo "</tr>";
        }
        echo "</table>";
        echo "<br/>";


// Formulario para insertar un nuevo producto
echo "<form method='POST' action='insertar_producto.php'>";
echo "<input type='text' name='nombre_producto' placeholder='Nombre del Producto'>";
echo "<input type='text' name='precio' placeholder='Precio'>";

// Desplegable categorías
$sql2 = "SELECT * FROM categorias WHERE id_Categoria='1'";
$result2 = mysqli_query($this->db, $sql2);
$catOptions = "<option value=''>Categoría</option>"; // Opción en blanco

if (mysqli_num_rows($result2) > 0) {
    while ($row2 = mysqli_fetch_assoc($result2)) {
        $id_Categoria = $row2["id_Categoria"];
        $categorias = $row2["Categorias"];
        // Agregar cada categoría como una opción
        $catOptions .= "<option value='$id_Categoria'>$id_Categoria-$categorias</option>";
    }
}

echo "<select name='id_Categoria'>$catOptions</select>"; // Muestra la lista desplegable

        // Desplegable proveedores
        $sql3 = "SELECT * FROM proveedor";
        $result3 = mysqli_query($this->db, $sql3);  
        $proOptions = "<option value=''>Proveedor</option>";  
        
        if (mysqli_num_rows($result3) > 0) {
            while ($row3 = mysqli_fetch_assoc($result3)) {
                $id_proveedor = $row3["id_proveedor"];
                $proveedores = $row3["proveedores"];
                // Agregar cada proveedor como una opción
                $proOptions .= "<option value='$id_proveedor'>$id_proveedor-$proveedores</option>";
            }
        }
        
        echo "<select name='id_proveedor'>$proOptions</select>";  // Muestra la lista desplegable

        echo "<input type='text' name='Cantidad_productos' placeholder='Cantidad'>";
        echo "<input type='submit' value='Insertar'>";
        echo "</form>";
    
        echo "<br/>";
        echo "<a href='../categorias.html'>Volver a Categorías</a>";

                    }//fin del método 
    }  //Find de la clase

    $final=new Mamás();
    $final->listar(); 

?>
