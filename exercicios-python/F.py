# -*- coding: utf-8 -*-

numbers = input().split()

for i in range(len(numbers)):
    numbers[i] = int(numbers[i])

print(max(numbers))

