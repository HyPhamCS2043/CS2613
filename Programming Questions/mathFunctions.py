#Author: Hy Pham
#Student number: 3644179


testArr = [1.0, 2.0, 3.0, 4.0, 5.0]
#Function to calculate the sum of all numbers in the input array
def calSum(inputArr):
    curSum = 0
    for i in inputArr:
        curSum += i
    return curSum

print(calSum(testArr))

#Function to calculate the average of all numbers in the input array
def calAverage(inputArr):
    total = calSum(inputArr)
    return total/len(inputArr)

print(calAverage(testArr))

#
def calMax(inputArr):
    curMax = inputArr[0]
    for i in inputArr:
        if i > curMax:
            curMax = i
    return curMax

print(calMax(testArr))

def calMin(inputArr):
    curMin = inputArr[0]
    for i in inputArr:
        if i < curMin:
            curMin = i
    return curMin

print(calMin(testArr))