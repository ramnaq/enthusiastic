% fatos

estudante(pedro, ine5401).
estudante(anna, ine5401).
estudante(julia, ine5401).
estudante(joao, ine5401).
estudante(fernanda, ine5401).

estudante(pedro, ine5416).
estudante(anna, ine5416).
estudante(julia, ine5416).

estudante(joao, mtm5454).
estudante(fernanda, mtm5454).

estudante(juliana, ine5411).
estudante(anna, ine5411).

estudante(augusto, ine5413).
estudante(julio, ine5413).

professor(marcio, ine5413).
professor(luiz, ine5411).
professor(mauro, ine5401).
professor(mauro, ine5424).
professor(leandro, mtm5454).
professor(leandro, mtm5412).
professor(maicon, ine5416).


% regras

ensina(X,Y) :- estudante(Y,D), professor(X,D).
colegas(X,Y) :- estudante(X,D), estudante(Y,D), X \== Y.

/* regra adicional
 * Se refere a quem é o professor Y de determinada disciplina X. Por exemplo:
 * responsavel(mtm5454, Y) resulta em Y = leandro.
 */
responsavel(X,Y) :- professor(Y,X).


% consultas criadas
/*
% Quais são todas as disciplinas lecionadas pelo professor x?
?- professor(leandro, X).

% Quais são todos os alunos do professor x?
?- ensina(mauro, X).

% Quais são todos os colegas do estudante y?
?- colegas(julia, X).

% A e B são colegas?
?- colegas(julia, juliana).
*/

% consultas realizadas e resultados
/*
?- professor(leandro,X).
X = mtm5454 ;
X = mtm5412.

?- ensina(mauro,X).
X = pedro ;
X = anna ;
X = julia ;
X = joao ;
X = fernanda ;
false.

?- colegas(julia,X).
X = pedro ;
X = anna ;
X = joao ;
X = fernanda ;
X = pedro ;
X = anna ;
false.

?- colegas(julia,juliana).
false.

?- responsavel(ine5416,Y).
Y = maicon.

*/
