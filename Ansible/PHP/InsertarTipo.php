<?php
header("Access-Control-Allow-Origin:*");
header("Access-Control-Allow-Headers: content-type");
header("Access-Control-Allow-Methods: OPTIONS,GET,PUT,POST,DELETE");
include 'Consultas.php';
if(isset($_POST['TipoSombrero'])){
    $TipoSombrero = $_POST['TipoSombrero'];
    $instancia = new Consultas();
    echo $instancia->insertarTipo($TipoSombrero);
}
else{
    echo 'Petición inválida';
}

?>