# Author: Hy Pham
# 3644179
import re

def given_length(sentence, length):
    words = sentence.split()
    #print(words)
    ret = []
    for i in words:
        if len(i) == length:
            ret.append(i)
    return ret

#print(given_length("The white cat and the red fox.", 3))

def longest_word(sentence):
    longest = 0
    words = sentence.split()
    for i in words:
        if len(i) > longest:
            longest = len(i)
    return given_length(sentence, longest)

#print(longest_word("Hello CS2613 - Python is fun."))


def most_common(sentence):
    cleaned = re.sub(r'[^a-zA-Z\n]', '', sentence)
    cleaned = cleaned.lower()
    characters = list(cleaned)
    characters.sort()

    ret = []
    max = 0

    for i in characters:
        if(i != " "):
            occur = characters.count(i)
            if occur > max:
                max = occur
    
    for i in characters:
        if(i != " "):
            if(characters.count(i) == max):
                if(i not in ret):
                    ret.append(i)
    return ret

#print(most_common("My name is world"))

f = open("L6_T2_Text.txt")
text = f.read()

five = given_length(text, 5)

print("Number of 5-letter words in document: " + str(len(five)))
print("Most common letter: " + str(most_common(text)))
print("The longest words are: " + str(longest_word(text)))
f.close()
        
    