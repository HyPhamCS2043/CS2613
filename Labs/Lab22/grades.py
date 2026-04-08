#Author: Hy Pham
#Student ID: 3644179

mathMax = 0
scienceMax = 0
englishMax = 0
historyMax = 0

highestMathScorer = ""
highestScienceScorer = ""
highestEnglishScorer = ""
highestHistoryScorer = ""
tableOut = "Student Results:\n-----------\n"

with open("grades.txt") as f:
    for line in f:
        tokens = line.split(",")
        name = tokens[0]

        mathScore = float(tokens[1])
        scienceScore = float(tokens[2])
        englishScore = float(tokens[3])
        historyScore = float(tokens[4])

        if mathScore > mathMax:
            highestMathScorer = name
            mathMax = mathScore

        if scienceScore > scienceMax:
            highestScienceScorer = name
            scienceMax = scienceScore

        if englishScore > englishMax:
            highestEnglishScorer = name
            englishMax = englishScore

        if historyScore > historyMax:
            highestHistoryScorer = name
            historyMax = historyScore
   

        average = (mathScore + scienceScore + englishScore + historyScore)/4

        letterGrade = ""

        if average >= 90:
            letterGrade = "A"
        elif average >= 80:
            letterGrade = "B"
        elif average >= 70:
            letterGrade = "C"
        elif average >= 60:
            letterGrade = "D"
        else:
            letterGrade = "F"

        tableOut += name + "\t|\t" + str(round(average, 2)) + "\t|\t" + letterGrade + "\n"

print(tableOut)
print("Subject Highest Scorers:")
print(f'Math: {highestMathScorer} ({mathMax})')
print(f'Science: {highestScienceScorer} ({scienceMax})')
print(f'English: {highestEnglishScorer} ({englishMax})')
print(f'History: {highestHistoryScorer} ({historyMax})')