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
	Chessboard = [
		[A1, B1, C1, D1, E1, F1, G1, H1],
		[A2, B2, C2, D2, E2, F2, G2, H2],
		[A3, B3, C3, D3, E3, F3, G3, H3],
		[A4, B4, C4, D4, E4, F4, G4, H4],
		[A5, B5, C5, D5, E5, F5, G5, H5],
		[A6, B6, C6, D6, E6, F6, G6, H6],
		[A7, B7, C7, D7, E7, F7, G7, H7],
		[A8, B8, C8, D8, E8, F8, G8, H8]
	  ],

        Rank1 = [A1, B1, C1, D1, E1, F1, G1, H1],
	Rank2 = [A2, B2, C2, D2, E2, F2, G2, H2],
	Rank3 = [A3, B3, C3, D3, E3, F3, G3, H3],
	Rank4 = [A4, B4, C4, D4, E4, F4, G4, H4],
	Rank5 = [A5, B5, C5, D5, E5, F5, G5, H5],
	Rank6 = [A6, B6, C6, D6, E6, F6, G6, H6],
	Rank7 = [A7, B7, C7, D7, E7, F7, G7, H7],
	Rank8 = [A8, B8, C8, D8, E8, F8, G8, H8],

        place_queen(Rank1, Chessboard),
        place_queen(Rank2, Chessboard),
        place_queen(Rank3, Chessboard),
        place_queen(Rank4, Chessboard),
        place_queen(Rank5, Chessboard),
        place_queen(Rank6, Chessboard),
        place_queen(Rank7, Chessboard),
        place_queen(Rank8, Chessboard).
