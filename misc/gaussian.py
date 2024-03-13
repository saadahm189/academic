# Import math Library
import math

# Input level:
level = int(input("Enter matrix level:"))
while 1:
    if level % 2 == 0:
        level = int(input("Again enter matrix level:"))
    else:
        break
loop = level * level
x = 0
y = 0
for m in range(loop):
    x = x + m
    y = y + m
    value = int(math.sqrt(x ^ 2 + y ^ 2))
    print(value)