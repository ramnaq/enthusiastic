# -*- coding: utf-8 -*-

n_pessoas = int(input())
tempos = []
tempo = 0

for i in range(n_pessoas):
    tempos.append(int(input()))

for i in range(1, n_pessoas):
    if tempos[i] - tempos[i-1] >= 10:
        tempo += 10
    else:
        tempo += tempos[i] - tempos[i-1]

print(tempo + 10)

