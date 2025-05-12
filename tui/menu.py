import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from tui.login import login
from tui.order_history import view_order_history
from tui.add_item import prod_categories
from tui.display_basket import display_basket
from tui.change_qty import change_qty
from tui.delete import delete

def menu():
    
    shopper_id, shopper_first_name = login()

    if not shopper_id:
        print("Shopper_ID not found" + "\nExiting the programm...")
        return None, None

    while True:

        print("\n\tWelcome, " + shopper_first_name)
        print("-" * 35)

        print("PARANÁ – SHOPPER MAIN MENU")
        print("-" * 35)
        print("1. Display your order history")
        print("2. Add an item to your basket")
        print("3. View your basket")
        print("4. Change the quantity of an item in your basket")
        print("5. Remove an item from your basket")
        print("6. Checkout")
        print("7. Exit")

        try:
            choice = int(input("\nEnter your choice: "))
        except ValueError:
            print("Invalid input. Please enter a number from 1 to 7.")
            continue
            
        
        if choice == 7:
            print("Exiting the programm...")
            break
        
        elif choice == 1:
            view_order_history(shopper_id)

        elif choice == 2:
            prod_categories(shopper_id)

        elif choice == 3:
            display_basket(shopper_id)

        elif choice == 4:
            change_qty(shopper_id)

        elif choice == 5:
            delete(shopper_id)
            


