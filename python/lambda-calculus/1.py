# -*- coding: utf-8 -*-

args = input().split()
x, y = list(map(int, args))

xor = ( lambda x, y: not(y) if (x) else bool(y) )
print(xor(x, y))

