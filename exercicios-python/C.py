# -*- coding: utf-8 -*-

args = input().split()
competidores, folhas, f_competidor = list(map(int, args))

if (f_competidor * competidores) <= folhas:
    print('S')
else:
    print('N')

