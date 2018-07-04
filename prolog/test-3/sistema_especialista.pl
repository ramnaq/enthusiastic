/*

Ramna Sidharta (16100742)

Para este trabalho, foi usada a abordagem da criação de uma Linguagem
Específica de Domínio (Domain-Specific Language ou DSL), exemplificada no link
fornecido no enunciado do trabalho
(https://www.metalevel.at/prolog/expertsystems).

Este caminho foi seguido pois o mesmo usa elementos mais específicos do Prolog,
os quais não foram vistos em aulas anteriores, portanto dessa forma foi
possível aprender um pouco mais sobre a linguagem e sobre o paradigma lógico.

ATENÇÃO: No arquivo .zip enviado há também o módulo reif.pl, obtido em
http://www.complang.tuwien.ac.at/ulrich/Prolog-inedit/swi/reif.pl, para o uso
de alguns metapredicados, como por exemplo if_/3
(https://www.metalevel.at/prolog/metapredicates#if_3).  Por esta razão, para
  realizar consultas a regras desse arquivo, inclua também reif.pl.  No
  interpretador do Prolog -> [reif, sistema_especialista].


Sobre o código:

As condições que, quando verdadeiras, significam que o paciente não está com
nenhuma das doenças abordadas (chikungunya, dengue ou zika), contém logo em
seguida o operador de corte, resultando em 'X = nao_doente', para uma consulta
'doenca(X)'.

Algumas regras foram resumidas, por exemplo a quarta última da lista abaixo,
referente às regras 30 e 31, foram representadas em apenas uma 'doenca/2' já
que tendo coceira leve ou moderada, o disgnóstico é Zika (veja o segundo
  'sintoma' da quarta última regra abaixo).

*/


doencas([
    doenca(chikungunya, [sintoma('Temperatura corporal >= 38º'), sintoma('Febre durante 2 a 3 dias')]),
	doenca(dengue, [sintoma('Temperatura corporal >= 38º'), sintoma('Febre durante 4 a 7 dias')]),
    doenca(zika, [sintoma('Temperatura corporal < 38º')]),
    doenca(zika, [sintoma('Manchas no corpo apareceram no 1º ou 2º dia')]),
    doenca(chikungunya, [sintoma('Manchas no corpo apareceram entre o 2º e 5º dia')]),
    doenca(dengue, [sintoma('Manchas no corpo apareceram após o 4º dia')]),
    doenca(dengue, [sintoma('Não há manchas na pele')]),
    doenca(dengue, [sintoma('Há dor nos músculos'), sintoma('Dor intensa')]),
    doenca(zika, [sintoma('Há dor nos músculos'), sintoma('Dor moderada')]),
    doenca(chikungunya, [sintoma('Há dor nos músculos'), sintoma('Dor leve')]),
	doenca(nao_doente, [sintoma('Não há dor nos músculos')]), !,
    doenca(chikungunya, [sintoma('Há dor nas articulações'), sintoma('Dor intensa')]),
	doenca(nao_doente, [sintoma('Não há dor nas articulações')]), !,
    doenca(dengue, [sintoma('Há dor nas articulações'), sintoma('Dor leve')]),
    doenca(zika, [sintoma('Há dor nas articulações'), sintoma('Dor moderada')]),
    doenca(dengue, [sintoma('Não há edema nas articulações')]),
    doenca(zika, [sintoma('Há edema nas articulações'), sintoma('Dor leve')]),
    doenca(chikungunya, [sintoma('Há edema nas articulações'), sintoma('Dor moderada ou intensa')]),
    doenca(zika, [sintoma('Paciente com conjuntivite')]),
	doenca(chikungunya, [sintoma('Paciente com conjuntivite')]),
    doenca(chikungunya, [sintoma('Paciente não tem conjuntivite'), sintoma('Há dor nas articulações'), sintoma('Dor intensa')]),
    doenca(dengue, [sintoma('Paciente não tem conjuntivite'), sintoma('Há dor nas articulações'), sintoma('Dor leve')]),
    doenca(nao_doente, [sintoma('Não há dor de cabeça')]), !,
    doenca(chikungunya, [sintoma('Há dor de cabeça'), sintoma('Dor leve')]),
    doenca(zika, [sintoma('Há dor de cabeça'), sintoma('Dor leve')]),
    doenca(chikungunya, [sintoma('Há dor de cabeça'), sintoma('Dor moderada'), sintoma('Há dor nas articulações'), sintoma('Dor intensa')]),
    doenca(dengue, [sintoma('Há dor de cabeça'), sintoma('Dor intensa')]),
    doenca(zika, [sintoma('Há dor de cabeça'), sintoma('Dor moderada'), sintoma('Há dor nas articulações'), sintoma('Dor moderada')]),
	doenca(nao_doente, [sintoma('Não há coceira')]), !,
    doenca(dengue, [sintoma('Há coceira'), sintoma('Coceira leve'), sintoma('Há dor nos músculos'), sintoma('Dor intensa')]),
    doenca(chikungunya, [sintoma('Há coceira'), sintoma('Coceira leve'), sintoma('Há dor nos músculos'), sintoma('Dor leve')]),
    doenca(zika, [sintoma('Há coceira'), sintoma('Coceira moderada ou intensa')]),
    doenca(zika, [sintoma('Houve alteração no sistema nervoso')]),
    doenca(dengue, [sintoma('Não houve alteração no sistema nervoso'), sintoma('Há dor nas articulações'), sintoma('Dor leve')]),
    doenca(chikungunya, [sintoma('Não houve alteração no sistema nervoso'), sintoma('Há dor nas articulações'), sintoma('Dor intensa')])
  ]).

doenca(A) :-
        doencas(Doencas),
        Known0 = [],
        phrase(qualquer_doenca(Doencas, A), [Known0], _).

qualquer_doenca([Doenca|Doencas], A) -->
        qualquer_doenca_(Doenca, Doencas, A).

qualquer_doenca_(doenca(A0, []), Doencas, A) -->
        (   { A0 = A }
        ;   qualquer_doenca(Doencas, A)
        ).
qualquer_doenca_(doenca(A0, [C|Cs]), Doencas, A) -->
        state0_state(Known0, Known),
        { condicao_verdadeira(C, T, Known0, Known) },
        prox_doenca(T, doenca(A0,Cs), Doencas, A).

prox_doenca(sim, Doenca, Doencas, A) --> qualquer_doenca([Doenca|Doencas], A).
prox_doenca(nao, _, Doencas, A) --> qualquer_doenca(Doencas, A).

state0_state(S0, S), [S] --> [S0].

condicao_verdadeira(sintoma(Q), Answer, Known0, Known) :-
        if_(known_(Q,Answer,Known0),
            Known0 = Known,
            ( format("~w?\n", [Q]),
              read(Answer),
              Known = [known(Q,Answer)|Known0])).

known_(What, Answer, Known, Truth) :-
        if_(memberd_t(known(What,sim), Known),
            ( Answer = sim, Truth = true ),
            if_(memberd_t(known(What,nao), Known),
                ( Answer = nao, Truth = true),
                Truth = false)).

sintoma(Q) :-
	format("~w? ", [Q]),
	read(sim).
