# Define the prefix you want to check for
prefix = "prefix"  # Replace with your actual prefix

# Original code as a string
code = """
if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'devcmd' then
if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'discord' then
if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'buy' then
if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'purchase' then
"""

# Split the code into lines
lines = code.strip().split('\n')

# Process each line: filter by prefix, remove everything before '==', and remove 'then'
modified_lines = []
for line in lines:
    if prefix in line:
        # Find the index of '=='
        index = line.find('==')
        if index != -1:
            # Append the part of the line after '==' and strip whitespace
            modified_line = line[index + 2:].strip()
            # Remove the word 'then' if it exists at the end
            if modified_line.endswith('then'):
                modified_line = modified_line[:-4].strip()  # Remove 'then' and any trailing spaces
            modified_lines.append(modified_line)

# Output the modified lines
for line in modified_lines:
    print(line)
