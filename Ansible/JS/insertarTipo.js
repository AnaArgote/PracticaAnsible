var txtTipo = document.getElementById('tipo');
var btnGuardar = document.getElementById('btnGuardarTipo');

btnGuardar.onclick = function () {
    codigoFuncion();

}

function codigoFuncion() {
    var peticion = new XMLHttpRequest(); //Hacer petición a backend
    peticion.open('POST', 'http://192.168.1.75/PHP/InsertarTipo.php');
    var parametros = new FormData(); //Poner parametros
    parametros.append('TipoSombrero', txtTipo.value);
    peticion.send(parametros); //Enviar petición
    //Evento que espera respuesta de API
    peticion.onload = function () {
        console.log(peticion.responseText);
        var objeto = JSON.parse(peticion.responseText)[0];
        console.log(objeto.Code);
        //Validación de datos con respuesta de API
        if (objeto.Code == 1) {
            swal.fire({
                title: 'Registrado correctamente ',
                icon: 'success',
                confirmButtonText: 'Ok',
                text: objeto.Message
            }).then((result) => {
                
            });
        }
        else {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: objeto.Message
            })
        }
    }
}