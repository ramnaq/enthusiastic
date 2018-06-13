average([],-1) :- !.
average(L,M) :-
    sum_all(L,S), length_(L,N), M is S/N.

sum_all([],0) :- !.
sum_all([H|T],S) :-
    sum_all(T,A), S is H + A, !.

length_([],0) :- !.
length_([_|T],N) :-
    length(T,A), N is A + 1, !.


/* outputs:
?- average([3,3,3],N).
N = 3.

?- average([1,2,3],N).
N = 2.

?- average([1,2,3,4,5],N).
N = 3.

?- average([1,4,3,4,5],N).
N = 3.4.
*/
