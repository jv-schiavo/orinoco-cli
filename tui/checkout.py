import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from process.connection import connect_db

from tui.display_basket import display_basket

def checkout(shopper_id):

    rows = display_basket(shopper_id)

    if not rows:
        return
    
    else:
        while True:
            try:
                proceed = input("\nDo you wish to proceed with the checkout (Y or N)?\n").strip().upper()
                if proceed == "Y":
                    
                    conn = connect_db()
                    cursor = conn.cursor()

                    cursor.execute(""" SELECT basket_id
                                        FROM shopper_baskets
                                        WHERE shopper_id = ? AND DATE(basket_created_date_time) = DATE('now')
                                   """,(shopper_id,))
                    
                    basket = cursor.fetchone()

                    if not basket:
                        return

                    basket_id = basket['basket_id']

                    cursor.execute(""" INSERT INTO shopper_orders (shopper_id, order_date, order_status)
                                        VALUES (?, DATE('NOW'), 'Placed' )
                                   """, (shopper_id,))
                    order_id = cursor.lastrowid


                    cursor.execute(""" SELECT product_id, seller_id, quantity, price
                                   FROM basket_contents
                                   WHERE basket_id = ?
                                                    """, (basket_id,))
                    
                    basket_item = cursor.fetchall()
                    
                    for item in basket_item:
                        cursor.execute(""" INSERT INTO ordered_products (order_id, product_id, seller_id, quantity, price, ordered_product_status)
                                       VALUES (?, ?, ?, ?, ?, 'Placed')
                                       """, (order_id, item['product_id'], item['seller_id'], item['quantity'], item['price']))
                    
                    cursor.execute(""" DELETE FROM basket_contents
                                        WHERE basket_id = ?
                                   """, (basket_id,))
                    
                    cursor.execute(""" DELETE FROM shopper_baskets
                                        WHERE basket_id = ?
                                   """, (basket_id,))
                    
                    conn.commit()
                    conn.close()

                    print("\nCheckout complete, your order has been placed")

                    return


                else:
                    return
            except ValueError:
                print("\nInvalid input. Please insert Y or N")


    




