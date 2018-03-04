# -*- coding: utf-8 -*-

postos, distancia_intermediaria_max = list(map(int, input().split()))
posicoes_postos = list(map(int, input().split()))

intervalos = []
for i in range(1, postos):
    intervalos.append(posicoes_postos[i] - posicoes_postos[i-1])

intervalos.append(42195 - posicoes_postos[postos - 1])

if max(intervalos) <= distancia_intermediaria_max:
    print('S')
else:
    print('N')

