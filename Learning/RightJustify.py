# Right Justify
# Testing a function that takes a string param and prints it with enough leading
# space so that the last letter is in column 70 of display

def right_justify(string):
    length = len(string)
    leading = 70 - length
    print(leading * '*' + string)

right_justify('monty')