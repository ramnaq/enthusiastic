diff_greatest_lowest(L,D) :-
	greatest(L,K1), lowest(L,K2), D is K1 - K2.

greatest([X],X) :- !.
greatest([H|T], N) :-
	greatest(T,K), max(H,K,N), !.

lowest([X],X) :- !.
lowest([H|T],N) :-
    lowest(T,K), min(H,K,N), !.

min(A,B,M) :-
	A =< B, M = A, !;
	M = B.

max(A,B,M) :-
	min(A,B,A), M = B, !;
	M = A.

/* outputs:
?- greatest([0,1],L).
L = 1.

?- diff_greatest_lowest([1,2],D).
D = 1.

?- diff_greatest_lowest([1,2,3],D).
D = 2.

?- diff_greatest_lowest([3,3,3],D).
D = 0.

?- diff_greatest_lowest([3,3,3,4],D).
*/
