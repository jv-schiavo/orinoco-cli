import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))


from process.connection import connect_db

def login():
    shopper_id = int(input("Enter your shopper_id:\n"))
    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute(
        """SELECT shopper_first_name, shopper_id
        FROM shoppers
        WHERE shopper_id = ? """, (shopper_id,)
    )
    row = cursor.fetchone()

    if row is None:
        return None, None
    
    else:
        shopper_first_name = row['shopper_first_name']
        return shopper_id, shopper_first_name


