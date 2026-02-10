#Author: Hy Pham
#Student number: 3644179


#testArr = [1.0, 2.0, 3.0, 4.0, 5.0]
#Function to calculate the sum of all numbers in the input list
def calSum(inputArr):
    curSum = 0
    for i in inputArr:
        curSum += i
    return curSum

#print(calSum(testArr))

#Function to calculate the average of all numbers in the input list
def calAverage(inputArr):
    total = calSum(inputArr)
    return total/len(inputArr)

#print(calAverage(testArr))

#Function to calculate the largest value of the input list
def calMax(inputArr):
    curMax = inputArr[0]
    for i in inputArr:
        if i > curMax:
            curMax = i
    return curMax

#print(calMax(testArr))

#Function to calculate the smallest value of the input list
def calMin(inputArr):
    curMin = inputArr[0]
    for i in inputArr:
        if i < curMin:
            curMin = i
    return curMin

#print(calMin(testArr))

#Function that recursively calculate the factorial value of the input num
def factorial(num):
    if (num == 0 or num == 1):
        return 1
    else:
        return num * factorial(num -1)
    
#print('Factorial of 5 is', factorial(5))

#Function that calculate the power of input number to input exponent
def power(num, exponent):
    if (exponent == 0):
        return 1
    else:    
        output = num
        i = 1
        while i < exponent:
            output *= num
            i += 1 
        return output    

#print("2 to the power of 1 is", power(2, 1))

#Function that approximate exponential function for each
#value in input list
def calExpo(inputArr):
    outputArr = []
    for i in inputArr:
        curCalResult  = 0
        for k in range(0, 51):
            curCalResult += (power(i, k))/factorial(k)
        outputArr.append(curCalResult) 
    return outputArr

#outExpoArr = calExpo(testArr)
#print(*outExpoArr, sep=", ")

#Function that approximate the Poisson distribution for each
#value in input list
def calPoisson(inputArr):
    outputArr = []
    for i in inputArr:
        curCalResult  = 0
        for k in range(0, 51):
            curCalResult += k * ((power(i, k))/factorial(k))
        outputArr.append(curCalResult) 
    return outputArr

#outPoisArr = calPoisson(testArr)
#print(*outPoisArr, sep=", ")

#Function that approximate the Sin value for each
#value in input list
def calSin(inputArr):
    outputArr = []
    for i in inputArr:
        curCalResult  = 0
        for k in range(0, 51):
            key = 2 * k + 1
            curCalResult += (power(-1, k) * power(i, key))/factorial(key)
        outputArr.append(curCalResult) 
    return outputArr

#outSinArr = calSin(testArr)
#print(*outSinArr, sep=", ")

#Function that approximate cosine value for each
#value in input list
def calCos(inputArr):
    outputArr = []
    for i in inputArr:
        curCalResult  = 0
        for k in range(0, 51):
            key = 2 * k 
            curCalResult += (power(-1, k) * power(i, key))/factorial(key)
        outputArr.append(curCalResult) 
    return outputArr

#outCosArr = calCos(testArr)
#print(*outCosArr, sep=", ")
#print(', '.join(str(i) for i in outCosArr))

#FILE I/O

#Create output file DataOutput.txt and read from input file DataInput.txt, then write the result to output file
outputFile = open("DataOutput.txt", "w+", encoding= "utf-8")
with open('DataInput.txt', "r", encoding= "utf-8") as inputFile:
    line = inputFile.readline()
    while(line != "END"):
        command = line
        numOfVal = int(inputFile.readline())
        inputList = []

        #While there is still arguments to read, read the value and add it to the input list
        while numOfVal > 0:
            val = float(inputFile.readline())
            inputList.append(val)
            numOfVal -= 1

        #print(*inputList, sep = ", ")
        #print(command == "SUM\n")
        command = command.replace("\n", "")

        if command == "SUM":
            toWrite = str(calSum(inputList))
        elif command == "AVG":
            toWrite = str(calAverage(inputList))
        elif command == "MAX":
            toWrite = str(calMax(inputList))
        elif command == "MIN":
            toWrite = str(calMin(inputList))
        elif command == "FXP":
            outputList = calExpo(inputList)
            toWrite = ', '.join(str(i) for i in outputList)
        elif command == "FPO":
            outputList = calPoisson(inputList)
            toWrite = ', '.join(str(i) for i in outputList)
        elif command == "FSN":
            outputList = calSin(inputList)
            toWrite = ', '.join(str(i) for i in outputList)
        elif command == "FCS":
            outputList = calCos(inputList)
            toWrite = ', '.join(str(i) for i in outputList)

        outputFile.write(toWrite)
        outputFile.write("\n")

        line = inputFile.readline()

#Removing trailing newline at the end of the file
outputFile.seek(0)
content = outputFile.read()
content = content.rstrip('\n')
#print(content)

outputFile.seek(0)
outputFile.write(content)
outputFile.truncate()

outputFile.close()