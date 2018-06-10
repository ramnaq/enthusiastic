max(X,Y,X) :- X >= Y.
max(X,Y,Y) :- X < Y.

mcd(X,Y,M) :-
  	X =:= 0, Y =:= 0, M is -1, !;
	(X =:= 1; Y =:= 1),(X =:= 0; Y =:= 0), M is -1, !;
	X =:= 1, Y =:= 1, M is 1, !;
	max(X,Y,X), mcd(X-Y,Y,M), !;
	max(X,Y,Y), mcd(X,Y-X,M).

lcm(X,Y,L) :-
	X =:= 0, Y > 1, L is Y, !;
	Y =:= 0, X > 1, L is X, !;
	mcd(X,Y,M), L is X*Y/M.

/* outputs
?- lcm(5,6,L).
L = 30.

?- lcm(4,6,L).
L = 12.

?- lcm(24,60,L).
L = 120.

?- lcm(24,0,L).
L = 24.
*/
