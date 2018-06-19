pilot(Farfarelli)
pilot(Milton)
pilot(Nascimento)
pilot(Rui)
pilot(Walter)

demonym(gaucho)
demonym(baiano)
demonym(fluminense)
demonym(mineiro)
demonym(paulista)

smokeColor(amarela)
smokeColor(azul)
smokeColor(branca)
smokeColor(verde)
smokeColor(vermelha)

anomaly(altimetro)
anomaly(bussola)
anomaly(hidraulico)
anomaly(radio)
anomaly(temperatura)

beverage(agua)
beverage(cafe)
beverage(cha)
beverage(cerveja)
beverage(leite)

sport(equitacao)
sport(futebol)
sport(natacao)
sport(pesca)
sport(tenis)

% X está exatamente à esquerda ou exatamente à direita de Y?
is_next(X,Y,List) :-
    nextto(X,Y,List); nextto(Y,X,List).

% X está à esquerda de Y?
to_the_left(X,Y,List) :-
    nth0(Ix, List, X), nth0(Iy, List, Y), Ix < Iy.

% X está à direita de Y?
to_the_right(X,Y,List) :-
    to_the_left(Y,X,List).

% X está em um extremo?
outermost(X,[H|_]) :-
    X =:= H; last(List,X).
