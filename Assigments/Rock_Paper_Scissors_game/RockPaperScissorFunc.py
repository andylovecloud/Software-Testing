#MY NAME is: Tran Huynh An Duy (Andy)

import random

def random_items(list_of_items):            # This function is used to randomly select an item from the list
    result = random.choice(list_of_items)   # The random.choice() function is used to select a random item from the list
    return result

def check_game(user_selection, computer_choice):    # This function is used to check the result of the game
    if user_selection == computer_choice:
        return "you are tie"
    elif user_selection == "rock" and computer_choice == "scissors":
        return "you win"
    elif user_selection == "rock" and computer_choice == "paper":
        return "you lose"
    elif user_selection == "paper" and computer_choice == "scissors":
        return "you lose"
    elif user_selection == "paper" and computer_choice == "rock":
        return "you win"
    elif user_selection == "scissors" and computer_choice == "rock":
        return "you lose"
    elif user_selection == "scissors" and computer_choice == "paper":
        return "you win"
    else:
        return "Invalid input, please try again!"

def run_game():                     # This function is used to run the game and ask the user to enter the input
    is_game = True                  # The game will run until the user enters 'exit'    
    while is_game:
        list_of_items = ["rock", "paper", "scissors"]
        confirm = input("Enter: 'rock' or 'paper' or 'scissors' to play the game or 'exit' to stop: ").lower()
        computer_choice = random_items(list_of_items)
        # print(computer_choice)
        if confirm != "exit":       # If the user enters 'exit', the game will stop
            result = check_game(confirm, computer_choice)
            print (result)
        else:
            print("The program was stopped!")
            is_game = False
            
if __name__ == "__main__":
    run_game()