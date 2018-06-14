% para rotacionar à esquerda K vezes, N = -K
rotacionarDireita([],_,[]) :- !.
rotacionarDireita(L,0,L) :- !.
rotacionarDireita(L1, N, L) :-
	N < 0, length_(L1,K), rotacionarDireita(L1,K+N,L), !;
	length_(L1,N), L = L1, !;
	N1 is N-1, revert(L1,R), rotacionarDireita(R,N1,L), !.

% insere X ao final da lista do segundo parâmetro
revert([],[]) :- !.
revert(L,R) :-
	tail_element(L,X), delete_tail(L,L1), R = [X|L1].

length_([],0) :- !.
length_([_|T],N) :-
	length_(T,N1), N is N1 + 1, !.

tail_element([H],H) :- !.
tail_element([_|T],X) :-
	tail_element(T,X), !.

delete_tail([_],[]) :- !.
delete_tail([H|T],L) :-
	delete_tail(T,L1), L = [H|L1], !.

/* saídas:
?- rotacionarDireita([],3,A).
A = [].

?- rotacionarDireita([],0,A).
A = [].

?- rotacionarDireita([1],0,A).
A = [1].

?- rotacionarDireita([1],1,A).
A = [1].

?- rotacionarDireita([1,2,3],3,A).
A = [1, 2, 3].

?- rotacionarDireita([1,2,3],1,A).
A = [3, 1, 2].

?- rotacionarDireita([1,2,3],2,A).
A = [2, 3, 1].

?- rotacionarDireita([1,2,3],-1,A).
A = [2, 3, 1].

?- rotacionarDireita([1,2,3],-2,A).
A = [3, 1, 2].

?- rotacionarDireita([1,2,3],-3,A).
A = [1, 2, 3].
*/
