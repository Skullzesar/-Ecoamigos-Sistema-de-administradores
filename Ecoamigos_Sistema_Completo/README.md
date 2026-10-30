# 🌱 Ecoamigos — Sistema de administradores

Aplicación web en **Flask + MySQL** para registrar, listar, editar y eliminar administradores
de la plataforma de reciclaje *Ecoamigos* (base de datos `sistema_recoleccion`).
Interfaz con HTML/CSS propio, **Bootstrap 4** y **DataTables** (tabla con búsqueda y paginación).

## Estructura

```
Ecoamigos_Sistema_Completo/
├── src/
│   ├── app.py                 # Rutas Flask
│   ├── conectar.py            # Conexión a MySQL (lee variables de entorno)
│   ├── templates/             # Plantillas Jinja2 (parciales con prefijo "_")
│   └── static/
│       ├── css/  js/  img/    # Código propio
│       └── vendor/            # Copia local de Bootstrap, jQuery y DataTables (respaldo del CDN)
├── database/schema.sql        # Tabla "administradores"
├── requirements.txt  Procfile  .env.example  .gitignore
```

## Ejecutar en local

```bash
# 1) Entorno virtual (NO se sube a Git)
python -m venv venv
venv\Scripts\activate            # Windows   |   source venv/bin/activate   (Linux/macOS)

# 2) Dependencias
pip install -r requirements.txt

# 3) Configuración: copia .env.example a .env y pon tu usuario/contraseña de MySQL
copy .env.example .env           # Windows   |   cp .env.example .env

# 4) Base de datos: ejecuta database/schema.sql en MySQL Workbench

# 5) Iniciar
python src/app.py                # http://127.0.0.1:5000
```

Páginas: `/` (registrar) · `/usuario` (listar) · `/demo-tabla` (prueba de Bootstrap/DataTables sin base de datos).

## Cómo cargan Bootstrap y DataTables

Cada página los pide al CDN **jsDelivr** (versión exacta + hash `integrity`). Si el CDN no responde
—red bloqueada, sin internet, etc.— `static/js/vendor-loader.js` usa automáticamente las copias de
`static/vendor/`. Orden obligatorio: Bootstrap → DataTables → CSS propios; jQuery → DataTables → plugins.

Versiones: Bootstrap 4.6.2 · jQuery 3.7.1 · DataTables 1.11.5 · Responsive 2.2.9.

## Despliegue

- Variables de entorno en el servidor: `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASSWORD`, `DB_NAME`, `SECRET_KEY`, `FLASK_DEBUG=0`.
- Comando de arranque: `gunicorn --chdir src app:app` (ya está en el `Procfile`).
- Se necesita un MySQL accesible desde el servidor (no sirve `localhost` de tu PC).

## Seguridad — pendiente

- No hay inicio de sesión: cualquiera con la URL puede ver/editar/eliminar administradores. Añade autenticación antes de publicar.
- Los formularios no tienen protección CSRF (considera Flask-WTF).
