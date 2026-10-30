/*
 * vendor-loader.js
 * Carga Bootstrap, jQuery y DataTables desde el CDN (jsDelivr) y, si el CDN no
 * responde (red bloqueada, sin internet, hash SRI que no coincide, etc.), usa
 * automáticamente las copias locales de static/vendor/.
 */
(function (global) {
  "use strict";

  var ESPERA_CSS_MS = 5000; // si una hoja de estilos no carga en este tiempo, se usa la local

  // --- CSS ---------------------------------------------------------------
  // Se usa desde el atributo onerror de cada <link>. La ruta local viene en data-local.
  function respaldoCss(link) {
    if (!link || !link.parentNode || !link.dataset.local) return;
    var local = document.createElement("link");
    local.rel = "stylesheet";
    local.href = link.dataset.local;
    console.warn("[EcoVendor] CDN no disponible para CSS, usando copia local:", link.dataset.local);
    link.parentNode.insertBefore(local, link); // misma posición => se conserva el orden de la cascada
    link.parentNode.removeChild(link);
  }

  // Comprueba pasado un tiempo que cada hoja de estilos con respaldo se haya aplicado.
  function vigilarCss() {
    setTimeout(function () {
      var enlaces = document.querySelectorAll("link[data-local]");
      Array.prototype.forEach.call(enlaces, function (link) {
        if (!link.sheet) respaldoCss(link);
      });
    }, ESPERA_CSS_MS);
  }

  // --- JS ----------------------------------------------------------------
  function cargarScript(atributos) {
    return new Promise(function (resolve, reject) {
      var s = document.createElement("script");
      s.async = false; // conserva el orden de ejecución
      s.src = atributos.src;
      if (atributos.integrity) {
        s.integrity = atributos.integrity;
        s.crossOrigin = "anonymous";
      }
      s.onload = function () { resolve(); };
      s.onerror = function () { reject(new Error("No se pudo cargar " + atributos.src)); };
      document.head.appendChild(s);
    });
  }

  function cargarConRespaldo(recurso) {
    return cargarScript({ src: recurso.cdn, integrity: recurso.integrity }).catch(function () {
      console.warn("[EcoVendor] CDN no disponible, usando copia local:", recurso.local);
      return cargarScript({ src: recurso.local });
    });
  }

  // Carga la lista EN ORDEN (cada script depende del anterior: jQuery -> DataTables -> ...).
  function cargarScripts(lista) {
    return lista.reduce(function (previa, recurso) {
      return previa.then(function () { return cargarConRespaldo(recurso); });
    }, Promise.resolve());
  }

  global.EcoVendor = { respaldoCss: respaldoCss, vigilarCss: vigilarCss, cargarScripts: cargarScripts };
})(window);
