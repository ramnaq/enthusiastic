# -*- coding: utf-8 -*-

n_casas = int(input())

tabuleiro = []
for i in range(n_casas):
    tabuleiro.append(int(input()))

if n_casas == 1:
    print(tabuleiro[0])
else:
    print(tabuleiro[0] + tabuleiro[1])

    for i in range(1, n_casas - 1):
        left, curr, right = tabuleiro[i-1], tabuleiro[i], tabuleiro[i+1]
        print(left + curr + right)

    print(tabuleiro[n_casas-2] + tabuleiro[n_casas-1])

