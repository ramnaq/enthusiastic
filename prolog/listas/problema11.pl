front_slice(0,_,[]) :- !.
front_slice(N,[],[]) :- N =:= 0, !.
front_slice(N,[H|T],L) :-
    N1 is N-1, front_slice(N1,T,L1), L = [H|L1], !.


/* outputs:
?- front_slice(0,[],S).
S = [].

?- front_slice(0,[1],S).
S = [].

?- front_slice(1,[],S).
false.

?- front_slice(1,[1],S).
S = [1].

?- front_slice(2,[1],S).
false.

?- front_slice(2,[1,2,3,4,5],S).
S = [1, 2].

?- front_slice(3,[1,2,3,4,5],S).
S = [1, 2, 3].

?- front_slice(5,[1,2,3,4,5],S).
S = [1, 2, 3, 4, 5].
*/
