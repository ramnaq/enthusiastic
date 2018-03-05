# -*- coding: utf-8 -*-

diametro = int(input())
x, y, z = list(map(int, input().split()))

output = 'N'
if (x >= diametro and y >= diametro and z >= diametro):
    output = 'S'

print(output)

