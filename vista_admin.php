<?php
include("seguridad_admin.php");
?>
<html>
    
    <head>
       
 <!-- CSS only -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
 <!-- JavaScript Bundle with Popper -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
 
        

 </head>
    <body> 

      <link rel="stylesheet" href="estilo html.css">
      <link rel="stylesheet" href="botones.css">
          <!--Inicio Navbar-->
          <nav class="navbar navbar-expand-lg">
            <a class="navbar-brand companyBrand" href="index.html"><img src="img/IdentidadDroxi.svg" width="115%" height="70px">
            </a>
            <div class="container-fluid">
              
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.html">INICIO</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="categorias.html">CATEGORIAS</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="">REPORTES</a>
                  </li>
                  
                </ul>
                
              </div>
              
               <form method="get" action="index.html">
                <button class="btn">SOY ADMIN</button>
             </form>
  
              
            </div> 
            <form method="get" action="index.php">
               <button class="btn1" ></button>
            </form>
            
            <a href="salir.php">Cerrar Sesión</a>
 
          </nav></div>
          
    <!--Fin Navbar-->

    </body>

    <div class="footer">
      <footer>
        <p> Elaborado por: XOFXATRIX </p>
    </footer>  </div> 
</html>
