# -*- coding: utf-8 -*-

# a = 2, b = 3, c = 5   ->  1 bolo

args = input().split()
ingred_a, ingred_b, ingred_c = list(map(int, args))

bolos = 0
if (ingred_a >= 2 and ingred_b >= 3 and ingred_c >= 5):
    bolos = 1
    a, b, c = int(ingred_a/2), int(ingred_b/3), int(ingred_c/5)
    if (a > 0 or b > 0 or c > 0):
        bolos = min(a, b, c)

print(bolos)

