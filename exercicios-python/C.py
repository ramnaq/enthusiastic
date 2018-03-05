# -*- coding: utf-8 -*-

competidores, folhas, f_competidor = input().split()
competidores = int(competidores)
folhas = int(folhas)
f_competidor = int(f_competidor)

if (f_competidor * competidores) <= folhas:
    print('S')
else:
    print('N')

