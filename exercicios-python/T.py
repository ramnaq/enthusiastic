# -*- coding: utf-8 -*-

n_pessoas = int(input())
tempos = []
tempo_total = 0

for i in range(n_pessoas):
    tempos.append(int(input()))

for i in range(1, n_pessoas):
    if tempos[i] - tempos[i-1] >= 10:
        tempo_total += 10
    else:
        tempo_total += tempos[i] - tempos[i-1]

print(tempo_total + 10)

