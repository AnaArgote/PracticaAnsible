<?php
header("Access-Control-Allow-Origin:*");
header("Access-Control-Allow-Headers: content-type");
header("Access-Control-Allow-Methods: OPTIONS,GET,PUT,POST,DELETE");
include 'Consultas.php';

    $instancia = new Consultas();
    echo $instancia->leerTipo();

?>