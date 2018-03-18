# -*- coding: utf-8 -*-

vitorias_c, empates_c, gols_c, vitorias_f, empates_f, gols_f = input().split()

pontos_c = int(vitorias_c)*3 + int(empates_c)
gols_c = int(gols_c)

pontos_f = int(vitorias_f)*3 + int(empates_f)
gols_f = int(gols_f)

output = 'F'
if pontos_c > pontos_f:
    output = 'C'
elif pontos_c == pontos_f:
    if gols_c > gols_f:
        output = 'C'
    elif gols_c == gols_f:
        output = '='

print(output)

