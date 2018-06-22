# -*- coding: utf-8 -*-

lado = int(input())

def dividir(lado, pedacos):
    if lado >= 2:
        lado = lado/2
        pedacos = pedacos * 4
        return dividir(lado, pedacos)
    return pedacos


pedacos = dividir(lado, 1)
print(pedacos)

