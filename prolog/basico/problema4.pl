max(X,Y,M) :-
    X >= Y, M = X, !;
    M = Y.

max3(X,Y,Z,M) :-
    max(X,Y,A), A = X, max(X,Z,B), B.
/*
triangulo(X,Y,Z) :-
    max3(X,Y,Z,X), (Y + Z) > X, !;
    max3(X,Y,Z,Y), (X + Y) > Y, !;
    (X + Z) > X.
    */
