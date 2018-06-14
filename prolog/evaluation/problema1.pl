genitor(fred, maria).
genitor(pam, bob).
genitor(tom, bob).
genitor(pam, liz).
genitor(tom, liz).

genitor(bob, ana).
genitor(bob, pat).
genitor(bia, ana).
genitor(bia, pat).

genitor(liz,bill).
genitor(trump,bill).

genitor(mary,tim).
genitor(trump,tim).

genitor(pat, jim).
genitor(kim, jim).

mulher(maria).
mulher(pam).
mulher(bia).
mulher(liz).
mulher(mary).
mulher(ana).
mulher(pat).

homem(fred).
homem(tom).
homem(bob).
homem(trump).
homem(kim).
homem(bill).
homem(tim).
homem(jim).

idade(fred, 56).
idade(maria, 30).
idade(pam, 98).
idade(tom, 70).
idade(bob, 45).
idade(bia, 43).
idade(liz, 47).
idade(trump, 54).
idade(mary, 51).
idade(ana, 12).
idade(pat, 25).
idade(kim, 27).
idade(bill, 15).
idade(tim, 17).
idade(jim, 1).

%(a)
casados(A,B) :- genitor(A,X), genitor(B,X), A \== B.

%(b)
irmaos(A,B) :- genitor(X,A), genitor(X,B), A \== B.
cunhados(A,B) :- casados(C,A), irmaos(B,C).

%(c)
sobrinho(X,Y) :- genitor(G,X), irmaos(G,Y), homem(X).
sobrinha(X,Y) :- genitor(G,X), irmaos(G,Y), mulher(X).

%(d)
casadoMaisVezes(X) :- genitor(X,A), genitor(Y,A), casados(X,Z), X \== Y, Y \== Z.


%(e)

%auxiliares:
avo(X,Y) :- genitor(G,Y), genitor(X,G), homem(X).
avoh(X,Y) :- genitor(G,Y), genitor(X,G), mulher(X).

%consulta resposta:
?- findall(Nome, ((avoh(Nome,X); avo(Nome,X)), idade(Nome,I), I > 50), QuestaoE), sort(QuestaoE,ESorted).
/* saída:
QuestaoE = [pam, pam, pam, tom, tom, tom],
ESorted = [pam, tom].
*/


%(f)
?- findall(Nome, (genitor(Nome,Filho), idade(Filho,I), I >= 30, I =< 90, not(genitor(Filho,Y))), QuestaoF), sort(QuestaoF,FSorted).
/* saída:
QuestaoF = FSorted, FSorted = [fred].
*/


%(g)
?- bagof((DescendenteFilho,DescendenteNeto), (genitor(Avoh,DescendenteFilho), genitor(DescendenteFilho,DescendenteNeto)), DescendentesAvoh).
/* saída:
Avoh = bia,
DescendentesAvoh = [(pat, jim)] ;
Avoh = bob,
DescendentesAvoh = [(pat, jim)] ;
Avoh = pam,
DescendentesAvoh = [(bob, ana),  (bob, pat),  (liz, bill)] ;
Avoh = tom,
DescendentesAvoh = [(bob, ana),  (bob, pat),  (liz, bill)].

observação: tuplas são da forma (filh@, net@).
*/

%tentativa 2, pós prova
/*
?- bagof(Descendente, X ^ Y ^ Z ^ ( (genitor(Avoh,Y),genitor(Y,Z)), homem(Avoh), (genitor(Avoh,Descendente); (genitor(Avoh,X), genitor(X,Descendente))) ), DescendentesAvoh), list_to_set(DescendentesAvoh, Set).
Avoh = bob,
DescendentesAvoh = Set, Set = [ana, pat, jim] ;
Avoh = tom,
DescendentesAvoh = [bob, liz, ana, pat, bill, bob, liz, ana, pat|...],
Set = [bob, liz, ana, pat, bill].
*/



/* consultas e saídas:
(A)
?- casados(pam,rom).
false.

?- casados(pam,tom).
true

?- casados(A,B).
A = tom,
B = pam ;
A = pam,
B = tom ;
A = tom,
B = pam ;
A = bob,
B = bia ;
A = bob,
B = bia ;
A = bia,
B = bob ;
A = bia,
B = bob ;
A = liz,
B = trump ;
A = trump,
B = liz ;
A = mary,
B = trump ;
A = trump,
B = mary ;
A = pat,
B = kim ;
A = kim,
B = pat ;
false.

(B)
?- cunhados(A,B).
A = bia,
B = liz ;
A = bia,
B = liz ;
A = bia,
B = liz ;
A = bia,
B = liz ;
A = trump,
B = bob ;
A = trump,
B = bob ;
A = kim,
B = ana ;
A = kim,
B = ana ;
false.

(C.1)
?- sobrinho(X,Y).
X = bill,
Y = bob ;
X = bill,
Y = bob ;
X = jim,
Y = ana ;
X = jim,
Y = ana ;
false.

(C.2)
?- sobrinha(X,Y).
X = ana,
Y = liz ;
X = ana,
Y = liz ;
X = pat,
Y = liz ;
X = pat,
Y = liz ;
false.

(D)
?- casadoMaisVezes(X).
X = trump ;
X = trump ;
false.

As saídas restantes estão abaixo das suas respectivas questões.

*/
