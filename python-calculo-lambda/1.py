# -*- coding: utf-8 -*-

args = input().split()
x, y = list(map(int, args))

xor = (lambda x, y: True if (x > 0 and y == 0) or (x == 0 and y > 0) else False)
# xor2 = (lambda x, y: x ^ y)
print(xor(x, y))

