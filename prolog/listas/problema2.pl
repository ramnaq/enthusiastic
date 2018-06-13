insert_at(X,0,L,[X|L]) :- !.
insert_at(X,I,[H|T],L) :-
	Next is I-1, insert_at(X,Next,T,A), L = [H|A], !.


/* outputs
?- insert_at(-1, 4, [], L).
false.

?- insert_at(-1, 0, [], L).
L = [-1].

?- insert_at(-1, 0, [0], L).
L = [-1, 0].

?- insert_at(-1, 1, [0], L).
L = [0, -1].

?- insert_at(-1, 2, [0], L).
false.

?- insert_at(-1, 2, [0, 0, 0, 0], L).
L = [0, 0, -1, 0, 0].

?- insert_at(-1, 4, [0, 0, 0, 0], L).
L = [0, 0, 0, 0, -1].

?- insert_at(-1, 5, [0, 0, 0, 0], L).
false.
*/
