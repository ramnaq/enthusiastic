%a
?- findall(T, (filme(_,T,L,_,_), L < 2001),Titulos).

Titulos = ['Monty Python: O Sentido da Vida'].


%b
?- findall(T, (
	filme(_,T,L,_,_),
	L>=2001,
	L=<2004
  ), Titulos).

Titulos = ['Edukators', 'Lavoura Arcaica', 'Lisbela e o Prisioneira', 'Abril despeda�ado', 'Di�rios de motocicleta'].


%c
?- findall(T,
  	filme(_,T,_,_,br),
	TitulosBrasileiros),
sort(TitulosBrasileiros,S).

TitulosBrasileiros = ['Lavoura Arcaica', 'Lisbela e o Prisioneira', 'Abril despeda�ado', 'Di�rios de motocicleta'],
S = ['Abril despeda�ado', 'Di�rios de motocicleta', 'Lavoura Arcaica', 'Lisbela e o Prisioneira'].


%d
?- findall(T,(
	filme(_,T,_,_,Pais),
	Pais \== br), TitulosNaoBrasileiros),
sort(TitulosNaoBrasileiros,S).

TitulosNaoBrasileiros = ['Monty Python: O Sentido da Vida', 'Edukators'],
S = ['Edukators', 'Monty Python: O Sentido da Vida'].


%e
?- findall(filme(Titulo,Diretor),(
	filme(_,Titulo,L,Diretor,Pais),
	L =< 2004,
	Pais == de),TitulosAlemaes),
sort(TitulosAlemaes,S).

TitulosAlemaes = S, S = [filme('Edukators', 'Hans Weingartner')].


%f
?- findall(Id,(dvd(Id,FilmeId,_), filme(FilmeId,_,_,_,Pais), Pais \== br), DvdsExtrangeiros).

DvdsExtrangeiros = [d1, d2, d6, d7, d8].


%g
?- findall(Id,(dvd(Id,FilmeId,Estante), Estante \== est2, filme(FilmeId,_,_,_,Pais), Pais == br), DvdsBrasileiros).

DvdsBrasileiros = [d4, d5].

%h
?- findall(Diretor,(dvd(_,Id,est1), filme(Id,_,_,Diretor,_)), DiretoresEstante1), sort(DiretoresEstante1,S).
DiretoresEstante1 = ['Terry Jones', 'Hans Weingartner', 'Guel Arraes', 'Terry Jones'],
S = ['Guel Arraes', 'Hans Weingartner', 'Terry Jones'].

%i
?- findall(Titulo,(filme(Id,Titulo,_,_,_), not(dvd(_,Id,_))), TitulosSemDvd).

TitulosSemDvd = ['Di�rios de motocicleta'].


%j
?- findall(Pais,(dvd(_,Id,Est), (Est == est1; Est == est4), filme(Id,_,_,_,PaisId), pais(PaisId,Pais)), PaisesFilmesEst1ou4).

PaisesFilmesEst1ou4 = ['Unided Kingdom', 'Alemanha', 'Brasil', 'Unided Kingdom', 'Alemanha', 'Alemanha'].


%k
?- findall(NomeCliente, (cliente(IdCliente,NomeCliente,Data), locacao(IdCliente,_,'2005-11-07')),Clientes).

Clientes = ['Bob', 'Bob'].


%l
?- findall(Estante, (locacao(_,IdDVD,_), dvd(IdDVD,_,Estante)), EstantesFilmesLocados), sort(EstantesFilmesLocados,S).

EstantesFilmesLocados = [est1, est1, est3, est2, est2, est4, est4, est1, est3|...],
S = [est1, est2, est3, est4].

%m
