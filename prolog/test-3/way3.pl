tree(if_then_else('has fur',
                  if_then_else('says woof',
                               animal(dog),
                               if_then_else('says meow',
                                            animal(cat),
                                            false)),
                  if_then_else('has feathers',
                               if_then_else('says quack',
                                            animal(duck),
                                            false),
                               false))).

animal(A) :-
        tree(T),
        tree_animal(T, A).

tree_animal(animal(A), A).
tree_animal(if_then_else(Cond,Then,Else), A) :-
        (   is_true(Cond) ->
            tree_animal(Then, A)
        ;   tree_animal(Else, A)
        ).

is_true(Q) :-
	format("~w? ", [Q]),
	read(yes).
