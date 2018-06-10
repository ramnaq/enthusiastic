% adjust limit to integer square root of N.
isprime_recursion(N,I) :-
	I =:= N, !;
	I < N, N mod I =\= 0, isprime_recursion(N,I+1).

isprime(N) :-
	isprime_recursion(N, 2).

/* outputs
?- isprime(1).
false.

?- isprime(2).
true.

?- isprime(3).
true.

?- isprime(4).
false.

?- isprime(97).
true.

?- isprime(34966).
false.

?- isprime(34866).
false.

?- isprime(149).
true.

?- isprime(541).
true.
*/
