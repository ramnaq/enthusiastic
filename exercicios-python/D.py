# -*- coding: utf-8 -*-

n = int(input())
a, op, b = input().split()
a, b = int(a), int(b)

output = 'OK'
if op == '+':
    output = 'OVERFLOW' if (a + b > n) or (a + b < 0) else output
elif op == '*':
    output = 'OVERFLOW' if (a * b > n) or (a * b < 0) else output

print(output)

