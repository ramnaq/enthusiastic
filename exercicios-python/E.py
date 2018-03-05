# -*- coding: utf-8 -*-

x, y = input().split()
x, y = int(x), int(y)

output = 'fora'
if x >= 0 and x <= 432:
    output = 'dentro' if (y >= 0 and y <= 468) else output

print(output)

