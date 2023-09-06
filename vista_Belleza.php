<?php

class Salud
{  
    public function listar ()
    {
        echo "<table border='2'>";
        echo "<tr bgcolor='#FCB7EE'>";
        echo "<th>";
        echo "PRODUCTO";
        echo "</th>";
        echo "<th>";
        echo "PRECIO";
        echo "</th>";
        echo "<th>";
        echo "CATEGORIA";
        echo "</th>";
        echo "<th>";
        echo "PROVEEDOR";
        echo "</th>";
        echo "<th>";
        echo "Eliminar campo";
        echo "</th>";
         echo "</tr>";

       
            //Registrando en la BD
            
            echo "<br/>";
           include("conexion.php");
            $sql = "SELECT p.nombre_producto, p.precio, c.categorias, pr.proveedores
            FROM producto p
            INNER JOIN categorias c ON p.id_Categoria = c.id_Categoria
            INNER JOIN proveedor pr ON p.id_proveedor = pr.id_proveedor
            WHERE p.id_Categoria = 2";
    

if(!$result= $db->query($sql)){

    die('Hay un error corriendo en la consulta o datos no encontrados!!! [' .$db->error. ']');
}
    while($row = $result->fetch_assoc())
    {

    $nnombre_producto=stripslashes($row["nombre_producto"]);
    $pprecio=stripcslashes($row["precio"]);
 $ccategorias=stripcslashes($row["categorias"]);
 $pproveedores=stripcslashes($row["proveedores"]);
echo "<tr>";
echo "<td>";
echo "$nnombre_producto";
echo "</td>";
echo "<td>";
echo "$pprecio";
echo "</td>";
echo "<td>";
echo "$ccategorias";
echo "</td>";  
echo "<td>";
echo "$pproveedores";
echo "</td>";  
echo "<td>";
echo "<form method='POST' action='dat_eliminar_permiso.php'>";
            echo "<input name='nombre_producto' type='hidden' value='$nnombre_producto'>";
            echo "<input type='submit' value='Eliminar'>";
            echo "</form>";
echo "</td>";
echo "</tr>";

                }
echo "</table>";

                    }//fin del método 
    }  //Find de la clase

    $final=new Salud();
    $final->listar(); 
    echo "<br/>";
echo "<br/>";

  echo "<a href='categorias.html'>Volver a Categorías</a>";
?>
