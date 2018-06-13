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

/* outputs
?- mdc(1,0,D).
D = -1.

?- mdc(0,0,D).
D = -1.

?- mdc(0,1,D).
D = -1.

?- mdc(1,1,D).
D = 1.

?- mdc(252,105,D).
D = 21.

?- mdc(12,18,D).
D = 6.

?- mdc(25,26,D).
D = 1.
*/
