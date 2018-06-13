max(X,Y,X) :- X >= Y.
max(X,Y,Y) :- X < Y.

mcd(X,Y,M) :-
    X =:= 0, Y > 1, M is Y, !;
    Y =:= 0, X > 1, M is X, !;
    X =:= 0, Y =:= 0, M is -1, !;
    (X =:= 1; Y =:= 1),(X =:= 0; Y =:= 0), M is -1, !;
    X =:= 1, Y =:= 1, M is 1, !;
    max(X,Y,X), mcd(X-Y,Y,M), !;
    max(X,Y,Y), mcd(X,Y-X,M).

eulers_totient_recursion(N,I,K) :-
    (N =:= 1; I =:= 1), K is 1, !;
    mcd(N,I,M), M =:= 1, eulers_totient_recursion(N,I-1,A), K is A + 1, !;
    eulers_totient_recursion(N,I-1,K).

eulers_totient(N,K) :-
    eulers_totient_recursion(N,N-1,K).

/* outputs
?- eulers_totient(10,K).
K = 4.

?- eulers_totient(1,K).
K = 1.

?- eulers_totient(24,K).
K = 8.
*/
