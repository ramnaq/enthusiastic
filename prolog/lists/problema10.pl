% rules already written few commits behind (question 7, is_palindrome())

invert([],[]).
invert([H|T],R) :-
    invert(T,L), put(H,L,R), !.

put(X,[],[X]) :- !.
put(X,[H|T],L) :-
    put(X,T,L1), L = [H|L1], !.


/* outputs:
?- invert([],L).
L = [].

?- invert([1],L).
L = [1].

?- invert([1,0],L).
L = [0, 1].

?- invert([1,1],L).
L = [1, 1].

?- invert([1,2,3,4,5],L).
L = [5, 4, 3, 2, 1].
*/
