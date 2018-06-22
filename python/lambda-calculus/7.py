# -*- coding: utf-8 -*-

args = input().split()
sequence = list(map(int, args))

pair = map(lambda x: "yes" if x % 2 == 0 else "not", sequence)
print(list(pair))

