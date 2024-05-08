# Turtle Race.py

# Import modules
from turtle import Turtle
from turtle import Screen
from random import randint

# Create window
win = Screen()
win.bgcolor("white")
win.title("Turtle Race!")

# Turtle 1
mrturtle = Turtle()
mrturtle.color("green")
mrturtle.shape("turtle")
mrturtle.penup()
mrturtle.goto(-160,0)
mrturtle.pendown()

# Turtle 2
mrsturtle = Turtle()
mrsturtle.color("red")
mrsturtle.shape("turtle")
mrsturtle.penup()
mrsturtle.goto(-160,100)
mrsturtle.pendown()

# Turtle 3
miniturtle = Turtle()
miniturtle.color("orange")
miniturtle.shape("turtle")
miniturtle.penup()
miniturtle.goto(-160,-100)
miniturtle.pendown()

# Movement
for i in range(50):
    mrturtle.forward(randint(1,10))
    mrsturtle.forward(randint(1,10))
    miniturtle.forward(randint(1,10))

# Result calculator
if mrturtle.pos()[0] > mrsturtle.pos()[0] and mrturtle.pos()[0] > miniturtle.pos()[0]:
    print("1st: Mr Turtle")
    if mrsturtle.pos()[0] > miniturtle.pos()[0]:
       print("2nd: Mrs Turtle")
       print("3rd: Mini Turtle")
    else:
        print("2nd: Mini Turtle")
        print("3rd: Mrs Turtle")

elif mrsturtle.pos()[0] > mrturtle.pos()[0] and mrsturtle.pos()[0] > miniturtle.pos()[0]:
    print("1st: Mrs Turtle")
    if mrturtle.pos()[0] > miniturtle.pos()[0]:
       print("2nd: Mr Turtle")
       print("3rd: Mini Turtle")
    else:
        print("2nd: Mini Turtle")
        print("3rd: Mr Turtle")

elif miniturtle.pos()[0] > mrturtle.pos()[0] and miniturtle.pos()[0] > mrsturtle.pos()[0]:
    print("1st: Mini Turtle")
    if mrturtle.pos()[0] > mrsturtle.pos()[0]:
       print("2nd: Mr Turtle")
       print("3rd: Mrs Turtle")
    else:
        print("2nd: Mrs Turtle")
        print("3rd: Mr Turtle")
else:
    print("Draw!")

# Close window
win.exitonclick()
