var tabla = document.getElementById('tblTipos');
var entradaTipo = document.getElementById('tipo');
function codigoFuncion() {
    var peticion = new XMLHttpRequest(); //Hacer petición a backend
    peticion.open('GET', 'http://192.168.1.74/Ansible/PHP/LeerTipo.php');
    peticion.send(); //Enviar petición
    peticion.onload = function () {
        console.log(peticion.responseText);
        var objJson = JSON.parse(peticion.responseText);
        
        var fila;
        var Id;
        var Tipo;
        objJson.forEach(element => {
            fila = tabla.insertRow();
            Id = fila.insertCell(0);
            Tipo = fila.insertCell(1);
            Id.innerHTML = element.TipoSombreroId;
            Tipo.innerHTML = element.TipoSombreroNombre;
        });
    }
}
window.onload = function(){
    codigoFuncion();
}
