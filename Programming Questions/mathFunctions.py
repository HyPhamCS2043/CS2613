#Author: Hy Pham
#Student number: 3644179

#Function to calculate the sum of all numbers in the input array
def calSum(inputArr):
    i = 0
    curSum = 0
    while i < len(inputArr):
        curSum += inputArr[i]
        i += 1
    return curSum

testArr = [1, 2, 3, 4, 5]
print(calSum(testArr))

#Function to calculate the average of all numbers in the input array
def calAverage(inputArr):
    total = calSum(inputArr)
    return total/len(inputArr)

print(calAverage(testArr))