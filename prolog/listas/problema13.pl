length_([],0) :- !.
length_([_|T],N) :-
	length_(T,N1), N is N1 + 1, !.

divide_list([],[],[]) :- !.
divide_list([H|T],L1,L2) :-
  	length_(L1,0), length_(L2,0), divide_list(T,[H],[]);
	length_([H|T],N1), length_(L1,N2), length_(L2,N3), N is N1+N2+N3, A is ceiling(N/2),
		N2 < A, divide_list(T,La,L2), L1 is [H|La], !;
	divide_list(T,L1,Lb), L2 = [H|Lb], !.	

