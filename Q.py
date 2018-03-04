# -*- coding: utf-8 -*-

questoes = int(input())
respostas = input()
gabarito = input()

acertos = 0
for i in range(questoes):
    if respostas[i] == gabarito[i]:
        acertos += 1

print(acertos)

