# -*- coding: utf-8 -*-

bandejas = int(input())
copos_quebrados = 0

for i in range(bandejas):
    latas, copos = input().split()
    latas, copos = int(latas), int(copos)

    diferenca = latas - copos
    if (diferenca > 0):
        copos_quebrados += copos

print(copos_quebrados)

