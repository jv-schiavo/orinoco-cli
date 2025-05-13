import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))


from process.connection import connect_db
from tui.display_basket import display_basket


def change_qty(shopper_id):

    rows = display_basket(shopper_id)

    if not rows:
        return

    if len(rows) == 1:
            chosen_item = rows[0]
            print(f"\nOnly one item found: {chosen_item['product_description']}")
    else:        
        while True:
                try:
                    item_choice = int(input("\nEnter the basket item no. of the item you want to change:"))
                    if 0 < item_choice <= len(rows):
                        chosen_item = rows[item_choice - 1]
                        print(f"You have chosen: {chosen_item['product_description']}")
                        break
                    else:
                        print("\nThe basket item no. you have entered is invalid")
                        item_choice
                except ValueError:
                    print("\nInvalid input. Please enter a number.")

    while True:
        try:
            new_qty = int(input("\nEnter the new quantity of the selected product you want to buy:"))
            if new_qty > 0:
                break
            else:
                print("\nThe quantity must be greater than 0")
                new_qty
        except ValueError:
            print("\nInvalid input. Please enter a number.")           

    conn = connect_db()
    cursor = conn.cursor()

    cursor.execute("""
                SELECT basket_id
    FROM shopper_baskets
    WHERE shopper_id = ?
    AND DATE(basket_created_date_time)=DATE('now')
    ORDER BY basket_created_date_time DESC
    LIMIT 1
                   """,(shopper_id,))
    
    basket_row = cursor.fetchone()
    
    if not basket_row:
        print("No basket found for today.")
        return
    
    basket_id = basket_row["basket_id"]
    product_id = chosen_item["product_id"]
    seller_id = chosen_item["seller_id"]

    cursor.execute("""
        UPDATE basket_contents
        SET quantity = ?
        WHERE basket_id = ? AND product_id = ? AND seller_id = ?
    """, (new_qty, basket_id, product_id, seller_id))

    conn.commit()
    conn.close()
       
    print("\nQuantity updated successfully.")   
            


