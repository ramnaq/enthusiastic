divisible(N,K) :- (N mod K) =:= 0.

% queries and results
/*
?- divisible(3,1).
true.

?- divisible(1,3).
false.

?- divisible(7,14).
false.

?- divisible(14,7).
true.

?- divisible(14,8).
false.
*/
