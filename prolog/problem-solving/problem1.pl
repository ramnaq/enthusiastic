cap(amarela).
cap(azul).
cap(branca).
cap(verde).

country(brasil).
country(china).
country(eua).
country(russia).

specialty(borboleta).
specialty(costas).
specialty(crawl).
specialty(peito).

medals(2).
medals(3).
medals(5).
medals(8).

juice(abacaxi).
juice(laranja).
juice(limao).
juice(maracuja).

age(19).
age(20).
age(21).
age(24).

% X is exactly to the left or to the right of Y
are_next(X,Y,List) :-
    nextto(X,Y,List); nextto(Y,X,List).

to_the_left(X,Y,List) :-
    nth0(Ix, List, X), nth0(Iy, List, Y), Ix < Iy.

to_the_right(X,Y,List) :-
    to_the_left(Y,X,List).

outermost(X,[X|_]).
outermost(X,List) :- last(List,X).

all_differents([]).
all_differents([H|T]) :-
	not(member(H,T)), all_differents(T).

solution(List) :-
	% swimmer(<Cap>, <Country>, <Specialty>, <Medals>, <Juice>, <Age>)
	List = [
	  swimmer(Cap0, Country0, Specialty0, Medals0, Juice0, Age0),
	  swimmer(Cap1, Country1, peito, 3, laranja, Age1),
	  swimmer(Cap2, Country2, Specialty2, Medals2, Juice2, 24),
	  swimmer(Cap3, Country3, Specialty3, Medals3, Juice3, Age3)
  	],

	%1
	member(swimmer(_,_,_,8,_,24), List),

	%2
	Azul_ = swimmer(azul,_,_,_,_,_),
	to_the_left(Azul_, swimmer(_,_,_,_,_,19), List),
	
	%3
	outermost(swimmer(_,_,_,_,_,20), List),

	%4
	Limao_ = swimmer(_,_,_,_,limao,_),
	Crawl_ = swimmer(_,_,crawl,_,_,_),
	to_the_left(Limao_, Crawl_, List), are_next(Limao_, Crawl_, List),

	%5
	to_the_right(swimmer(_,_,_,_,maracuja,_), Azul_, List),

	%6 (see the swimmer at List[1] above)
	%7 (see the swimmer at List[2] above)
	%8 (see the swimmer at List[1] above)

	%9
	FiveMedals_ = swimmer(_,_,_,5,_,_),
	OrangeJuice_ = swimmer(_,_,_,_,laranja,_),
	to_the_left(FiveMedals_, OrangeJuice_, List), are_next(FiveMedals_, OrangeJuice_, List),
	
	%10 (see the swimmer at List[1] above)

	%11
	Backstroke_ = swimmer(_,_,costas,_,_,_),
	ThreeMedals_ = swimmer(_,_,_,3,_,_),
	to_the_right(Backstroke_, ThreeMedals_, List), are_next(Backstroke_, ThreeMedals_, List),

	%12
	Brasil_ = swimmer(_,brasil,_,8,_,_),
	member(Brasil_, List),

	%13
	China_ = swimmer(_,china,_,_,_,_),
	to_the_left(China_, Brasil_, List), are_next(China_, Brasil_, List),

	%14
	EUA_ = swimmer(_,eua,_,5,_,_),
	member(EUA_, List),

	%15
	last(List, swimmer(branca,_,_,_,_,_)),

	%16
	are_next(swimmer(_,_,borboleta,_,_,_), swimmer(azul,_,_,_,_,_), List),

	%17
	EUA_ = swimmer(verde,_,_,_,_,_),


	% checking if all values are valid and make sense:

	cap(Cap0),
	cap(Cap1),
	cap(Cap2),
	cap(Cap3),
	all_differents([Cap0, Cap1, Cap2, Cap3]),

	country(Country0),
	country(Country1),
	country(Country2),
	country(Country3),
	all_differents([Country0, Country1, Country2, Country3]),

	specialty(Specialty0),
	% Specialty1 = peito  (see clue 10) 
	specialty(Specialty2),
	specialty(Specialty3),
	all_differents([Specialty0, peito, Specialty2, Specialty3]),
	
	medals(Medals0),
	% Medals1 = 3, (see clue 8)
	medals(Medals2),
	medals(Medals3),
	all_differents([Medals0, 3, Medals2, Medals3]),

	juice(Juice0),
	% Juice1 = laranja  (clue 6)
	juice(Juice2),
	juice(Juice3),
	all_differents([Juice0, laranja, Juice2, Juice3]),

	age(Age0),
	age(Age1),
	% Age2 = 24  (see clue 7)
	age(Age3),
	all_differents([Age0, Age1, 24, Age3]).
