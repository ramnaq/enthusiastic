approved(A,B,C) :-
	(A+B+C)/3 >= 6, format("Approved :]~n"), !;
	format("Disapproved :[~n").


/* outputs
?- approved(4,7,6).
Disapproved :[
true.

?- approved(5,7,6).
Approved :]
true.

?- approved(4,7,6).
Disapproved :[
true.

?- approved(6,6,6).
Approved :]
true.
*/
