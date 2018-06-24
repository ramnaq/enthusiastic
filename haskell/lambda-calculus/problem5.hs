data Ponto = Espaco Float Float Float
distancia :: Ponto -> Ponto -> Float
distancia = (\(Espaco x1 y1 z1) (Espaco x2 y2 z2) -> ((x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2)**0.5)

main = do
	print $ distancia (Espaco 1 1 1) (Espaco 2 2 2)
