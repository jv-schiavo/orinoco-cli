import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))


from process.connection import connect_db

def display_basket(shopper_id):
    conn = connect_db()
    cursor = conn.cursor()


    cursor.execute("""
                    SELECT 
                        p.product_description, 
                        s.seller_name, 
                        bc.quantity, 
                        bc.price, 
                        (bc.price * bc.quantity) AS total, 
                        bc.product_id, 
                        bc.seller_id
                    FROM basket_contents bc
                    JOIN products p ON bc.product_id = p.product_id
                    JOIN sellers s ON bc.seller_id = s.seller_id
                    JOIN shopper_baskets sb ON bc.basket_id = sb.basket_id
                    WHERE sb.shopper_id = ? AND DATE(sb.basket_created_date_time) = DATE('now')
                    ORDER BY sb.basket_created_date_time DESC
                """, (shopper_id,))
    
    rows = cursor.fetchall()

    print("\nBasket Content")
    print("-" * 15)
    print(f"\n\n{'Basket Item':<10} {'Product Description':<70} {'Seller Name':<20} {'Qty':<5} {'Price':<10} {'Total':<10}")
   

    if not rows:
        print("Your basket is empty")
        return []
    else:
        basket_total = 0
        for i, row in enumerate(rows, start=1):
            price = float(row['price'])
            total = float(row['total'])
            basket_total += total
            print(f"{i:<10}  {row['product_description']:<70} {row['seller_name']:<20} {row['quantity']:<5} £{price:<9.2f} £{total:<9.2f}")

    print("\n\n" + " " * 83 + f"Basket Total:" + " " * 23 + f"£{basket_total:.2f}")
    
    return rows

   
