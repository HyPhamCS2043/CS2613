#Author: Hy Pham
#3644179

doubleVal = (lambda x: 2*x)

print(doubleVal(5))

charAtMiddle = (lambda s: s[round(len(s)/2) - 1])

print(charAtMiddle("abcsde"))

trueIfOdd = (lambda x: True if x%2 != 0 and x > 0 else False)

print(trueIfOdd(9))

startWithVowel = (lambda s: True if (s[0] == "A" or s[0] =='a' or s[0] == "E" or s[0] == "e" or s[0] == "I" or s[0] == "i" or s[0] == "O" or  s[0] =="o" or s[0] =="U" or s[0] =="u") else False)

print(startWithVowel("bpple"))


print(list(map(doubleVal, [8, 10, 7.5])))

print(list(map(charAtMiddle, ["Hello!", "CompSci2613", "Lab-12"])))

print(list(filter(trueIfOdd,[-15, -4, 0, 4, 23, 64, 101, 104, 123])))

print(list(filter(startWithVowel,["alice", "bob", "Carl", "daisy", "Earl"])))