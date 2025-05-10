from process.connection import connect_db

def get_orders(shopper_id):
    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute("""
    SELECT
        so.order_id,
        so.order_date,
        op.product_id,
        p.product_description,
        s.seller_name as seller,
        op.quantity,
        op.price,
        so.order_status
    FROM shopper_orders so
    JOIN ordered_products op ON so.order_id = op.order_id
    JOIN products p ON op.product_id = p.product_id
    JOIN sellers s ON op.seller_id = s.seller_id
    WHERE so.shopper_id = ?
    ORDER BY so.order_date DESC, op.order_id, p.product_description
""", (shopper_id,))

    rows = cursor.fetchall()
    conn.close()
    return rows


def view_order_history(shopper_id):
    rows = get_orders(shopper_id)

    if not rows:
        print("\n No orders placed by this customer.\n")
        return

    orders = {}
    for row in rows:
        order_id = row["order_id"]
        if order_id not in orders:
            orders[order_id] = {
                "date": row["order_date"],
                "items": [],
            }
        orders[order_id]["items"].append({
            'product': row['product_description'],
            'seller': row['seller'],
            'price': row['price'],
            'quantity': row['quantity'],
            'status': row['order_status']})

    print(f"\n{'OrderID':<10} {'Date':<12} {'Product Description':<45} {'Seller':<20} {'Price':<10} {'Qty':<5} {'Status':<10}")
    print("-" * 115)

    for order_id, order_details in orders.items():
        date = order_details['date']
        items = order_details['items']

        for i, item in enumerate(items):
            print(f"{str(order_id) if i == 0 else '':<10} {date if i == 0 else '':<12} "
                f"{item['product']:<45} {item['seller']:<20} {item['price']:<10} {item['quantity']:<5} {item['status']:<10}")

        
