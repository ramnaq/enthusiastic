sum_all([],0) :- !.
sum_all([H|T],S) :-
    sum_all(T,A), S is H + A, !.


/* outputs:
?- sum_all([],A).
A = 0.

?- sum_all([1],A).
A = 1.

?- sum_all([1,2],A).
A = 3.

?- sum_all([1,2,0,3],A).
A = 6.

?- sum_all([-1,2,0,3],A).
A = 4.
*/
