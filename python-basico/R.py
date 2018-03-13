# -*- coding: utf-8 -*-

competidores, n_voltas = list(map(int, input().split()))
competidor_1 = list(map(int, input().split()))

melhor_tempo = sum(competidor_1)
vencedor = 1
for i in range(1, competidores):
    competidor_i = list(map(int, input().split()))
    tempo_i = sum(competidor_i)
    if (tempo_i < melhor_tempo):
        melhor_tempo = tempo_i
        vencedor = i + 1

print(vencedor)

