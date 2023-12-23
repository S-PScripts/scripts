# Works with gb pounds and us dollars
gbp = 0.0088750
usd = 0.0125

# given value
typeA = input("DOLLAR ->, POUND -> or ROBUX ->?")
  
if typeA == "DOLLAR" or typeA == "dollar":
    ansA = "dollar"

elif typeA == "POUND" or typeA == "pound":
    ansA = "pound"
  
elif typeA == "ROBUX" or typeA == "robux":
    ansA = "robux"
  
else:
    print("Unknown type. Please use DOLLAR, POUND OR ROBUX.")

# to calculate
typeB = input("DOLLAR ->, POUND -> or ROBUX ->?")

if typeB == "DOLLAR" or typeB == "dollar":
    ansB = "dollar"

elif typeB == "POUND" or typeB == "pound":
    ansB = "pound"
  
elif typeB == "ROBUX" or typeB == "robux":
    ansB = "robux"
  
else:
    print("Unknown type. Please use DOLLAR, POUND OR ROBUX.")

# calculate
if ansA == "dollar" and ansB == "robux":
    dollars = int(input("Money?"))
    robux = int(dollars/usd)
    print(f"With ${dollars}, you can buy {robux} robux!")

elif ansA == "pound" and ansB == "robux":
    pounds = int(input("Money?"))
    robux = int(pounds/gbp)
    print(f"With £{pounds}, you can buy {robux} robux!")

elif ansA == "robux" and ansB == "dollar":
    robux = int(input("Robux?"))
    dollars = robux*usd
    print(f"{robux} robux can be bought with ${dollars}!")
  
elif ansA == "robux" and ansB == "pound":
    robux = int(input("Robux?"))
    pounds = robux*gbp
    print(f"{robux} robux can be bought with £{pounds}!")

else:
  print("An error occurred. Do not use DOLLAR -> POUND or POUND -> DOLLAR")
