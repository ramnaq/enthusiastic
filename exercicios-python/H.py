# -*- coding: utf-8 -*-

# intervalos de tempo e velocidades médias

intervalos = int(input())
kms = 0

for i in xrange(intervalos):
    t, v = input().split()
    t, v = int(t), int(v)
    kms += t * v

print(kms)

