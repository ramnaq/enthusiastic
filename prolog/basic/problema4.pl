max(X,Y,M) :-
    X >= Y, M = X, !;
    M = Y.

max3(X,Y,Z,M) :-
    max(X,Y,A), max(X,Z,B), max(A,B,C), M = C.

is_triangle(X,Y,Z) :-
  max3(X,Y,Z,X), (Y + Z) > X, !;
  max3(X,Y,Z,Y), (X + Z) > Y, !;
  max3(X,Y,Z,Z), (X + Y) > Z.

% outputs
/*
?- is_triangle(10,4,5).
false.

?- is_triangle(4,8,9).
true.

?- is_triangle(7,2,10).
false.

?- is_triangle(4,6,8).
true.

?- is_triangle(3,2,9).
false.
*/
