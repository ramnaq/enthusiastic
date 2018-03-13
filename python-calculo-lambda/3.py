# -*- coding: utf-8 -*-

n = int(input())
fibonacci = (lambda a, b, f: (b, f, f + b))

prev1, prev2, fib = 0, 1, 0
for i in range(n):
    prev1, prev2, fib = fibonacci(prev1, prev2, fib)

print(fib)

