data Ponto = Plano Float Float | Espaco Float Float Float

distancia :: Ponto -> Ponto -> Float
distancia (Plano x1 y1) (Plano x2 y2) =
	( (x2-x1)^2 + (y2-y1)^2 )**(0.5)
distancia (Espaco x1 y1 z1) (Espaco x2 y2 z2) =
	( (x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2 )**(0.5)

main = do
	print $ distancia (Plano 1 1) (Plano 2 2)
	print $ distancia (Espaco 1 1 1) (Espaco 2 2 2)
