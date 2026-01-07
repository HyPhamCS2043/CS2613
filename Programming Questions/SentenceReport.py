# Author: Hy Pham
# 3644179
# References: https://www.geeksforgeeks.org/python/python-removing-unwanted-characters-from-string/
#             https://stackoverflow.com/questions/54974579/change-values-in-a-list-using-a-for-loop-python
#             https://www.geeksforgeeks.org/python/python-remove-empty-strings-from-list-of-strings/

import re

# Function to remove all non-alphabetical char in the inputted string and to
# convert the string to lowercase. 
def clean_token(word):

    #Remove all special characters
    cleaned = re.sub(r'[^a-zA-Z\n]', '', word)

    #Convert the word to lower case
    cleaned = cleaned.lower()
    return cleaned

#Function to check if the string has any repeated characters
def repeat_letter(word):
    
    i = 0

    repeated = False
    while i < len(word) - 1:
        j = i + 1
        while j < len(word):
            if word[i] == word[j]:
                repeated = True
                break
            else:
                j += 1
        i += 1

    return repeated

#Function to check if the last character of input string a matches the first
#character of input string b
def end_start(a, b):
    matched = False
    if a[len(a)-1] == b[0]:
        matched = True
    return matched

prompt = "Input a sentence for statistics:\n"
sentence = input(prompt)

word = sentence.split(' ')

#print(word)

totalChar = 0
totalRepeated = 0
totalEndStartMatch = 0

for i, s in enumerate(word):
    word[i] = clean_token(s)

#print(word)

#Compress the list to remove items that are empty string
word = [s for s in word if s.strip()]

#print(word)

for i, s in enumerate(word):
    totalChar += len(word[i])

    if repeat_letter(word[i]):
        totalRepeated += 1

    if i < len(word) - 1:
        if end_start(word[i], word[i+1]):
            totalEndStartMatch += 1

#print(word)
print("Total number of alphabetic characters: " + str(totalChar))
print("Total number of words with repeated alphabetic characters: " + str(totalRepeated))
print("Total number of end-start letter matches: " + str(totalEndStartMatch))

#print(clean_token("d4ds"))
#print(repeat_letter("aghff"))
#print(end_start("doesnt", "best"))
