union([],[],U) :- length_(U,N), N =:= 0, U = [], !.
union([],L2,U) :- union(L2,[],U), !.
union([H|T],[],U) :-
    not(contains(H,T)), union(T,[],U1), U = [H|U1], !;
    union(T,[],U), !.
union([H1|T1],L2,U) :-
    not(contains(H1,T1)), union(T1,L2,U1), not(contains(H1,U1)), U = [H1|U1], !;
    union(T1,L2,U), !.

contains(X,[X|_]) :- !.
contains(X,[_|T]) :-
    contains(X,T), !.

length_([],0) :- !.
length_([_|T],N) :-
    length_(T,N1), N is N1 + 1, !.


/* outputs:
?- union([],[],U).
U = [].

?- union([2],[],U).
U = [2].

?- union([],[2],U).
U = [2].

?- union([1],[1],U).
U = [1].

?- union([1],[1,2],U).
U = [1, 2].

?- union([1,1],[1,2],U).
U = [1, 2].

?- union([1,1],[1,2,3],U).
U = [1, 2, 3].

?- union([1,1,2],[1,2,3],U).
U = [1, 2, 3].

?- union([1,2,3,4],[1,2,5,6],U).
U = [3, 4, 1, 2, 5, 6].
*/
