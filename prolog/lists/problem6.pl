lowest([X],X) :- !.
lowest([H|T],N) :-
    lowest(T,K), min(H,K,N), !.

min(A,B,M) :-
    A =< B, M = A, !;
    M = B.


/* outputs:
?- lowest([],L).
false.

?- lowest([1],L).
L = 1.

?- lowest([1,1],L).
L = 1.

?- lowest([2,1],L).
L = 1.

?- lowest([2,1,3,7,0],L).
L = 0.

?- lowest([2,1,3,0,7],L).
L = 0.
*/
