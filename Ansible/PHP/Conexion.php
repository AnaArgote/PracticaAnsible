<?php
class ConnectionDb{
    private $connection;

    public function getConnection(){
        $hostname = 'localhost'; // Cambia esto al nombre de tu servidor MySQL
        $username = 'root'; // Cambia esto a tu nombre de usuario de MySQL
        $password = 'ana123'; // Cambia esto a tu contraseña de MySQL
        $database = 'Mexihat'; // Cambia esto al nombre de tu base de datos
        
        try {
            // Crea una instancia PDO
            $pdo = new PDO("mysql:host=$hostname;dbname=$database", $username, $password);
            // Configura el modo de error de PDO para que lance excepciones en caso de errores
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $pdo;
        } catch (PDOException $e) {
            // Captura cualquier excepción que pueda ocurrir durante la conexión o la ejecución de la consulta
            echo "Error: " . $e->getMessage();
        }
    }
}

?>