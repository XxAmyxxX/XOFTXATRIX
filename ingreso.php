<?php

include("conexion.php");

// colocamos las variables que vienen del formulario en variables 
$usuario = $_GET['Numero_documento'];
$password = $_GET['contraseña'];

// consultar la tabla usuario

$res_usuario = $db->query("select * from usuario where Numero_documento = '$usuario' and contraseña = '$password'");
// necesitamos el numero de registros de esta consulta
$num_reg = $res_usuario->num_rows;
if ( $num_reg == 1)
	{ 
	// mostrar la pagina principal
	header("location:index.html");

    }

else
 
	{
		?>
           <div class="campos">
           <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <script>
        window.alert("Por favor complete los campos");
       </script>
        
          <center><h4> vuelva para completarlos</h4></center>
         <center><a href="index.php"><button type="button">VOLVER</button></a></center>
          <link href="estilo php.css" type="text/css" rel="stylesheet">
          <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
          </div>
          <?PHP
	
	// cerrar la conexión
	mysqli_close($db);
	
	}
	
	 
?>
