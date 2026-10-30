import os
from contextlib import contextmanager

from flask import Flask, flash, redirect, render_template, request, url_for
from mysql.connector import Error as MySQLError
from mysql.connector import IntegrityError
from werkzeug.security import generate_password_hash

from conectar import conexionDB

# Inicialización de la aplicación
app = Flask(__name__)
# Necesaria para flash(). En producción define SECRET_KEY en el entorno (.env).
app.config["SECRET_KEY"] = os.getenv("SECRET_KEY", "clave-solo-para-desarrollo")


@contextmanager
def conexion():
    """Abre una conexión a la BD y garantiza que se cierre siempre."""
    db = conexionDB()
    try:
        yield db
    finally:
        db.close()


# Ruta principal (Home / Dashboard)
@app.route("/")
def home():
    return render_template("index.html")


# Ruta para capturar y procesar el formulario
@app.route("/registrar", methods=["GET", "POST"])
def registrarAdmin():
    # Antes: un GET devolvía None y Flask respondía "500 Internal Server Error".
    if request.method == "GET":
        return redirect(url_for("home"))

    id_admin = request.form.get("cedula", "").strip()
    nombre = request.form.get("nombre", "").strip()
    correo = request.form.get("correo", "").strip()
    celular = request.form.get("celular", "").strip()
    password = request.form.get("password", "")

    if not all([id_admin, nombre, correo, celular, password]):
        flash("Todos los campos son obligatorios.", "error")
        return redirect(url_for("home"))

    # Insertar el registro de admin a la base de datos (la contraseña se guarda con hash)
    sql = (
        "INSERT INTO administradores (id_admin, nombre, correo, celular, contrasena) "
        "VALUES (%s, %s, %s, %s, %s)"
    )
    valores = (id_admin, nombre, correo, celular, generate_password_hash(password))

    try:
        with conexion() as db:
            cursor = db.cursor()
            cursor.execute(sql, valores)
            db.commit()
            cursor.close()
        flash(f"Administrador {nombre} registrado correctamente.", "ok")
    except IntegrityError:
        flash("Ya existe un administrador con esa cédula.", "error")
    except MySQLError:
        app.logger.exception("No se pudo registrar el administrador")
        flash("No se pudo guardar el registro. Revisa la conexión con la base de datos.", "error")

    # Patrón Post/Redirect/Get: recargar la página no vuelve a enviar el formulario.
    return redirect(url_for("home"))


@app.route("/usuario")
def listar_usuario():
    usuarios = []
    try:
        with conexion() as db:
            cursor = db.cursor(dictionary=True)
            # Solo las columnas que se muestran: la contraseña (hash) nunca llega a la plantilla.
            cursor.execute("SELECT id_admin, nombre, correo, celular FROM administradores")
            usuarios = cursor.fetchall()
            cursor.close()
    except MySQLError:
        app.logger.exception("No se pudo listar los administradores")
        flash("No se pudo conectar con la base de datos.", "error")

    return render_template("admin.html", usuarios=usuarios)


# --- Rutas que la tabla (listar.html) ya referenciaba con url_for() pero no existían ---
@app.route("/editar/<string:id_admin>", methods=["GET", "POST"])
def editar_admin(id_admin):
    try:
        with conexion() as db:
            cursor = db.cursor(dictionary=True)

            if request.method == "POST":
                nombre = request.form.get("nombre", "").strip()
                correo = request.form.get("correo", "").strip()
                celular = request.form.get("celular", "").strip()
                password = request.form.get("password", "")

                if not all([nombre, correo, celular]):
                    flash("Nombre, correo y celular son obligatorios.", "error")
                    return redirect(url_for("editar_admin", id_admin=id_admin))

                if password:  # contraseña en blanco = no cambiarla
                    cursor.execute(
                        "UPDATE administradores SET nombre=%s, correo=%s, celular=%s, contrasena=%s "
                        "WHERE id_admin=%s",
                        (nombre, correo, celular, generate_password_hash(password), id_admin),
                    )
                else:
                    cursor.execute(
                        "UPDATE administradores SET nombre=%s, correo=%s, celular=%s WHERE id_admin=%s",
                        (nombre, correo, celular, id_admin),
                    )
                db.commit()
                cursor.close()
                flash("Administrador actualizado correctamente.", "ok")
                return redirect(url_for("listar_usuario"))

            cursor.execute(
                "SELECT id_admin, nombre, correo, celular FROM administradores WHERE id_admin=%s",
                (id_admin,),
            )
            admin = cursor.fetchone()
            cursor.close()
    except MySQLError:
        app.logger.exception("No se pudo editar el administrador")
        flash("No se pudo completar la operación con la base de datos.", "error")
        return redirect(url_for("listar_usuario"))

    if admin is None:
        flash("El administrador no existe.", "error")
        return redirect(url_for("listar_usuario"))
    return render_template("editar.html", admin=admin)


@app.route("/eliminar/<string:id_admin>", methods=["POST"])
def eliminar_admin(id_admin):
    try:
        with conexion() as db:
            cursor = db.cursor()
            cursor.execute("DELETE FROM administradores WHERE id_admin=%s", (id_admin,))
            db.commit()
            borrados = cursor.rowcount
            cursor.close()
        if borrados:
            flash("Administrador eliminado.", "ok")
        else:
            flash("El administrador no existe.", "error")
    except IntegrityError:
        flash("No se puede eliminar: el administrador tiene registros asociados.", "error")
    except MySQLError:
        app.logger.exception("No se pudo eliminar el administrador")
        flash("No se pudo completar la operación con la base de datos.", "error")
    return redirect(url_for("listar_usuario"))


# Página de demostración (datos fijos, sin base de datos): sirve para comprobar
# que Bootstrap y DataTables cargan bien, aunque MySQL no esté encendido.
@app.route("/demo-tabla")
def demo_tabla():
    return render_template("tabla5.html")


# Punto de entrada para ejecutar la aplicación en desarrollo (python app.py).
# En producción se usa gunicorn (ver Procfile) y debug NUNCA debe estar activo.
if __name__ == "__main__":
    app.run(
        debug=os.getenv("FLASK_DEBUG", "0") == "1",
        host=os.getenv("HOST", "127.0.0.1"),
        port=int(os.getenv("PORT", "5000")),
    )
