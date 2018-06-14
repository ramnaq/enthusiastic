repetidos([],[]) :- !.
repetidos([H|T],L) :-
	contains(H,T), repetidos(T,L1), not(contains(H,L1)), L = [H|L1], !;
	contains(H,T), repetidos(T,L), !;
	repetidos(T,L).

contains(X,[X|_]) :- !.
contains(X,[_|T]) :-
	contains(X,T), !.

/* saidas:
?- repetidos([1,2,1,3],A).
A = [1].

?- repetidos([1,2,1,3],A).
A = [1].

?- repetidos([1,2,1,3,3,4],A).
A = [1, 3].

?- repetidos([],A).
A = [].
*/
