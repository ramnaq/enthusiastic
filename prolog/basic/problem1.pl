parent(pam, bob).
parent(tom, bob).
parent(tom, liz).

parent(bob, ana).
parent(bob, pat).

parent(liz,bill).

parent(pat, jim).

woman(pam).
woman(liz).
woman(pat).
woman(ana).
man(tom).
man(bob).
man(jim).
man(bill).

father(X,Y) :- parent(X,Y), man(X).
mother(X,Y) :- parent(X,Y), woman(X).

grandfather(Grandfather, X) :- parent(Parent, X), parent(Grandfather, Parent), man(Grandfather).
grandmother(Grandmother, X) :- parent(Parent, X), parent(Grandmother, Parent), man(Grandmother).
brother(X,Y) :- parent(Father, X), parent(Father, Y), X \== Y, man(X).
sister(X,Y) :- parent(Father, X), parent(Father, Y), X \== Y, woman(X).
siblings(X,Y) :- (brother(X,Y); sister(X,Y)), X \== Y.

ascendent(X,Y) :- parent(X,Y).
ascendent(X,Y) :- parent(X, Z), ascendent(Z, Y).


% code above was provided by the professor.
/* QUESTION 1 */

uncle(X,Y) :- brother(X,G), parent(G,Y).
aunt(X,Y) :- sister(X,G), parent(G,Y).

m_cousin(X,Y) :- (uncle(T,Y); aunt(T,Y)), parent(T,X), man(X).
f_cousin(X,Y) :- (uncle(T,Y); aunt(T,Y)), parent(T,X), woman(X).
m_cousins(X,Y) :- m_cousin(X,Y); f_cousin(X,Y).

great-grandfather(X,Y) :- parent(X,G), parent(G,Y), man(X).
great-grandmother(X,Y) :- parent(X,G), parent(G,Y), woman(X).

descendent(X,Y) :- ascendent(Y,X).
descendent(X,Y) :- ascendent(Y,G), descendent(G,X).
happy(X) :- parent(X,Y).

/*
 * similarly to the 'ascendent' and 'descendent' rules, the rule 'niece' is
 * related to the rule 'uncle' and 'aunt'. X is niece of Y if it is 'woman' and
 * if it has Y as 'uncle' or 'aunt'.
 */
niece(X,Y) :- (uncle(Y,X); aunt(Y,X)), woman(X).


% outputs
/*
?- uncle(bob,Y).
Y = bill.

?- uncle(X,bob).
false.

?- aunt(X,ana).
X = liz .

?- uncle(X,Y).
X = bob,
Y = bill ;
false.

?- aunt(X,Y).
X = liz,
Y = ana ;
X = liz,
Y = pat ;
X = ana,
Y = jim ;
false.

?- m_cousin(X,Y).
X = bill,
Y = ana ;
X = bill,
Y = pat ;
false.

?- f_cousin(X,Y).
X = ana,
Y = bill ;
X = pat,
Y = bill ;
false.

?- cousins(X,Y).
X = bill,
Y = ana ;
X = bill,
Y = pat ;
X = ana,
Y = bill ;
X = pat,
Y = bill ;
false.

?- great-grandfather(bob,X).
X = jim.

?- great-grandmother(ana,X).
false.

?- great-grandmother(pam,X).
X = ana ;
X = pat.

?- great-grandfather(X,Y).
X = tom,
Y = ana ;
X = tom,
Y = pat ;
X = tom,
Y = bill ;
X = bob,
Y = jim ;
false.

?- great-grandmother(X,Y).
X = pam,
Y = ana ;
X = pam,
Y = pat ;
false.

?- sister(ana,pat).
true.

?- descendent(pam,ana).
false.

?- descendent(ana,pam).
true.

?- descendent(ana,tom).
true.

?- descendent(vim,bob).
true.

?- happy(bob)
true

?- happy(jim)
false

?- happy(pat)
true

?- niece(X,Y).
X = ana,
Y = liz ;
X = pat,
Y = liz ;
false.

*/
