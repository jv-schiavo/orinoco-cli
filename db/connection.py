import sqlite3

def connect_db():
    print("📡 Connecting to the database...")
    conn = sqlite3.connect(r"C:\Users\Joao Victor\OneDrive\Documentos\VS-Code\Database\Orinoco") 
    conn.row_factory = sqlite3.Row
    return conn

