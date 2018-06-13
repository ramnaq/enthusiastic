occurrencies(_,[],0) :- !.
occurrencies(X,[H|T],N) :-
	X =:= H, occurrencies(X,T,N1), N is N1 + 1, !;
	occurrencies(X,T,N).
	
/* outputs:
?- occurrencies(3,[3,3,3,4],D).
D = 3.

?- occurrencies(3,[3,3,0,4],D).
D = 2.

?- occurrencies(4,[3,3,0,4],D).
D = 1.

?- occurrencies(4,[],D).
D = 0.

?- occurrencies(4,[1],D).
D = 0.

?- occurrencies(4,[4],D).
D = 1.
*/
