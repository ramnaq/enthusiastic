xor(X,Y) :-
	X, not(Y), !;
	not(X), Y.


/* outputs
?- xor(true,true).
false.

?- xor(true,false).
true.

?- xor(false,false).
false.

?- xor(false,true).
true.
*/
