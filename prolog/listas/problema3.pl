% receiving a list which has elements in [0,9], stringifies each element and
% returns them in a list.
to_string([],[]) :- !.
to_string([H|T],S) :-
	to_string(T,A), str(H,Str), S = [Str|A], !.

str(0,"zero") :- !.
str(1,"one") :- !.
str(2,"two") :- !.
str(3,"three") :- !.
str(4,"four") :- !.
str(5,"five") :- !.
str(6,"six") :- !.
str(7,"seven") :- !.
str(8,"eight") :- !.
str(9,"nine") :- !.


% outputs
/*
?- to_string([3,1,7,9], L).
L = ["three", "one", "seven", "nine"].

?- to_string([8], L).
L = ["eight"].

?- to_string([], L).
L = [].

?- to_string([10], L).
false.
*/
