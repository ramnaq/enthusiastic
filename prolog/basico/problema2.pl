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
