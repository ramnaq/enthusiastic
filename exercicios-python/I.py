# -*- coding: utf-8 -*-

diametro = int(input())
x, y, z = input().split()
x, y, z  = int(x), int(y), int(z)

output = 'N'
if (x >= diametro and y >= diametro and z >= diametro):
    output = 'S'

print(output)

