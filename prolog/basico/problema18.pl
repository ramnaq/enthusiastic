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

coprimes(X,Y) :-
    mcd(X,Y,M), M =:= 1.

/* outputs
?- coprimes(20,21).
true.

?- coprimes(24,21).
false.

?- coprimes(25,21).
true.

?- coprimes(5,1).
true.

?- coprimes(1,1).
true.

?- coprimes(0,1).
false.

?- coprimes(0,0).
false.
*/
