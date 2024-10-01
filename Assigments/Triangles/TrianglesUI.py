def check_triangle_type(side1, side2, side3):

  """Checks the type of a triangle based on its side lengths.

  Args:
    side1: The length of the first side.
    side2: The length of the second side.
    side3: The length of the third side.

  Returns:
    A string indicating the type of the triangle: "equilateral", "isosceles", or "irregular".
  """

  # Check if any two sides are smaller than the third side
  if side1 + side2 <= side3 or side1 + side3 <= side2 or side2 + side3 <= side1:
    return "Invalid triangle: The sum of any two sides must be greater than the third side."

  if side1 == side2 == side3:
    return "equilateral"
  elif side1 == side2 or side1 == side3 or side2 == side3:
    return "isosceles"
  else:
    return "irregular"

# Get input from the user
side1 = float(input("Enter the length of the first side: "))
side2 = float(input("Enter the length of the second side: "))
side3 = float(input("Enter the length of the third side: "))

# Check the triangle type and print the result
triangle_type = check_triangle_type(side1, side2, side3)
print(triangle_type)