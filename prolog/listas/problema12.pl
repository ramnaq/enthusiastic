delete_front(0,L,L) :- !.
delete_front(N,[_|T],L) :-
	N1 is N-1, delete_front(N1,T,L), !.

/* outputs:
?- delete_front(0,[1],L).
L = [1].

?- delete_front(0,[],L).
L = [].

?- delete_front(1,[],L).
false.

?- delete_front(0,[1],L).
L = [1].

?- delete_front(1,[1],L).
L = [].

?- delete_front(1,[1,2],L).
L = [2].

?- delete_front(1,[1,2,3],L).
L = [2, 3].

?- delete_front(3,[1,2,3,4,5,6],L).
L = [4, 5, 6].
*/
