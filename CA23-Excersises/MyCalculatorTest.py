import unittest
import CalculatorUtils

class MyCalculatorTest(unittest.TestCase): # This is the class that will test the CalculatorUtils.py file
    
    def test_addition(self): # This is the method that will test the addition function
        # can naming the function with name 'test_CalculateSumOfIntergers_A_and_B_AssignValueToInteger_C(self)'
        
        #Arrange    
        a = int(7)
        b = int(4)
        
        #Act
        result = CalculatorUtils.addition(a, b)
        
        #Assert
        self.assertEqual(result, 11) # This will check if the addition of 7 and 4 is equal to 11
        
    def test_subtraction(self): # This is the method that will test the subtraction function
        # can naming the function with name 'test_CalculateSumOfIntergers_A_and_B_AssignValueToInteger_C(self)'
        
        #Arrange    
        a = int(7)
        b = int(4)
        
        #Act
        result = CalculatorUtils.subtraction(a, b) # This will subtract 4 from 7
        
        #Assert
        self.assertEqual(result, 3)  # This will check if the subtraction of 4 from 7 is equal to 3
        
    def test_multiplication(self): # This is the method that will test the multiplication function
        # can naming the function with name 'test_CalculateSumOfIntergers_A_and_B_AssignValueToInteger_C(self)'
        
        #Arrange    
        a = int(7)
        b = int(4)
        
        #Act
        result = CalculatorUtils.multiplication(a, b) # This will multiply 7 by 4
        
        #Assert
        self.assertEqual(result, 28)  # This will check if the multiplication of 7 by 4 is equal to 28
    
    def test_division(self): 
        # can naming the function with name 'test_CalculateSumOfIntergers_A_and_B_AssignValueToInteger_C(self)'
        
        #Arrange    
        a = int(7)
        b = int(4)
        
        #Act
        result = CalculatorUtils.division(a, b) # This will divide 7 by 4
        #Assert
        self.assertEqual(result, 1.75)  # This will check if the division of 7 by 4 is equal to 
    
        
if __name__ == '__main__': # This will run the test
    unittest.main()        # This will run the test
    
    
    
        
    #     self.assertEqual(CalculatorUtils.addition(1, 2), 3) # This will check if the addition of 1 and 2 is equal to 3
    #     self.assertEqual(CalculatorUtils.addition(2, 3), 5)
    #     self.assertEqual(CalculatorUtils.addition(3, 4), 7)
    #     self.assertEqual(CalculatorUtils.addition(4, 5), 9)
    #     self.assertEqual(CalculatorUtils.addition(5, 6), 11)
    
    # def test_subtraction(self):
    #     self.assertEqual(CalculatorUtils.subtraction(2, 1), 1)
    #     self.assertEqual(CalculatorUtils.subtraction(3, 2), 1)
    #     self.assertEqual(CalculatorUtils.subtraction(4, 3), 1)
    #     self.assertEqual(CalculatorUtils.subtraction(5, 4), 1)
    #     self.assertEqual(CalculatorUtils.subtraction(6, 5), 1)
    
    # def test_multiplication(self):
    #     self.assertEqual(CalculatorUtils.multiplication(1, 2), 2)
    #     self.assertEqual(CalculatorUtils.multiplication(2, 3), 6)
    #     self.assertEqual(CalculatorUtils.multiplication(3, 4), 12)
    #     self.assertEqual(CalculatorUtils.multiplication(4, 5), 20)
    #     self.assertEqual(CalculatorUtils.multiplication(5, 6), 30)
    
    # def test_division(self):
    #     self.assertEqual(CalculatorUtils.division(2, 1), 2)
    #     self.assertEqual(CalculatorUtils.division(3, 2), 1.5)
    #     self.assertEqual(CalculatorUtils.division(4, 3), 1.3333333333333333)
    #     self.assertEqual(CalculatorUtils.division(5, 4), 1.25)
    #     self.assertEqual(CalculatorUtils.division(6, 5), 1.2)