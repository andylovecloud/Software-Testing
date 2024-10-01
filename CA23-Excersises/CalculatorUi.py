import CalculatorUtils

# user can select witch operation is calculated
# user can do multiple calculations
# user input must be validated

operand = "start"

while (operand != "exit"):

    operand = input("Give an operand ('add', 'sub', 'mul', 'div') or 'exit' to end the app: ")
    if(operand != "exit"): # if user wants to exit the app, the app will end
        if (operand == "add" or operand == "sub" or operand == "mul" or operand == "div"):    
            
            number1Given = False # This will be used to check if the user gives a valid number
            while not number1Given: # This will loop until the user gives a valid number
                try:
                    number1 = int(input("Give a 1st number: ")) # This will ask the user to give a number
                    number1Given = True # If the user gives a valid number, the loop will end
                except Exception: # If the user gives an invalid number, the app will ask the user to give a valid number
                    print("Please enter a valid number.Please try again")
            
            number2Given = False
            while not number2Given:
                try:
                    number2 = int(input("Give a 2nd number: "))
                    number2Given = True
                except ValueError: # This will catch the exception if the user gives a non-integer number like Exception above
                    print("Please enter a valid number. Please try again")

            match operand: # This is the new syntax for switch-case in Python 3.10
                case "add":
                    print(CalculatorUtils.addition(number1, number2))
                case "sub":
                    print(CalculatorUtils.subtraction(number1, number2))
                case "mul":            
                    print(CalculatorUtils.multiplication(number1, number2))
                case "div":    
                    print(CalculatorUtils.division(number1, number2))        
    else:
        print("\n Goodbye! Thank you for using the calculator !^.^! \n")
        break
    