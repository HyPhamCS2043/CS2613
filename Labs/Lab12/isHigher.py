#Author: Hy Pham
#3644179

isHigher = (lambda x, y: x if x > y else (y if x < y else x))

print(isHigher(5, 6))
print(isHigher(7, 6))
print(isHigher(6, 6))
