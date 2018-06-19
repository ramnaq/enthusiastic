operation(Op,X,Y,Result) :-
  Op = +, Result is X + Y, !;
  Op = -, Result is X - Y, !;
  Op = *, Result is X * Y, !;
  Op = /, Result is X / Y.

/* outputs
?- operation(+,1,2,X).
X = 3.

?- operation(+,-1,2,X).
X = 1.

?- operation(-,-1,2,X).
X = -3.

?- operation(-,-1,-2,X).
X = 1.

?- operation(*,-3,-2,X).
X = 6.

?- operation(/,6,-2,X).
X = -3.
*/
