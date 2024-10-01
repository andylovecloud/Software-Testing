# MY NAME is Tran Huynh An Duy (Andy)

def equilateral(side1, side2, side3): #This fuction will create method to get input from user for 3 sides of a triangle 
    if side1 == side2 == side3:         #check if all sides are equal
        return "equilateral"            #return equilateral if all sides are equal

def isosceles(side1, side2, side3): 
    if side1 == side2 or side1 == side3 or side2 == side3:  #check if two sides are equal
        return "isosceles"              #return isosceles if two sides are equal

def irregular(side1, side2, side3): 
    if side1 != side2 != side3:         #check if all sides are not equal
        return "irregular"              #return irregular if all sides are not equal

def invalidTriangle(side1, side2, side3): 
    #check if the sum of any two sides is greater than the third side
    if side1 + side2 <= side3 or side1 + side3 <= side2 or side2 + side3 <= side1:          
        return "Invalid triangle: The sum of any two sides must be greater than the third side."

# print(equilateral(3, 3, 3)) 
# print(isosceles(5, 5, 3))   
# print(irregular(4, 5, 6))
# print(invalidTriangle(2, 3, 7))

