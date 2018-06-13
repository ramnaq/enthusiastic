% facts

student(pedro, ine5401).
student(anna, ine5401).
student(julia, ine5401).
student(joao, ine5401).
student(fernanda, ine5401).

student(pedro, ine5416).
student(anna, ine5416).
student(julia, ine5416).

student(joao, mtm5454).
student(fernanda, mtm5454).

student(juliana, ine5411).
student(anna, ine5411).

student(augusto, ine5413).
student(julio, ine5413).

professor(marcio, ine5413).
professor(luiz, ine5411).
professor(mauro, ine5401).
professor(mauro, ine5424).
professor(leandro, mtm5454).
professor(leandro, mtm5412).
professor(maicon, ine5416).


% rules

teaches(X,Y) :- student(Y,D), professor(X,D).
colleagues(X,Y) :- student(X,D), student(Y,D), X \== Y.

/* additional rule
 * It refers to who is the professor Y of a certain course X. For example:
 * responsable(mtm5454, Y) results in Y = leandro.
 */
responsable(X,Y) :- professor(Y,X).


% queries
/*
% What courses are taught by the professor X?
?- professor(leandro, Y).

% What are the students of the professor X?
?- teaches(mauro, Y).

% What are the colleagues of the student X?
?- colleagues(julia, Y).

% Are A and B colleagues?
?- colleagues(julia, juliana).
*/

% outputs
/*
?- professor(leandro,X).
X = mtm5454 ;
X = mtm5412.

?- teaches(mauro,X).
X = pedro ;
X = anna ;
X = julia ;
X = joao ;
X = fernanda ;
false.

?- colleagues(julia,X).
X = pedro ;
X = anna ;
X = joao ;
X = fernanda ;
X = pedro ;
X = anna ;
false.

?- colleagues(julia,juliana).
false.

?- responsable(ine5416,Y).
Y = maicon.

*/
