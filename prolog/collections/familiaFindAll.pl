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

%findall(G, genitor(G,_), Genitores).

%findall(G, (genitor(G,_), idade(G,I), I >= 50), Genitores).

%findall(G, genitor(G,_), Genitores), sort(Genitores, GenitoresOrdenado).

%findall(G, genitor(G,_), Genitores), list_to_set(Genitores, GenitoresNaoDup), length(GenitoresNaoDup, QuantidadeGenitores).

%findall(pessoa(Pessoa, Idade), (genitor(_,Pessoa), not(genitor(Pessoa,_)), idade(Pessoa, Idade)), Pessoas).


%bagof(Filho, genitor(Genitor,Filho), Filhos).

%bagof(Filho, Genitor ^ genitor(Genitor,Filho), Filhos).

%bagof(Filho, Idade ^ Genitor ^ (genitor(Genitor,Filho), idade(Genitor,Idade), Idade >= 50), Filhos).


%setof(Filho, genitor(Genitor,Filho), Filhos).

%setof(Filho, Genitor ^ genitor(Genitor,Filho), Filhos).

%setof(Filho, Idade ^ Genitor ^ (genitor(Genitor,Filho), idade(Genitor,Idade), Idade >= 50), Filhos).
