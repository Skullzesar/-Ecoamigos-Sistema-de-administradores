"""Conexión a MySQL.

Las credenciales NO se escriben en el código: se leen de variables de entorno,
que en desarrollo se cargan desde un archivo `.env` (ignorado por Git).
Copia `.env.example` como `.env` y completa tus datos.
"""
import os

import mysql.connector
from dotenv import load_dotenv

# Busca un archivo .env hacia arriba desde esta carpeta (raíz del proyecto).
load_dotenv()


def conexionDB():
    """Devuelve una conexión nueva a MySQL. Quien la use debe cerrarla."""
    return mysql.connector.connect(
        host=os.getenv("DB_HOST", "localhost"),
        port=int(os.getenv("DB_PORT", "3306")),
        user=os.getenv("DB_USER", "root"),
        password=os.getenv("DB_PASSWORD", ""),
        database=os.getenv("DB_NAME", "sistema_recoleccion"),
        connection_timeout=5,
    )
