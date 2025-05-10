import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from process.connection import connect_db

def prod_categories(shopper_id):
    conn = connect_db()
    cursor = conn.cursor()
    
    # Input the user to choose a category

    cursor.execute("""SELECT category_id,category_description
    FROM categories
    ORDER BY category_description ASC 
    """)
    
    rows = cursor.fetchall()

    print("\nIndex | Product Category")
    print("-" * 30)

    # Table with category and index
    
    for i, row in enumerate(rows, start=1):
        print(f"{i:<5} | {row['category_description']}")

    while True:
        try:
            cat_choice = int(input("\nEnter the number of category product desired: "))
            if 0 <= cat_choice <= len(rows):
                chosen_row = rows[cat_choice - 1]
                category_id = chosen_row['category_id']
                break
                
            else:
                print(f"\nPlease enter a number between 1 and {len(rows)}.")
        except ValueError:
            print(f"\nInvalid input. Please enter a number 1 to {len(rows)}.")
            continue  


    cursor.execute(
        """SELECT product_id, category_id, product_description
                FROM products
                WHERE product_status = "Available" AND category_id = ?
                ORDER BY product_description ASC
            """,(category_id, ))     

    prod_rows = cursor.fetchall()

    if prod_rows:
        print("\nIndex | Product")
        print("-" * 30)

        for j, prod_row in enumerate(prod_rows, start=1):
            print(f"{j:<5} | {prod_row['product_description']}")
    else:
        print("No available products found in this category.")

    while True:
        try:
            prod_choice =  int(input("\nEnter the number of product desired: "))
            if 0 <= prod_choice <= len(prod_rows):
                chosen_prod_row = prod_rows[prod_choice - 1]
                product_id = chosen_prod_row['product_id']
                break
            else:
                print(f"\nPlease enter a number between 1 and {len(prod_rows)}.")
        except ValueError:
            print(f"\nInvalid input. Please enter a number 1 to {len(prod_rows)}.")
            continue      

    cursor.execute(
        """SELECT ps.product_id, ps.seller_id, ps.price, s.seller_name
            FROM product_sellers ps
            JOIN sellers s ON ps.seller_id = s.seller_id
            WHERE product_id = ?
            ORDER BY s.seller_name ASC
            """, (product_id,))

    seller_rows = cursor.fetchall()

    if seller_rows:
        print(f"\n Index|    Seller Name      | Price")
        print("-" * 40)

        for k, seller_row in enumerate(seller_rows, start=1):
            print(f"{k:<5} | {seller_row['seller_name']:<20} | £{seller_row['price']}")

    else:
        print("No available seller found for this product.")

    while True:
        try:
            seller_choice =  int(input("\nEnter the number of the desired seller: "))
            if 0 <= seller_choice <= len(seller_rows):
                chosen_seller_row = seller_rows[seller_choice - 1]
                seller_id = chosen_seller_row['seller_id']
                price = chosen_seller_row['price']
                break
            else:
                print(f"Please enter a number between 1 to {len(seller_rows)}")
        except ValueError:
            print(f"\nInvalid input. Please enter a number 1 to {len(seller_rows)}.")
            continue

    
    while True:
        try:
            qty = int(input("\nEnter the quantity of the selected product desired: "))
            if qty > 0:
                quantity = qty
                break
            else:
                qty
        except ValueError:
            print("\nInvalid input. Please enter a valid integer.")  
            continue      

    
    cursor.execute("""
                SELECT basket_id
    FROM shopper_baskets
    WHERE shopper_id = ?
    AND DATE(basket_created_date_time)=DATE('now')
    ORDER BY basket_created_date_time DESC
    LIMIT 1
                   """,(shopper_id,))
    
    basket_row = cursor.fetchone()
            
    
    if basket_row:
        basket_id = basket_row['basket_id']
    else:
        cursor.execute("""
                INSERT INTO shopper_baskets (shopper_id, basket_created_date_time)
                VALUES (?, DATETIME('now'))
            """, (shopper_id,))
        basket_id = cursor.lastrowid
        

       
    # Insert OR update
    cursor.execute("""
        SELECT quantity FROM basket_contents
        WHERE basket_id = ? AND product_id = ?
    """, (basket_id, product_id))
    existing_row = cursor.fetchone()

    if existing_row:
        new_quantity = existing_row['quantity'] + quantity
        cursor.execute("""
            UPDATE basket_contents
            SET quantity = ?, price = ?
            WHERE basket_id = ? AND product_id = ?
        """, (new_quantity, price, basket_id, product_id))
        print("\nProduct already in basket. Quantity updated.")
    else:
        cursor.execute("""
            INSERT INTO basket_contents (basket_id, product_id, seller_id, quantity, price)
            VALUES (?, ?, ?, ?, ?)
        """, (basket_id, product_id, seller_id, quantity, price))
        print("\nItem successfully added to your basket.")


    conn.commit()

    conn.close()
    return category_id, product_id, seller_id, quantity, price








if __name__ == "__main__":
    prod_categories(shopper_id=10000)    



        


