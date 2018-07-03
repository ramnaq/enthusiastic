doencas([
	doenca(dengue, [is_true('Temperatura corporal >= 38º'), is_true('Febre durante 4 a 7 dias')]),
	doenca(chikungunya, [is_true('Temperatura corporal >= 38º'), is_true('Febre durante 2 a 3 dias')]),
    doenca(zika, [is_true('Temperatura corporal < 38º')])
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
        { condition_truth(C, T, Known0, Known) },
        prox_doenca(T, doenca(A0,Cs), Doencas, A).


prox_doenca(sim, Doenca, Doencas, A) --> qualquer_doenca([Doenca|Doencas], A).
prox_doenca(nao, _, Doencas, A) --> qualquer_doenca(Doencas, A).


state0_state(S0, S), [S] --> [S0].


condition_truth(is_true(Q), Answer, Known0, Known) :-
        if_(known_(Q,Answer,Known0),
            Known0 = Known,
            ( format("~w?\n", [Q]),
              read(Answer),
              Known = [known(Q,Answer)|Known0])).


known_(What, Answer, Known, Truth) :-
        if_(memberd_t(known(What,yes), Known),
            ( Answer = yes, Truth = true ),
            if_(memberd_t(known(What,no), Known),
                ( Answer = no, Truth = true),
                Truth = false)).


is_true(Q) :-
	format("~w? ", [Q]),
	print(oi),
	read(yes).

