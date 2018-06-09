absolute(I,N) :-
	I > 0, N is I, !;
	N is I - I*2.

/* outputs
?- absolute(1,N).
N = 1.

?- absolute(-4,N).
N = 4.

?- absolute(-5,N).
N = 5.

?- absolute(5,N).
N = 5.

?- absolute(0,N).
N = 0.
*/
