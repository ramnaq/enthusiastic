difference([],_,[]) :- !.
difference(S,[],S) :- !.
difference(S1,[H|S],D) :-
	remove(H,S1,D1), difference(D1,S,D), !.

remove(_,[],[]) :- !.
remove(X,[H|S],L) :-
	X =:= H, remove(X,S,L), !;
	remove(X,S,L1), L = [H|L1], !.


/* outputs:
?- difference([],[],D).
D = [].

?- difference([],[1],D).
D = [].

?- difference([1],[1],D).
D = [].

?- difference([1,2],[1],D).
D = [2].

?- difference([1,2],[],D).
D = [1, 2].

?- difference([1,2,3,4],[1,2],D).
D = [3, 4].

?- difference([1,2],[1,2,3,4],D).
D = [].
*/
