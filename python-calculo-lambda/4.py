# -*- coding: utf-8 -*-
import math

args = input().split()
a, b, c = list(map(int, args))

delta = math.sqrt(b**2 - 4*a*c)
bhaskara = (lambda a, b, c: ((-b + delta)/2*a, (-b - delta)/2*a))

print(bhaskara(a, b, c))

