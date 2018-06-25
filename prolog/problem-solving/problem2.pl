chessboard([
  [_,_,_,_,_,_,_,_],
  [_,_,_,_,_,_,_,_],
  [_,_,_,_,_,_,_,_],
  [_,_,_,_,_,_,_,_],
  [_,_,_,_,_,_,_,_],
  [_,_,_,_,_,_,_,_],
  [_,_,_,_,_,_,_,_],
  [_,_,_,_,_,_,_,_]
]).

queen(q1).
queen(q2).
queen(q3).
queen(q4).
queen(q5).
queen(q6).
queen(q7).
queen(q8).

% a given list of squares (column or rank) is valid if it has at most one queen
valid_sqrs([]).
valid_sqrs([H|T]) :-
	is_queen(H), not(has_queen(T)), !;
	not(is_queen(H)), valid_sqrs(T).

is_queen(X) :- queen(Q), X == Q.

has_queen([H|T]) :-
	is_queen(H), !;
	has_queen(T).

solution(Chessboard) :-
	Chessboard = chessboard([
		[A1, B1, C1, D1, E1, F1, G1, H1],
		[A2, B2, C2, D2, E2, F2, G2, H2],
		[A3, B3, C3, D3, E3, F3, G3, H3],
		[A4, B4, C4, D4, E4, F4, G4, H4],
		[A5, B5, C5, D5, E5, F5, G5, H5],
		[A6, B6, C6, D6, E6, F6, G6, H6],
		[A7, B7, C7, D7, E7, F7, G7, H7],
		[A8, B8, C8, D8, E8, F8, G8, H8]
	  ]),

	/*
	add_queen([A1, B1, C1, D1, E1, F1, G1, H1], Chessboard),
	add_queen([A2, B2, C2, D2, E2, F2, G2, H2], Chessboard),
	add_queen([A3, B3, C3, D3, E3, F3, G3, H3], chessboard),
	add_queen([A4, B4, C4, D4, E4, F4, G4, H4], chessboard),
	add_queen([A5, B5, C5, D5, E5, F5, G5, H5], chessboard),
	add_queen([A6, B6, C6, D6, E6, F6, G6, H6], chessboard),
	add_queen([A7, B7, C7, D7, E7, F7, G7, H7], chessboard),
	add_queen([A8, B8, C8, D8, E8, F8, G8, H8], chessboard).
	*/
