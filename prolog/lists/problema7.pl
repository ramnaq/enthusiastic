is_palindrome([]) :- !.
is_palindrome(L) :-
    reverse(L,R), L = R, !.

reverse([],[]).
reverse([H|T],R) :-
    reverse(T,L), put(H,L,R), !.

put(X,[],[X]) :- !.
put(X,[H|T],L) :-
    put(X,T,L1), L = [H|L1], !.


/* outputs:
?- is_palindrome([]).
true.

?- is_palindrome([1]).
true.

?- is_palindrome([1,1]).
true.

?- is_palindrome([1,2]).
false.

?- is_palindrome([1,2,1]).
true.

?- is_palindrome([1,2,2,1]).
true.

?- is_palindrome([1,2,3,2,1]).
true.

?- is_palindrome([1,2,3,3,2,1]).
true.

?- is_palindrome([1,2,3,4,2,1]).
false.
*/
