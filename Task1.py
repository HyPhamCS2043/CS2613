# Author: Hy Pham
# 3644279

def checkInt (number):
    return isinstance(number, int)

namePrompt = 'Hello! What is your name?\n'
name = input(namePrompt)

agePrompt = 'Please input your age: \n'

validAge = False
while  not validAge:
    age = input(agePrompt)
    age = int(age)
    #print(checkInt(age))
    if(not checkInt(age)):
        print('Error. Please input a whole number as your age')
    elif (int(age) < 1 or int(age) > 122):
        print('Error, your age is beyond the valid range. Please input new age:')
    else:
        validAge = True
        if (age <= 15):
            year = 16 - age
            print( name + " must wait " + str(year) + " more years to get a driver’s license!")
        elif (age == 16):
            print("Congrats! " + name + " can get their driver's license now!")
        else:
            year = age - 16
            print(name + " has been eligible for a driver's license for " + str(year) + " year(s)")
