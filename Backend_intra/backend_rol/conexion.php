<?php
function retornarConexion() {
  $con=mysqli_connect("localhost","root","","intradroxinet");
  return $con;
}
?>