import turtle

# Window setup
window = turtle.Screen()
window.bgcolor("white")
window.title("Turtle Rocks")

# Turtle setup
turtle = turtle.Turtle()
turtle.color("green")
turtle.pensize(5)

# Draw shape function
def draw_shape(sides):
    for i in range(sides):
        turtle.forward(100)
        turtle.left(360/sides)

# User input for number of sides
while True:
    try:
        sides = int(input("Enter the number of sides of the shape: "))
        if sides >= 3:
            break
        else:
            print("Number of sides must be at least 3.")
    except ValueError:
        print("Invalid input. Please enter a number.")

# Draw the shape
draw_shape(sides)

window.exitonclick()
