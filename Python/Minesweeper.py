# Minesweeper.py
# This is by my friend xd
# This is broken too

import turtle #imports turtle module
import random

play_Again = True
while play_Again:

  wn = turtle.Screen() #sets up window
  wn.bgcolor("green") #sets up window
  wn.title("Turtle") #sets up window
  burg = turtle.Turtle() #sets up turtle named burg unt.11
  burg.penup() #
  burg.setpos(-200,-200) #
  burg.color("black") #
  burg.pensize(3) #
  burg.pendown() #
  burg.speed(0)
  burg.hideturtle()#

  burger=turtle.Turtle() #sets up turtle named burg unt.11
  burger.penup() #
  burger.color("red") #
  burger.pensize(3) #
  burger.speed(0) #
  burger.hideturtle()
  burger.fillcolor("red")
  def flag(burger):
    burger.setheading(90)
    burger.pendown()
    burger.begin_fill()
    burger.forward(20)
    burger.right(90)
    burger.forward(10)
    burger.right(90)
    burger.forward(5)
    burger.right(90)
    burger.forward(10)
    burger.end_fill() 
    burger.penup()
  burg.left(90) #sets up the grid until line 42
  def grid(burg): #
    for _ in range(5): #
      burg.forward(440) #
      burg.right(90) #
      burg.forward(40) #
      burg.right(90) #
      burg.forward(440) #
      burg.left(90) #
      burg.forward(40) #
      burg.left(90) #
  grid(burg) #
  burg.forward(440) #
  burg.right(90) #
  burg.forward(40) #
  burg.right(90) #
  burg.forward(440) #
  burg.left(180) #
  burg.penup() #
  burg.setpos(-200,240) #
  burg.pendown() #
  burg.right(90) #
  grid(burg) #
  burg.forward(440) #
  burg.right(90) #
  burg.forward(40) #
  burg.right(90) #
  burg.forward(440) #
  def letterpos(burg, x): #defs function to position top numbers unt.44
    burg.penup() #
    burg.setpos(x, 200) #  
    burg.pendown() #
    burg.right(90) #
  def letters(burg): #Creates the numbers on the top of the grid unt.122
    x=-150 #
    style = ("Courier", 20) # 
    letterpos(burg, x) #
    x=x+40 #
    burg.write("1", font=style) #
    letterpos(burg, x) #
    x=x+40 #
    burg.write("2", font=style) #
    letterpos(burg, x) #
    x=x+40 #
    burg.write("3", font=style) #
    letterpos(burg, x) #
    x=x+40 #
    burg.write("4", font=style) #
    letterpos(burg, x) #
    x=x+40 #
    burg.write("5", font=style) #
    letterpos(burg, x) #
    x=x+40 #
    burg.write("6", font=style) #
    letterpos(burg, x) #
    x=x+40 #
    burg.write("7", font=style) #
    letterpos(burg, x) #
    x=x+40 #
    burg.write("8", font=style) #
    letterpos(burg, x) #
    x=x+40 #
    burg.write("9", font=style) #
    letterpos(burg, x) #
    x=x+40 #
    burg.write("10", font=style) #

  def numberpos(burg, y):
    burg.penup() 
    burg.setpos(-190, y) 
    burg.pendown() 

  def numbers(burg):
    y=160
    style = ("Courier", 20)
    numberpos(burg, y)
    y=y-40
    burg.write("1", font=style)
    numberpos(burg, y)
    y=y-40
    burg.write("2", font=style)
    numberpos(burg, y)
    y=y-40
    burg.write("3", font=style)
    numberpos(burg, y)
    y=y-40
    burg.write("4", font=style)
    numberpos(burg, y)
    y=y-40
    burg.write("5", font=style)
    numberpos(burg, y)
    y=y-40
    burg.write("6", font=style)
    numberpos(burg, y)
    y=y-40
    burg.write("7", font=style)
    numberpos(burg, y)
    y=y-40
    burg.write("8", font=style)
    numberpos(burg, y)
    y=y-40
    burg.write("9", font=style)
    numberpos(burg, y)
    y=y-40
    burg.write("10", font=style)

  letters(burg)
  numbers(burg)
  # mines()
  letter1=(random.randint(1,10))
  number1=(random.randint(1,10))
  global mine1
  mine1=(letter1,number1)
  letter2=(random.randint(1,10))
  number2=(random.randint(1,10))
  global mine2
  mine2=(letter2,number2)
  letter3=(random.randint(1,10))
  number3=(random.randint(1,10))
  global mine3
  mine3=(letter3,number3)
  letter4=(random.randint(1,10))
  number4=(random.randint(1,10))
  global mine4
  mine4=(letter4,number4)
  letter5=(random.randint(1,10))
  number5=(random.randint(1,10))
  global mine5
  mine5=(letter5,number5)
  letter6=(random.randint(1,10))
  number6=(random.randint(1,10))
  global mine6
  mine6=(letter6,number6)
  letter7=(random.randint(1,10))
  number7=(random.randint(1,10))
  global mine7
  mine7=(letter7,number7)
  letter8=(random.randint(1,10))
  number8=(random.randint(1,10))
  global mine8
  mine8=(letter8,number8)
  letter9=(random.randint(1,10))
  number9=(random.randint(1,10))
  global mine9
  mine9=(letter9,number9)
  letter10=(random.randint(1,10))
  number10=(random.randint(1,10))
  global mine10
  mine10=(letter10,number10)
  letter11=(random.randint(1,10))
  number11=(random.randint(1,10))
  global mine11
  mine11=(letter11,number11)
  letter12=(random.randint(1,10))
  number12=(random.randint(1,10))
  global mine12
  mine12=(letter12,number12)
  letter13=(random.randint(1,10))
  number13=(random.randint(1,10))
  global mine13
  mine13=(letter13,number13)
  letter14=(random.randint(1,10))
  number14=(random.randint(1,10))
  global mine14
  mine14=(letter14,number14)
  letter15=(random.randint(1,10))
  number15=(random.randint(1,10))
  global mine15
  mine15=(letter15,number15)


  minesarray=  [mine1,mine2,mine3,mine4,mine5,mine6,mine7,mine8,mine9,mine10,mine11,mine12,mine13,mine14,mine15]

  fun = ("Courier", 20)
  c=0
  z=15
  checklist=z
  print(checklist, "mines left")
  while z>0:
    userchoice = input("Are you marking a mine or a blank space?(say mine or blank)")
    if userchoice==("mine"):
      coordsx=int(input("What is the x coordinate of the mine?"))
      coordsy=int(input("What is the y coordinate of the mine?"))
      a=-180+40*coordsx
      b=200-40*coordsy
      burger.setpos(a,b)
      burger.pendown()
      flag(burger)
      if coordsx==letter1 and coordsy==number1:
        z=z-1
        if z==0:
          print("You won minesweeper! Congratulations!")
          break

      if coordsx==letter2 and coordsy==number2:
        z=z-1
        if z==0:
          print("You won minesweeper! Congratulations!")
          break

      if coordsx==letter3 and coordsy==number3:
        z=z-1
        if z==0:
          print("You won minesweeper! Congratulations!")
          break

      if coordsx==letter4 and coordsy==number4:
        z=z-1
        if z==0:
          print("You won minesweeper! Congratulations!")
          break

      if coordsx==letter5 and coordsy==number5:
        z=z-1
        if z==0:
          print("You won minesweeper! Congratulations!")
          break

      if coordsx==letter6 and coordsy==number6:
        z=z-1
        if z==0:
          print("You won minesweeper! Congratulations!")
          break

      if coordsx==letter7 and coordsy==number7:
        z=z-1
        if z==0:
          print("You won minesweeper! Congratulations!")
          break

      if coordsx==letter8 and coordsy==number8:
        z=z-1
        if z==0:
          print("You won minesweeper! Congratulations!")
          break

      if coordsx==letter9 and coordsy==number9:
        z=z-1
        if z==0:
          print("You won minesweeper! Congratulations!")
          break

      if coordsx==letter10 and coordsy==number10:
        z=z-1
        if z==0:
          print("You won minesweeper! Congratulations!")
          break

      if coordsx==letter11 and coordsy==number11:
        z=z-1
        if z==0:
          print("You won minesweeper! Congratulations!")
          break

      if coordsx==letter12 and coordsy==number12:
        z=z-1
        if z==0:
          print("You won minesweeper! Congratulations!")
          break

      if coordsx==letter13 and coordsy==number13:
        z=z-1
        if z==0:
          print("You won minesweeper! Congratulations!")
          break
      if coordsx==letter14 and coordsy==number14:
        z=z-1
        if z==0:
          print("You won minesweeper! Congratulations!")
          break
      if coordsx==letter15 and coordsy==number15:
        z=z-1
        if z==0:
          print("You won minesweeper! Congratulations!")
          break

      print("You have marked a possible mine")
    if userchoice==("blank"):
      coordsx=int(input("What is the x coordinate of the blank space?"))
      coordsy=int(input("What is the y coordinate of the blank space?"))
      if c>=0 and coordsx==letter1 and coordsy==number1:
          print("You stepped on a mine! You lose!")
          break
      if c>=0 and coordsx==letter2 and coordsy==number2:
          print("You stepped on a mine! You lose!")
          break
      if c>=0 and coordsx==letter3 and coordsy==number3:
          print("You stepped on a mine! You lose!")
          break
      if c>=0 and coordsx==letter4 and coordsy==number4:
          print("You stepped on a mine! You lose!")
          break
      if c>=0 and coordsx==letter5 and coordsy==number5:
          print("You stepped on a mine! You lose!")
          break
      if c>=0 and coordsx==letter6 and coordsy==number6:
          print("You stepped on a mine! You lose!")
          break
      if c>=0 and coordsx==letter7 and coordsy==number7:
          print("You stepped on a mine! You lose!")
          break
      if c>=0 and coordsx==letter8 and coordsy==number8:
          print("You stepped on a mine! You lose!")
          break
      if c>=0 and coordsx==letter9 and coordsy==number9:
          print("You stepped on a mine! You lose!")
          break
      if c>=0 and coordsx==letter10 and coordsy==number10:
          print("You stepped on a mine! You lose!")
          break
      if c>=0 and coordsx==letter11 and coordsy==number11:
          print("You stepped on a mine! You lose!")
          break
      if c>=0 and coordsx==letter12 and coordsy==number12:
          print("You stepped on a mine! You lose!")
          break
      if c>=0 and coordsx==letter13 and coordsy==number13:
          print("You stepped on a mine! You lose!")
          break
      if c>=0 and coordsx==letter14 and coordsy==number14:
          print("You stepped on a mine! You lose!")
          break
      if c>=0 and coordsx==letter15 and coordsy==number15:
          print("You stepped on a mine! You lose!")
          break
      else:
        c=c+1
        print("You stepped on a blank space.")
        a=-190+40*coordsx
        b=200-40*coordsy
        burger.setpos(a,b)
        burger.pendown()
        burger.left(90)
        closemines=0
        if coordsx==letter1-1 and coordsy==number1-1:
          closemines=closemines+1
        if coordsx==letter1+1 and coordsy==number1-1:
          closemines=closemines+1
        if coordsx==letter1+1 and coordsy==number1+1:
          closemines=closemines+1
        if coordsx==letter1-1 and coordsy==number1+1:
          closemines=closemines+1
        if coordsx==letter1-1 and coordsy==number1:
          closemines=closemines+1
        if coordsx==letter1+1 and coordsy==number1:
          closemines=closemines+1
        if coordsx==letter1 and coordsy==number1-1:
          closemines=closemines+1
        if coordsx==letter1 and coordsy==number1+1:
          closemines=closemines+1
        if coordsx==letter2-1 and coordsy==number2-1:
          closemines=closemines+1
        if coordsx==letter2+1 and coordsy==number2-1:
          closemines=closemines+1
        if coordsx==letter2+1 and coordsy==number2+1:
          closemines=closemines+1
        if coordsx==letter2-1 and coordsy==number2+1:
          closemines=closemines+1
        if coordsx==letter2-1 and coordsy==number2:
          closemines=closemines+1
        if coordsx==letter2+1 and coordsy==number2:
          closemines=closemines+1
        if coordsx==letter2 and coordsy==number2-1:
          closemines=closemines+1
        if coordsx==letter2 and coordsy==number2+1:
          closemines=closemines+1
        if coordsx==letter3-1 and coordsy==number3-1:
            closemines=closemines+1
        if coordsx==letter3+1 and coordsy==number3-1:
            closemines=closemines+1
        if coordsx==letter3+1 and coordsy==number3+1:
            closemines=closemines+1
        if coordsx==letter3-1 and coordsy==number3+1:
            closemines=closemines+1
        if coordsx==letter3-1 and coordsy==number3:
            closemines=closemines+1
        if coordsx==letter3+1 and coordsy==number3:
            closemines=closemines+1
        if coordsx==letter3 and coordsy==number3-1:
            closemines=closemines+1  
        if coordsx==letter3 and coordsy==number3+1:
            closemines=closemines+1
        if coordsx==letter4-1 and coordsy==number4-1:
          closemines=closemines+1
        if coordsx==letter4+1 and coordsy==number4-1:
          closemines=closemines+1
        if coordsx==letter4+1 and coordsy==number4+1:
          closemines=closemines+1
        if coordsx==letter4-1 and coordsy==number4+1:
          closemines=closemines+1
        if coordsx==letter4-1 and coordsy==number4:
          closemines=closemines+1
        if coordsx==letter4+1 and coordsy==number4:
          closemines=closemines+1
        if coordsx==letter4 and coordsy==number4-1:
          closemines=closemines+1
        if coordsx==letter4 and coordsy==number4+1:
          closemines=closemines+1
        if coordsx==letter5-1 and coordsy==number5-1:
          closemines=closemines+1
        if coordsx==letter5+1 and coordsy==number5-1:
          closemines=closemines+1
        if coordsx==letter5+1 and coordsy==number5+1:
          closemines=closemines+1
        if coordsx==letter5-1 and coordsy==number5+1:
          closemines=closemines+1
        if coordsx==letter5-1 and coordsy==number5:
          closemines=closemines+1
        if coordsx==letter5+1 and coordsy==number5:
          closemines=closemines+1
        if coordsx==letter5 and coordsy==number5-1:
          closemines=closemines+1
        if coordsx==letter5 and coordsy==number5+1:
          closemines=closemines+1
        if coordsx==letter6-1 and coordsy==number6-1:
          closemines=closemines+1
        if coordsx==letter6+1 and coordsy==number6-1:
          closemines=closemines+1
        if coordsx==letter6+1 and coordsy==number6+1:
          closemines=closemines+1
        if coordsx==letter6-1 and coordsy==number6+1:
          closemines=closemines+1
        if coordsx==letter6-1 and coordsy==number6:
          closemines=closemines+1
        if coordsx==letter6+1 and coordsy==number6:
          closemines=closemines+1
        if coordsx==letter6 and coordsy==number6-1:
          closemines=closemines+1
        if coordsx==letter6 and coordsy==number6+1:
          closemines=closemines+1
        if coordsx==letter7-1 and coordsy==number7-1:
          closemines=closemines+1
        if coordsx==letter7+1 and coordsy==number7-1:
          closemines=closemines+1
        if coordsx==letter7+1 and coordsy==number7+1:
          closemines=closemines+1
        if coordsx==letter7-1 and coordsy==number7+1:
          closemines=closemines+1
        if coordsx==letter7-1 and coordsy==number7:
          closemines=closemines+1
        if coordsx==letter7+1 and coordsy==number7:
          closemines=closemines+1
        if coordsx==letter7 and coordsy==number7-1:
          closemines=closemines+1
        if coordsx==letter7 and coordsy==number7+1:
          closemines=closemines+1
        if coordsx==letter8-1 and coordsy==number8-1:
          closemines=closemines+1
        if coordsx==letter8+1 and coordsy==number8-1:
          closemines=closemines+1
        if coordsx==letter8+1 and coordsy==number8+1:
          closemines=closemines+1
        if coordsx==letter8-1 and coordsy==number8+1:
          closemines=closemines+1
        if coordsx==letter8-1 and coordsy==number8:
          closemines=closemines+1
        if coordsx==letter8+1 and coordsy==number8:
          closemines=closemines+1
        if coordsx==letter8 and coordsy==number8-1:
          closemines=closemines+1
        if coordsx==letter8 and coordsy==number8+1:
          closemines=closemines+1
        if coordsx==letter9-1 and coordsy==number9-1:
          closemines=closemines+1
        if coordsx==letter9+1 and coordsy==number9-1:
          closemines=closemines+1
        if coordsx==letter9+1 and coordsy==number9+1:
          closemines=closemines+1
        if coordsx==letter9-1 and coordsy==number9+1:
          closemines=closemines+1
        if coordsx==letter9-1 and coordsy==number9:
          closemines=closemines+1
        if coordsx==letter9+1 and coordsy==number9:
          closemines=closemines+1
        if coordsx==letter9 and coordsy==number9-1:
          closemines=closemines+1
        if coordsx==letter9 and coordsy==number9+1:
          closemines=closemines+1
        if coordsx==letter10-1 and coordsy==number10-1:
          closemines=closemines+1
        if coordsx==letter10+1 and coordsy==number10-1:
          closemines=closemines+1
        if coordsx==letter10+1 and coordsy==number10+1:
          closemines=closemines+1
        if coordsx==letter10-1 and coordsy==number10+1:
          closemines=closemines+1
        if coordsx==letter10-1 and coordsy==number10:
          closemines=closemines+1
        if coordsx==letter10+1 and coordsy==number10:
          closemines=closemines+1
        if coordsx==letter10 and coordsy==number10-1:
          closemines=closemines+1
        if coordsx==letter10 and coordsy==number10+1:
          closemines=closemines+1
        if coordsx==letter11-1 and coordsy==number11-1:
          closemines=closemines+1
        if coordsx==letter11+1 and coordsy==number11-1:
          closemines=closemines+1
        if coordsx==letter11+1 and coordsy==number11+1:
          closemines=closemines+1
        if coordsx==letter11-1 and coordsy==number11+1:
          closemines=closemines+1
        if coordsx==letter11-1 and coordsy==number11:
          closemines=closemines+1
        if coordsx==letter11+1 and coordsy==number11:
          closemines=closemines+1
        if coordsx==letter11 and coordsy==number11-1:
          closemines=closemines+1
        if coordsx==letter11 and coordsy==number11+1:
          closemines=closemines+1
        if coordsx==letter12-1 and coordsy==number12-1:
          closemines=closemines+1
        if coordsx==letter12+1 and coordsy==number12-1:
          closemines=closemines+1
        if coordsx==letter12+1 and coordsy==number12+1:
          closemines=closemines+1
        if coordsx==letter12-1 and coordsy==number12+1:
          closemines=closemines+1
        if coordsx==letter12-1 and coordsy==number12:
          closemines=closemines+1
        if coordsx==letter12+1 and coordsy==number12:
          closemines=closemines+1
        if coordsx==letter12 and coordsy==number12-1:
          closemines=closemines+1
        if coordsx==letter12 and coordsy==number12+1:
          closemines=closemines+1
        if coordsx==letter13-1 and coordsy==number13-1:
          closemines=closemines+1
        if coordsx==letter13+1 and coordsy==number13-1:
          closemines=closemines+1
        if coordsx==letter13+1 and coordsy==number13+1:
          closemines=closemines+1
        if coordsx==letter13-1 and coordsy==number13+1:
          closemines=closemines+1
        if coordsx==letter13-1 and coordsy==number13:
          closemines=closemines+1
        if coordsx==letter13+1 and coordsy==number13:
          closemines=closemines+1
        if coordsx==letter13 and coordsy==number13-1:
          closemines=closemines+1
        if coordsx==letter13 and coordsy==number13+1:
          closemines=closemines+1
        if coordsx==letter14-1 and coordsy==number1-1:
          closemines=closemines+1
        if coordsx==letter14+1 and coordsy==number14-1:
          closemines=closemines+1
        if coordsx==letter14+1 and coordsy==number14+1:
          closemines=closemines+1
        if coordsx==letter14-1 and coordsy==number14+1:
          closemines=closemines+1
        if coordsx==letter14-1 and coordsy==number14:
          closemines=closemines+1
        if coordsx==letter14+1 and coordsy==number14:
          closemines=closemines+1
        if coordsx==letter14 and coordsy==number14-1:
          closemines=closemines+1
        if coordsx==letter14 and coordsy==number14+1:
          closemines=closemines+1
        if coordsx==letter15-1 and coordsy==number15-1:
          closemines=closemines+1
        if coordsx==letter15+1 and coordsy==number15-1:
          closemines=closemines+1
        if coordsx==letter15+1 and coordsy==number15+1:
          closemines=closemines+1
        if coordsx==letter15-1 and coordsy==number15+1:
          closemines=closemines+1
        if coordsx==letter15-1 and coordsy==number15:
          closemines=closemines+1
        if coordsx==letter15+1 and coordsy==number15:
          closemines=closemines+1
        if coordsx==letter15 and coordsy==number15-1:
          closemines=closemines+1
        if coordsx==letter15 and coordsy==number15+1:
          closemines=closemines+1

        burger.write(closemines, font=fun)
        burger.penup()


    if userchoice==("check"):
      print (z, "mines left")


  wn.clear()
  play_Again = bool(input("Would you like to play again? (y/n)") == "y")
