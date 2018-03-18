# -*- coding: utf-8 -*-

dimensao_mapa = int(input())
mapa_1 = []
mapa_2 = []
output = []

def ler_mapa1():
    for i in range(dimensao_mapa):
        linha_mapa_1 = list(map(int, input().split()))
        mapa_1.append(linha_mapa_1)


def obter_resultado():
    for i in range(dimensao_mapa):
        linha_mapa_2 = list(map(int, input().split()))
        mapa_2.append(linha_mapa_2)
    
        resultado_linha = []
        for j in range(dimensao_mapa):
            x = mapa_1[i][j] + mapa_2[i][j]
            resultado_linha.append(x)

        output.insert(i, resultado_linha)


def printar():
    for i in range(dimensao_mapa):
        for j in range(dimensao_mapa):
            print(str(output[i][j]) + ' ', end = '')
        print()


ler_mapa1()
obter_resultado()
printar()

