// script.js - Lógica común del Sistema Ecoamigos
// (Las pestañas Registrar/Listar ahora son enlaces <a> y el formulario se envía
//  directamente al servidor, así que ya no hace falta JavaScript para ellos.)

document.addEventListener('DOMContentLoaded', () => {
    const btnExit = document.getElementById('btn-exit');

    // Botón de salida
    if (btnExit) {
        btnExit.addEventListener('click', (e) => {
            e.preventDefault();
            if (confirm('¿Está seguro de que desea salir del sistema Ecoamigos?')) {
                alert('Sesión finalizada.');
            }
        });
    }
});
