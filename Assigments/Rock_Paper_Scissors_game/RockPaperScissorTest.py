#MY NAME is: Tran Huynh An Duy (Andy)

import unittest
from RockPaperScissorFunc import check_game         # Import the function check_game from the file RockPaperScissorFunc.py
class TestPaperScissors(unittest.TestCase):     # Create a class TestPaperScissors that inherits from unittest.TestCase

    def test_check_game_case_1(self):
        
        # Arrange
        user = "scissors"
        computer = "paper"
        
        # Act
        result = check_game(user, computer)
        
        #Assert
        self.assertEqual(result, "you win")    # The result should be "you win" because the user wins the computer

    def test_check_game_case_2(self):
        
        # Arrange
        user = "rock"
        computer = "paper"
        
        # Act
        result = check_game(user, computer)
        
        #Assert
        self.assertEqual(result, "you lose")    # The result should be "you lose" because the computer wins

    def test_check_game_case_3(self):
        
        # Arrange
        user = "rock"
        computer = "rock"
        
        # Act
        result = check_game(user, computer)     
        
        #Assert
        self.assertEqual(result, "you are tie")   
        #The result should be "you are tie" because the user and the computer have the same choice

if __name__ == "__main__":
    unittest.main()
