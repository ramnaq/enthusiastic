# -*- coding: utf-8 -*-

args = input().split()
a, b, c = list(map(int, args))

biggest = (lambda a, b, c: max(a, b, c))
print(biggest(a, b, c))

