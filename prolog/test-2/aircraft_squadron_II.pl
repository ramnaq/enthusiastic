pilot(farfarelli).
pilot(milton).
pilot(nascimento).
pilot(rui).
pilot(walter).

demonym(gaucho).
demonym(baiano).
demonym(fluminense).
demonym(mineiro).
demonym(paulista).

smokeColor(amarela).
smokeColor(azul).
smokeColor(branca).
smokeColor(verde).
smokeColor(vermelha).

anomaly(altimetro).
anomaly(bussola).
anomaly(hidraulico).
anomaly(radio).
anomaly(temperatura).

beverage(agua).
beverage(cafe).
beverage(cha).
beverage(cerveja).
beverage(leite).

sport(equitacao).
sport(futebol).
sport(natacao).
sport(pesca).
sport(tenis).

% X está exatamente à esquerda ou exatamente à direita de Y?
are_next(X,Y,List) :-
    nextto(X,Y,List); nextto(Y,X,List).

% X está à esquerda de Y?
to_the_left(X,Y,List) :-
    nth0(Ix, List, X), nth0(Iy, List, Y), Ix < Iy.

% X está à direita de Y?
to_the_right(X,Y,List) :-
    to_the_left(Y,X,List).

% X está em um extremo?
outermost(X,[X|_]).
outermost(X,List) :- last(List,X).

all_differents([]).
all_differents([H|T]) :-
	not(member(H,T)), all_differents(T).

at(0, [H|_], H) :- !.
at(N, [_|T], X) :-
	N0 is N - 1, at(N0,T,X).
	

% solução
solution(Solution) :-
	Solution = [
	  aviao(Pilot0, Demonym0, SmokeColor0, Anomaly0, Beverage0, Sport0),
	  aviao(Pilot1, Demonym1, SmokeColor1, Anomaly1, Beverage1, Sport1),
	  aviao(Pilot2, Demonym2, SmokeColor2, Anomaly2, Beverage2, Sport2),
	  aviao(Pilot3, Demonym3, SmokeColor3, Anomaly3, Beverage3, Sport3),
	  aviao(Pilot4, Demonym4, SmokeColor4, Anomaly4, Beverage4, Sport4)
	],


	% assertions to cover the list above:

	%1
	to_the_left(aviao(farfarelli,_,_,_,_,_), aviao(_,_,_,_,_,futebol), Solution),

	%2
	member(aviao(_,_,_,_,agua,pesca), Solution),

	%3
	Walter_ = aviao(walter,_,_,_,_,_),
	Equitacao_ = aviao(_,_,_,_,_,equitacao),
	Tenis_ = aviao(_,_,_,_,_,tenis),
	to_the_right(Walter_, Equitacao_, Solution), to_the_left(Walter_, Tenis_, Solution),

	%4
	Sport2 = tenis,

	%5
	Radio_ = aviao(_,_,_,radio,_,_),
	Cafe_ = aviao(_,_,_,_,cafe,_),
	Mineiro_ = aviao(_,mineiro,_,_,_,_),
	to_the_left(Radio_, Cafe_, Solution), to_the_left(Cafe_, Mineiro_, Solution),
	
	%6	
	Cha_ = aviao(_,_,_,_,cha,_),
	Cerveja_ = aviao(_,_,_,_,cerveja,_),
	to_the_right(Cha_, Cerveja_, Solution), to_the_left(Cha_, Cafe_, Solution),

	%7
	outermost(Cerveja_, Solution), to_the_left(Cerveja_, Cha_, Solution),

	%8
	Agua_ = aviao(_,_,_,_,agua,_),
	Bussola_ = aviao(_,_,_,bussola,_,_),
	are_next(Agua_, Bussola_, Solution),

	%9
	Altimetro_ = aviao(_,_,_,altimetro,_,_),
	Rui_ = aviao(rui,_,_,_,_,_),
	to_the_right(Altimetro_, Rui_, Solution),

	%10
	Futebol_ = aviao(_,_,_,_,_,futebol),
	are_next(Futebol_, Altimetro_, Solution),
	to_the_right(Futebol_, Altimetro_, Solution),

	%11
	to_the_left(Rui_, Bussola_, Solution),

	%12
	Hidraulico_ = aviao(_,_,_,hidraulico,_,_),
	Temperatura_ = aviao(_,_,_,temperatura,_,_),
	to_the_left(Radio_, Hidraulico_, Solution),
	to_the_left(Hidraulico_, Temperatura_, Solution),

	%13
	Verde_ = aviao(_,_,verde,_,_,_),
	Farfarelli_ = aviao(farfarelli,_,_,_,_,_),
	to_the_right(Verde_, Farfarelli_, Solution),

	%14
	member(aviao(rui,_,branca,_,_,_), Solution),

	%15
	member(aviao(_,_,azul,_,cha,_), Solution),

	%16
	Paulista_ = aviao(_,paulista,_,_,_,_),
	Amarela_ = aviao(_,_,amarela,_,_,_),
	are_next(Paulista_, Amarela_, Solution),
	to_the_left(Paulista_, Amarela_, Solution),

	%17
	are_next(Rui_, Mineiro_, Solution),

	%18
	Gaucho_ = aviao(_,gaucho,_,_,_,_),
	are_next(Gaucho_, Cerveja_, Solution),
	to_the_right(Gaucho_, Cerveja_, Solution),

	%19
	are_next(aviao(_,fluminense,_,_,_,_), aviao(_,_,azul,_,_,_), Solution),

	%10
	are_next(aviao(nascimento,_,_,_,_,_), Cha_, Solution),


	% checking if all values are valid and make sense:

	pilot(Pilot0),
	pilot(Pilot1),
	pilot(Pilot2),
	pilot(Pilot3),
	pilot(Pilot4),
	all_differents([Pilot0, Pilot1, Pilot2, Pilot3, Pilot4]),

	demonym(Demonym0),
	demonym(Demonym1),
	demonym(Demonym2),
	demonym(Demonym3),
	demonym(Demonym4),
	all_differents([Demonym0, Demonym1, Demonym2, Demonym3, Demonym4]),

	smokeColor(SmokeColor0),
	smokeColor(SmokeColor1),
	smokeColor(SmokeColor2),
	smokeColor(SmokeColor3),
	smokeColor(SmokeColor4),
	all_differents([SmokeColor0, SmokeColor1, SmokeColor2, SmokeColor3, SmokeColor4]),

	anomaly(Anomaly0),
	anomaly(Anomaly1),
	anomaly(Anomaly2),
	anomaly(Anomaly3),
	anomaly(Anomaly4),
	all_differents([Anomaly0, Anomaly1, Anomaly2, Anomaly3, Anomaly4]),

	beverage(Beverage0),
	beverage(Beverage1),
	beverage(Beverage2),
	beverage(Beverage3),
	beverage(Beverage4),
	all_differents([Beverage0, Beverage1, Beverage2, Beverage3, Beverage4]),

	sport(Sport0),
	sport(Sport1),
	sport(Sport2),
	sport(Sport3),
	sport(Sport4),
	all_differents([Sport0, Sport1, Sport2, Sport3, Sport4]).
