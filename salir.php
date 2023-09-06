<?php
session_start();
$_SESSION["Documento"]="0";
$_SESSION["Administrador"]="0";
$_SESSION["Cajero"]="0";
header("location: index.php")
?>