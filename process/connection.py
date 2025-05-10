import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

import sqlite3

def connect_db():
    conn = sqlite3.connect(r"C:\Users\Joao Victor\OneDrive\Documentos\VS-Code\Database\Orinoco")
    conn.execute("PRAGMA foreign_keys = ON")
    conn.row_factory = sqlite3.Row
    return conn


