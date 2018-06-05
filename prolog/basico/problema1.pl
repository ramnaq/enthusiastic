genitor(pam, bob).
genitor(tom, bob).
genitor(tom, liz).

genitor(bob, ana).
genitor(bob, pat).

genitor(liz,bill).

genitor(pat, jim).

mulher(pam).
mulher(liz).
mulher(pat).
mulher(ana).
homem(tom).
homem(bob).
homem(jim).
homem(bill).

pai(X,Y) :- genitor(X,Y), homem(X).
mae(X,Y) :- genitor(X,Y), mulher(X).

avo(AvoX, X) :- genitor(GenitorX, X), genitor(AvoX, GenitorX), homem(AvoX).
avoh(AvohX, X) :- genitor(GenitorX, X), genitor(AvohX, GenitorX), homem(AvohX).
irmao(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, homem(X).
irma(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, mulher(X).
irmaos(X,Y) :- (irmao(X,Y); irma(X,Y)), X \== Y.

ascendente(X,Y) :- genitor(X,Y). %recursão - caso base
ascendente(X,Y) :- genitor(X, Z), ascendente(Z, Y). %recursão - passo recursivo


/* PROBLEMA 1 - regras adicionadas */

tio(X,Y) :- irmao(X,G), genitor(G,Y).
tia(X,Y) :- irma(X,G), genitor(G,Y).

primo(X,Y) :- (tio(T,Y); tia(T,Y)), genitor(T,X), homem(X).
prima(X,Y) :- (tio(T,Y); tia(T,Y)), genitor(T,X), mulher(X).
primos(X,Y) :- primo(X,Y); prima(X,Y).

bisavo(X,Y) :- genitor(X,G), genitor(G,Y), homem(X).
bisavoh(X,Y) :- genitor(X,G), genitor(G,Y), mulher(X).

descendente(X,Y) :- ascendente(Y,X).
descendente(X,Y) :- ascendente(Y,G), descendente(G,X)
feliz(X) :- genitor(X,Y).


% Consultas e resultados
/*
?- tio(bob,Y).
Y = bill.

?- tio(X,bob).
false.

?- tia(X,ana).
X = liz .

?- tio(X,Y).
X = bob,
Y = bill ;
false.

?- tia(X,Y).
X = liz,
Y = ana ;
X = liz,
Y = pat ;
X = ana,
Y = jim ;
false.

?- primo(X,Y).
X = bill,
Y = ana ;
X = bill,
Y = pat ;
false.

?- prima(X,Y).
X = ana,
Y = bill ;
X = pat,
Y = bill ;
false.

?- primos(X,Y).
X = bill,
Y = ana ;
X = bill,
Y = pat ;
X = ana,
Y = bill ;
X = pat,
Y = bill ;
false.

?- bisavo(bob,X).
X = jim.

?- bisavoh(ana,X).
false.

?- bisavoh(pam,X).
X = ana ;
X = pat.

?- bisavo(X,Y).
X = tom,
Y = ana ;
X = tom,
Y = pat ;
X = tom,
Y = bill ;
X = bob,
Y = jim ;
false.

?- bisavoh(X,Y).
X = pam,
Y = ana ;
X = pam,
Y = pat ;
false.

?- irma(ana,pat).
true.

?- descendente(pam,ana).
false.

?- descendente(ana,pam).
true.

?- descendente(ana,tom).
true.

?- descendente(vim,bob).
true.

?- feliz(bob)
true

?- feliz(jim)
false

?- feliz(pat)
true


*/
