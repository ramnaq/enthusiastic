module Fila (Fila (Queue), enqueue, dequeue, first, emptyQueue) where

-- uma fila é representada como uma lista, que terá restrições em seu acesso, como a pilha
data Fila t = Queue [t]
	deriving (Eq, Show)

-- para enfileirar um novo elemento, adiciona-se o mesmo ao final da fila (lista)
enqueue :: Fila t -> t -> Fila t
enqueue (Queue q) x = Queue (q ++ [x])

-- desenfileirar um elemento significa retirar da fila o seu primeiro elemento
dequeue :: Fila t -> Fila t
dequeue (Queue []) = error "Can't dequeue from an empty queue"
dequeue (Queue (head:tail)) = Queue (tail)

-- o primeiro elemento de uma fila é o primeiro elemento da lista
first :: Fila t -> t
first (Queue (head:tail)) = head

emptyQueue :: Fila t
emptyQueue = Queue []
