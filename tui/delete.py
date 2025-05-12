import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from process.connection import connect_db
from tui.display_basket import display_basket

def delete(shopper_id):

    rows = display_basket(shopper_id)

    if not rows:
        return
    
    if len(rows) == 1:
            chosen_item = rows[0]
            print(f"\nOnly one item found: {chosen_item['product_description']}")
    else:    
        while True:
            try:
                chosen_item = int(input("\nEnter the number of the item you wish to remove from you basket: "))
                if 0 < chosen_item <= len(rows):
                    chosen_item = rows[chosen_item - 1]
                    print(f"\nYou have chosen `{chosen_item['product_description']}` to be deleted from the basket")
                    break
                else:
                    print("\nThe basket item no. you have entered is invalid")
                    chosen_item
            except ValueError:
                print("\nInvalid input. Please enter a number")
    while True:
        try:
            confirmation = str(input(f"\nAre you sure you want to remove {chosen_item['product_description']} from your basket? [Y/N]\n")).strip().upper()
            if confirmation == "Y":

                conn = connect_db()
                cursor = conn.cursor()

                cursor.execute("""
                            SELECT basket_id
                                FROM shopper_baskets
                                WHERE shopper_id = ? AND DATE(basket_created_date_time) = DATE('now')
                                ORDER BY basket_created_date_time DESC
                                LIMIT 1
                                            """,(shopper_id,))
                
                basket_row = cursor.fetchone()
            
                if not basket_row:
                    print("No basket found for today.")
                    return
                
                basket_id = basket_row['basket_id']
                product_id = chosen_item['product_id']
                seller_id = chosen_item['seller_id']


                                    
                cursor.execute(""" DELETE FROM basket_contents
                                    WHERE product_id = ? AND seller_id = ? AND basket_id = ?
                            """, (product_id, seller_id, basket_id,))

                conn.commit()
                conn.close()

                if not display_basket:
                    print("\nYour basket is empty")
                    return    
                
                display_basket(shopper_id)

            else:
                return
        except ValueError:
            print("\nInvalid input. Please enter Y or N")
    

                  
                        

