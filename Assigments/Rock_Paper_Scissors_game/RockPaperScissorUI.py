#My name is: Tran Huynh An Duy (Andy)

import random

def get_user_selection():
  while True:
    choice = input("Enter your choice (rock, paper, or scissors): ").lower()
    if choice in ["rock", "paper", "scissors"]:
      return choice
    else:
      print("Invalid choice. Please enter rock, paper, or scissors.")

def get_computer_choice():
  choices = ["rock", "paper", "scissors"]
  return random.choice(choices)

def determine_winner(user_selection, computer_choice):
  if user_selection == computer_choice:
    return "It's a tie!"
  elif (user_selection == "rock" and computer_choice == "scissors") or \
       (user_selection == "paper" and computer_choice == "rock") or \
       (user_selection == "scissors" and computer_choice == "paper"):
    return "You win!"
  else:
    return "Computer wins!"

def main():
  user_selection = get_user_selection()
  computer_choice = get_computer_choice()

  print(f"You chose: {user_selection}")
  print(f"Computer chose: {computer_choice}")

  result = determine_winner(user_selection, computer_choice)
  print(result)

if __name__ == "__main__":
  main()