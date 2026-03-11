#Author: Hy Pham
#Student number: 3644179

def calSum(inputArr):
    curSum = 0
    for i in inputArr:
        curSum += i
    return curSum

def calAverage(inputArr):
    total = calSum(inputArr)
    return total/len(inputArr)

prompt = "Input the file name:\n"
fileName = input(prompt)

validGrade = []
gradeA = 0
gradeB = 0
gradeC = 0
gradeD = 0
gradeF = 0
aboveAvg = 0

with open(fileName, "r", encoding = "utf-8") as inputFile:
    curGrade = float(inputFile.readline())
    while(curGrade != ''):
        

        if (curGrade >= 0) & (curGrade <= 100):
            validGrade.append(curGrade)

            if curGrade >= 80:
                gradeA += 1
            elif curGrade >= 65:
                gradeB += 1
            elif curGrade >= 55:
                gradeC += 1
            elif curGrade >= 50:
                gradeD += 1
            else:
                gradeF += 1

        curGrade = float(inputFile.readline())
    
print("A     " + str(gradeA))
print("B     " + str(gradeB))
print("C     " + str(gradeC))
print("D     " + str(gradeD))
print("F     " + str(gradeF))

avg = calAverage(validGrade)

for i in validGrade:
    if i > avg:
        aboveAvg += 1

print("Above average grades: " + str(aboveAvg))
