# MY NAME is Tran Huynh An Duy (Andy)

import unittest
import TrianglesUtils

class TestTriangleType(unittest.TestCase):
  def test_equilateral(self):
      
    #Arrange
    side1 = 3
    side2 = 3
    side3 = 3
    
    #Act
    result = TrianglesUtils.equilateral(side1, side2, side3)

    #Assert
    self.assertEqual(result, "equilateral")


  def test_isosceles(self):
    #Arrange
    side1 = 5
    side2 = 5
    side3 = 3
    
    #Act
    result = TrianglesUtils.isosceles(side1, side2, side3)    
    
    #Assert
    self.assertEqual(result, "isosceles")

  def test_irregular(self):
      
    #Arrange
    side1 = 4
    side2 = 5
    side3 = 6
    
    #Act
    result = TrianglesUtils.irregular(side1, side2, side3)    
    
    #Assert
    self.assertEqual(result, "irregular")
    
    
  def test_invalid_triangle(self):
    
    #Arrange
    side1 = 2
    side2 = 3
    side3 = 7
    
    #Act
    result = TrianglesUtils.invalidTriangle(side1, side2, side3)    
    
    #Assert
    self.assertEqual(result, "Invalid triangle: The sum of any two sides must be greater than the third side.")

if __name__ == '__main__':
  unittest.main()