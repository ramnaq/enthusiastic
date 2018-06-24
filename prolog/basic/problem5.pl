equation_root(A,B,C,X) :-
	Delta is B**2 - 4*A*C, D is sqrt(Delta), (X is (- B + D) / 2*A; X is -(B + D)/ 2*A).


/* outputs
X = 3 ;
X = 2.

?- equation_root(1,8,-9,X).
X = 1.0 ;
X = -9.0.
*/
