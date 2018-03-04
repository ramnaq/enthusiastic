# -*- coding: utf-8 -*-

a, b, c = list(map(int, input().split()))
x, y, z = list(map(int, input().split()))

conteiners_cabem_comprimento = int(x/a)
conteiners_cabem_largura = int(y/b)
conteiners_cabem_altura = int(z/c)

print(conteiners_cabem_comprimento * conteiners_cabem_largura
    * conteiners_cabem_altura)


