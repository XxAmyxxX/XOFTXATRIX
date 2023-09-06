
<!DOCTYPE html>
<html>
  
    <head>
    <title>
    conexion base de datos + php + intradroxinet
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />   
          <div class="div4"> 
            
        <body>  
            
    <link rel="stylesheet" href="A.css">

          <section class="form_wrap">

<section class="cantact_info">
    <section class="info_title">
        <span class="fa fa-user-circle"></span>
        <h2></h2>
    </section>
   
</section>

<form action="ingreso.php" class="form_contact">
    
    <br>
    <br>
    <h1>LOGIN</h1>
    <br>
    <br>
    <br>
    <br>
    <div class="user_info">
        <label for="Numero_documento"><h2>Documentos</h2> </label>
        
        <input type="text" name="Numero_documento" id="Numero_documento" placeholder="ingrese el usuario"></imput>  


        <label for="contraseña"><h2>Contraseña</h2> </label>

        <input type="password" name="contraseña" id="contraseña" placeholder="ingrese la contraseña"></imput>
        
       
<center> <input type="submit"  name="button" id="button" value=" Recuperar contraseña"/>
       <center> <input type="submit"  name="button" id="button" value=" Entrar"/>
       <a href="registrarse.html"> Registrarse </a> </center>
    </div>
</form>

</section>

          
</body>
</div> 
        <br>
        <br>
        <br>
        <br>
        <br>
   
<footer>
    <p> Elaborado por: XOFXATRIX </p>
</footer>   
    </head>
    
</html>

<?php
session_start();
$_SESSION["Documento"];
$_SESSION["Administrador"];
$_SESSION["Cajero"];
?>