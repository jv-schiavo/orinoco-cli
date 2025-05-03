
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect(r'Database\Orinoco')
cursor = conn.cursor()

# Get user input
shopper_id = input("Enter your shopper ID: ")

# Query the database
cursor.execute("SELECT shopper_first_name FROM shoppers WHERE shopper_id = ?", (shopper_id,))
result = cursor.fetchone()


# Close the connection
conn.close()


