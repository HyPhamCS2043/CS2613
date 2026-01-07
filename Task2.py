# Author: Hy Pham
# 3644279

import math

def absolute(number):
    output = number
    if(number >= 0):
        return output
    else:
        output = -(number)
        return output

def power(number, exp):
    output = number
    i = exp
    while i > 1:
        output = output * number
        i = i - 1
    return output

def formula(a, b):
    output = math.sqrt(abs(power(a-1, 5) - abs(b+1)))
    return output


prompt = "Input 2 values"
print(prompt)
a = input()
b = input()

while (a != 'x'):
    
    if(a == 'x'):
        break
    answer = str(formula(float(a), float(b)))
    print("Result: " + answer + "\n")

    print(prompt)
    a = input()
    b = input()