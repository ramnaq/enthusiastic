divisivel(N,K) :- (N mod K) =:= 0.

% consultas e resultados
/*
?- divisivel(3,1).
true.

?- divisivel(1,3).
false.

?- divisivel(7,14).
false.

?- divisivel(14,7).
true.

?- divisivel(14,8).
false.
*/
