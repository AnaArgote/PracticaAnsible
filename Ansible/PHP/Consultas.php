<?php
include 'Conexion.php';
class Consultas extends ConnectionDb{
    public function insertarTipo($TipoSombreroNombre){
        $cmd = $this->getConnection()->prepare('call insertar_TipoSombrero(:TipoSombreroNombre)');
        $cmd-> bindParam(':TipoSombreroNombre',$TipoSombreroNombre);
        $cmd->execute();

        if($reader = $cmd->fetchAll()){
            $basic_info = $reader;
            return json_encode($reader);
        }else{
            return  'No se pudo leer';
        }
        }
    public function leerTipo(){
        $cmd = $this->getConnection()->prepare('select TipoSombreroId, TipoSombreroNombre from TipoSombrero');
        $cmd->execute();

        if($reader = $cmd->fetchAll()){
            $basic_info = $reader;
            return json_encode($reader);
        }else{
            return  'No se pudo leer';
        }   
    }
}
   
?>