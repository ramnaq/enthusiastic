module Ponto (Ponto (Ponto2D),
			  distancia,
			  colineares,
			  formaTriangulo) where

data Ponto = Ponto2D Float Float

distancia :: Ponto -> Ponto -> Float
colineares :: Ponto -> Ponto -> Ponto -> Bool
formaTriangulo :: Ponto -> Ponto -> Ponto -> Bool

-- distancia entre A e B é a raíz quadrada da soma das diferenças de suas coordenadas
distancia (Ponto2D x1 y1) (Ponto2D x2 y2) =
	((x2 - x1)**2 + (y2 - y1)**2)**(0.5)

-- três pontos A, B, C são colineares no plano cartesiano se o determinante da matriz
-- <A, B, C dispostos nas linhas + uma coluna (1, 1, 1)> é igual a 0
colineares (Ponto2D x1 y1) (Ponto2D x2 y2) (Ponto2D x3 y3) =
	0 == (x1*y2 + y1*x3 + x2*x3) - (y1*x2 + x1*y3 + y2*x3)

formaTriangulo a b c =
	not $ colineares a b c
