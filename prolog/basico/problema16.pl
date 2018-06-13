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

mcd(X,Y,Z,M) :-
    mcd(X,Y,A), mcd(A,Z,M).

/* outputs
?- mcd(54,24,M).
M = 6.

?- mcd(54,24,32,M).
M = 2.

?- mcd(12,9,81,M).
M = 3.

?- mcd(12,250,16,M).
M = 2.

?- mcd(12,400,16,M).
M = 4.
*/
