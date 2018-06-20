# Aircraft Squadron II Problem
An example of problem solution using Prolog; Aircraft Squadron II (Esquadrilha de Aviões II) is a version of the classic "Einstein IQ Test" ([Einstein's Riddle](https://www.brainzilla.com/logic/zebra/einsteins-riddle/), in portuguese [here](https://rachacuca.com.br/teste-de-einstein/)).

You can [verify](https://rachacuca.com.br/logica/problemas/esquadrilha-de-avioes-ii/) your solution online (portuguese only).
See [clues.txt](clues.txt) to translated clues.

## Running
To get the solution, just run:
```
?- solution(List).
```

Or the following query to better read the resultant list:
```
?- solution(List), nth0(0,List,A), nth0(1,List,B), nth0(2,List,C), nth0(3,List,D), nth0(4, List, E)
```
