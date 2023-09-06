<?php

include("conexion.php");

if (isset($_POST['register'])) // la función isset() evalua si una variable esta definida.  
  {
   
      $Nombres = trim($_POST['Nombres']); //la función trim() me elimina los espacios en blanco u otros caracteres al inicio y al final de una cadena de caracteres.
      $Apellidos = trim($_POST['Apellidos']);
      $Email = trim($_POST['Email']);
      $Num_celular = trim($_POST['Num_celular']);
      $Id_documento = trim($_POST['Id_documento']);
      $Numero_documento = trim($_POST['Numero_documento']);
      $Contraseña = trim($_POST['Contraseña']);
      $consulta="INSERT INTO usuario(Nombres, Apellidos, Email, Num_celular, Id_documento, Numero_documento, Contraseña ) VALUES ('$Nombres','$Apellidos','$Email','$Num_celular','$Id_documento','$Numero_documento','$Contraseña')";
      $resultado=mysqli_query($db,$consulta);
      
      if($resultado)
      {
      header("Location:index.php");
      exit; 
     
     
     
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
          <center><a href="registro.php"><button type="button">VOLVER</button></a></center>
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
      }
  }
?>