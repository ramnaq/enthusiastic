get_index(X,[X|_],0) :- !.
get_index(X,[_|T],I) :-
	get_index(X,T,A), I is A + 1, !.

/* outputs
?- get_index(2,[1,2,3],I).
I = 1.

?- get_index(2,[2,2,3],I).
I = 1.

?- get_index(2,[0,7,3,2],I).
I = 3.

?- get_index(2,[0,7,3,5],I).
I = 3.  // deveria ser -1.
*/
