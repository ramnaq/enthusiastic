data Forma = Circulo Float | Retangulo Float Float | Triangulo Float Float

area :: Forma -> Float
area (Circulo raio) = (*) pi raio^2
area (Retangulo largura comprimento) = (*) largura comprimento
area (Triangulo base altura) = (/2) $ (*) base altura

main = do
	print $ area $ Triangulo 5 5
