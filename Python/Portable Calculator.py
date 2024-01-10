# Text-based calculator

# Function to perform the calculations
def calculate(expression):
    try:
        return eval(expression)  # Using eval to evaluate the expression
    except:
        return "Invalid input"

# Main program loop
while True:
    # Read the user input
    user_input = input("Enter an equation (or 'exit' to quit): ")

    # Check if the user wants to exit
    if user_input.lower() == "exit":
        print("Calculator turned off.")
        break

    # Perform the calculation
    result = calculate(user_input)
    print("Result:", result)
