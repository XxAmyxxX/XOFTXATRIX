<?php
session_start();
if ($_SESSION["Administrador"]!="1")
{
    header("location:salir.php")
}
?>