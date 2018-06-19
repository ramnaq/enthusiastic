fib(N,K) :-
    N < 0, K is -1, !;
    N =:= 0, K is 0, !;
    N =:= 1, K is 1, !;
    fib(N-2, A), fib(N-1, B), K is A + B.

/* output
?- fib(0,X).
X = 0.

?- fib(1,X).
X = 1.

?- fib(2,X).
X = 1.

?- fib(3,X).
X = 2.

?- fib(7,X).
X = 13.

?- fib(23,X).
X = 28657.
*/
