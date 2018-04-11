data Ponto = Plano Float Float | Espaco Float Float Float

-- A
colineares :: Ponto -> Ponto -> Ponto -> Bool
colineares (Plano x1 y1) (Plano x2 y2) (Plano x3 y3) =
	(x1*y2 + y1*x3 + x2*y3) - (x3*y2 + x2*y1 + x1*y3) == 0


-- B
menorDistancia :: [Ponto] -> Float
menorDistancia [] = -1
menorDistancia pontos = minimum (distancias pontos)

-- auxiliar de B
distancias :: [Ponto] -> [Float]
distancias [] = []
distancias (x:s)
	| (length s /= 0) = [distancia x (head s)] ++ distancias s ++ distanciaComTodos x (head s) (tail s)
	| otherwise = []

-- auxiliar de B
distancia :: Ponto -> Ponto -> Float
distancia (Plano x1 y1) (Plano x2 y2) = ((x2-x1)^2 + (y2-y1)^2)**(0.5)

-- auxiliar de B
distanciaComTodos :: Ponto -> Ponto -> [Ponto] -> [Float]
distanciaComTodos _ _ [] = []
distanciaComTodos x curr (head:tail) =
	[distancia x curr] ++ (distanciaComTodos x head tail)

main = do
	print $ colineares (Plano 1 2) (Plano 2 3) (Plano 3 3)  -- False


{-
 - Para obter a menor distância, cria-se uma lista com todas as distâncias
 - e obtêm-se o mínimo elemento
 -
 - Para obter todas as distâncias entre os pontos, obtêm-se as distâncias de
 - todos os elementos vizinhos e concatena-se esta lista com as distâncias
 - do elemento x com todos os outros
 -
 - A linha 18 pode dar exceção opr causa de tail s, não consigo arrumar agora,
 - mas seria basiacmente essa a ideia.
 -
 -}
