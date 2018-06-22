# -*- coding: utf-8 -*-

args = input().split()
n1, n2, n3 = list(map (int, args))

average = (lambda a, b, c: (a + b + c)/3)(n1, n2, n3)
result = (lambda av: "Approved" if av >= 6 else "Disapproved")

print(result(average))

