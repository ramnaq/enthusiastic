divide_list([],_,_) :- !.
divide_list(L,L1,L2) :-
  length_(L,N), A is ceiling(N/2), front_slice(A,L,L1), delete_front(A,L,L2), !.

length_([],0) :- !.
length_([_|T],N) :-
	length_(T,N1), N is N1 + 1, !.

front_slice(0,_,[]) :- !.
front_slice(N,[],[]) :- N =:= 0, !.
front_slice(N,[H|T],L) :-
    N1 is N-1, front_slice(N1,T,L1), L = [H|L1], !.

delete_front(0,L,L) :- !.
delete_front(N,[_|T],L) :-
    N1 is N-1, delete_front(N1,T,L), !.


/* outputs:
?- divide_list([],L1,L2).
true.

?- divide_list([1],L1,L2).
L1 = [1],
L2 = [].

?- divide_list([1,2],L1,L2).
L1 = [1],
L2 = [2].

?- divide_list([1,2,3],L1,L2).
L1 = [1, 2],
L2 = [3].

?- divide_list([1,2,3,4],L1,L2).
L1 = [1, 2],
L2 = [3, 4].
*/
