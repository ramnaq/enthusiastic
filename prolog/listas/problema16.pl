intersection(S1,S2,S3,I) :-
	intersection(S1,S2,I1), intersection(I1,S3,I).	

union(S1,S2,S3,U) :-
	union(S1,S2,U1), union(U1,S3,U).

difference(S1,S2,S3,D) :-
	difference(S1,S2,D1), difference(D1,S3,D).


/* auxiliary rules */

union([],[],U) :- length_(U,N), N =:= 0, U = [], !.
union([],L2,U) :- union(L2,[],U), !.
union([H|T],[],U) :-
	not(contains(H,T)), union(T,[],U1), U = [H|U1], !;
	union(T,[],U), !.
union([H1|T1],L2,U) :-
	not(contains(H1,T1)), union(T1,L2,U1), not(contains(H1,U1)), U = [H1|U1], !;
	union(T1,L2,U), !.

difference([],_,[]) :- !.
difference(S,[],S) :- !.
difference(S1,[H|S],D) :-
	remove(H,S1,D1), difference(D1,S,D), !.

intersection(_,[],[]) :- !.
intersection([],_,[]) :- !.
intersection([H1|S1],S2,I) :-
	contains(H1,S2), intersection(S1,S2,I1), I = [H1|I1], !;
	intersection(S1,S2,I), !.
	
contains(X,[X|_]) :- !.
contains(X,[_|T]) :-
	contains(X,T), !.

length_([],0) :- !.
length_([_|T],N) :-
	length_(T,N1), N is N1 + 1, !.

remove(_,[],[]) :- !.
remove(X,[H|S],L) :-
	X =:= H, remove(X,S,L), !;
	remove(X,S,L1), L = [H|L1], !.


/* outputs:

INTERSECTION

?- intersection([1,2,3,4,5],[2,0,4],[11,3,5],I).
I = [].

?- intersection([1,2,3,4,5],[2,0,4,3],[11,3,5],I).
I = [3].

?- intersection([1,2,3,4,5],[2,0,4,3],[11,3,2,5],I).
I = [2, 3].

?- intersection([],[],[],I).
I = [].

?- intersection([],[],[3],I).
I = [].

?- intersection([],[3],[3],I).
I = [].

?- intersection([],[3],[],I).
I = [].

?- intersection([3],[3],[3],I).
I = [3].


UNION

?- union([],[],[],U).
U = [].

?- union([],[],[1],U).
U = [1].

?- union([1],[1],[1],U).
U = [1].

?- union([1],[1,2],[1],U).
U = [2, 1].

?- union([1,3,4],[1,2],[1,3],U).
U = [4, 2, 1, 3].

?- union([1,3,4],[1,2],[1,3,0,1,4],U).
U = [2, 3, 0, 1, 4].

?- union([1,3,4],[1,2,2,2],[1,3,0,1,4],U).
U = [2, 3, 0, 1, 4].


DIFFERENCE

?- difference([1,3,4],[1,2,2,2],[1,3,0,1,4],U).
U = [].

?- difference([1,3,4],[],[1,3,0,1,4],U).
U = [].

?- difference([1,3,0,1,4],[1],[2],U).
U = [3, 0, 4].

?- difference([1,3,0,1,4],[1,0],[2],U).
U = [3, 4].

?- difference([1,3,0,1,4],[1,0,3],[2,4],U).
U = [].

?- difference([1,3,0,5,4],[1,0,3],[2,4],U).
U = [5].

?- difference([],[],[],U).
U = [].

?- difference([],[1],[],U).
U = [].

?- difference([2],[1],[],U).
U = [2].

?- difference([2,1,3],[1],[],U).
U = [2, 3].

*/
