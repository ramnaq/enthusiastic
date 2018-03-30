module Pilha (Pilha (Stack), emptyStack, push, pop, top) where

data Pilha t = Stack [t]
    deriving (Eq,Show)

{- insere x no início da pilha (lista) -}
push :: Pilha t -> t -> Pilha t
push (Stack s) x = Stack (x:s)

{- retira o elemento x que está no início/topo da pilha (lista) -}
pop :: Pilha t -> Pilha t
pop (Stack []) = error "Empty"
pop (Stack (x:s)) = Stack s

{- retorna x, que é o elemento no topo da pilha (lista) -}
top :: Pilha t -> t
top (Stack []) = error "Empty"
top (Stack (x:s)) = x

{- cria (retorna) pilha (lista) vazia -}
emptyStack :: Pilha t
emptyStack = Stack []
