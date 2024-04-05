<?php
session_start();
include("conexion.php"); 

$usuario = $_SESSION['usuario'];

?>

<form method="post">

    <button type="submit" name="mostrarRoles" class="btn">Mostrar Roles</button>
</form>

<div id="rolesContainer">
    <?php
    $usuario = $_SESSION['usuario'];
    if (isset($_POST["mostrarRoles"])) {
        $sql = "SELECT ur.id_rol, r.Roles FROM usuariorol ur
                INNER JOIN roles r ON ur.id_rol = r.Id_ROL
                WHERE ur.Numero_documento = '$usuario'";
        $resultado = mysqli_query($db, $sql);

        if (mysqli_num_rows($resultado) > 0) {
            echo "<form method='post'>";
            echo "<label for='rolSeleccionado'>Selecciona un rol:</label>";
            echo "<select name='rolSeleccionado'>";
            while ($row = mysqli_fetch_assoc($resultado)) {
                $id_ROL = $row["id_rol"];
                $rol = $row["Roles"];
                echo "<option value='$id_ROL'>$rol</option>";
            }
            echo "</select>";
            echo "<button type='submit' name='ir'>Ir a la página</button>";
            echo "</form>";
        } else {
            echo "Número de Documento: $usuario -- No se encontraron roles activos.<br/>";
        }
    }

    // Redirección basada en el rol seleccionado
    if (isset($_POST["ir"])) {
        $id_rol_seleccionado = $_POST["rolSeleccionado"];

        if ($id_rol_seleccionado == "1") {
            header("Location: pres_admin.php");
            $_SESSION["Administrador"]="1"; 
            exit;
        } elseif ($id_rol_seleccionado == "2") {
            header("Location: pres_cajero.php");
            $_SESSION["Cajero"]="1"; 
            exit;
        } elseif ($id_rol_seleccionado == "3") {
            header("Location: pres_usu.php");
            $_SESSION["usuario"]="1"; 
            exit;
        }
    }
    
    ?>
</div>
