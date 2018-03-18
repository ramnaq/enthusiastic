# -*- coding: utf-8 -*-
import math

pointA = input().split()
pointB = input().split()

x1, y1, z1 = list(map(int, pointA))
x2, y2, z2 = list(map(int, pointB))

squared_subt = (lambda x1, x2: (x1 - x2)**2)
distance = ( lambda x1, y1, z1, x2, y2, z2: math.sqrt(
    squared_subt(x1, x2) + squared_subt(y1, y2) + squared_subt(z1, z2)) )

print(distance(x1, y1, z1, x2, y2, z2))

