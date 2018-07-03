place_queen(Rank, Cb) :-
    member(q, Rank),
    nth0(I, Rank, q), get_column(I, Cb, C),
    valid_sqrs(Rank), valid_sqrs(C).

get_rank(0,[H|_],H) :- !.
get_rank(I,[_|T],X) :-
    I0 is I-1, get_rank(I0, T, X).

get_column(_,[],[]) :- !.
get_column(I,[H0|T0],[H|T]):-
   get_rank(I, H0, H), get_column(I, T0, T).

% a given list of squares (column or rank) is valid if it has at most one queen
valid_sqrs([]).
valid_sqrs([H|T]) :-
    H == q, not(has_queen(T)), !;
    H \== q, valid_sqrs(T).

% true if the given list has at least one queen
has_queen([H|T]) :-
    H == q, !;
    has_queen(T).

solution(Chessboard) :-
  	Rank1 = [_,_,_,_,_,_,_,_],
  	Rank2 = [_,_,_,_,_,_,_,_],
  	Rank3 = [_,_,_,_,_,_,_,_],
  	Rank4 = [_,_,_,_,_,_,_,_],
  	Rank5 = [_,_,_,_,_,_,_,_],
  	Rank6 = [_,_,_,_,_,_,_,_],
  	Rank7 = [_,_,_,_,_,_,_,_],
  	Rank8 = [_,_,_,_,_,_,_,_],

	Chessboard = [Rank1, Rank2, Rank3, Rank4, Rank5, Rank6, Rank7, Rank8],

	place_queen(Rank1, Chessboard),
	place_queen(Rank2, Chessboard),
	place_queen(Rank3, Chessboard),
	place_queen(Rank4, Chessboard),
	place_queen(Rank5, Chessboard),
	place_queen(Rank6, Chessboard),
	place_queen(Rank7, Chessboard),
	place_queen(Rank8, Chessboard).
