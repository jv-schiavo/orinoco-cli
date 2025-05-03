def title():
    title_menu = "Parana - Shoopper Main Menu"
    print("-"*len(title_menu))
    print(title_menu)
    print("-"*len(title_menu))


def main_menu():
    print("1. Display your order history")
    print("2. Add an item to your basket")
    print("3. View your basket")
    print("4. Change the quantity of an item in your basket")
    print("5. Remove an item from your basket")
    print("6. Checkout")
    print("7. Exit")
    return input()

