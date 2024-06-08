--Ejercicio 1

--a
data Forma = Piedra | Papel | Tijera

leGana :: Forma -> Forma -> Bool 
leGana Tijera Papel = True
leGana Papel Piedra  = True
leGana Piedra Tijera = True
leGana _ _ = False

-- ghci> leGana Piedra Papel
-- False
-- ghci> leGana Tijera Papel
-- True
-- ghci> leGana Tijera Piedra
-- False
-- ghci> leGana Tijera Tijera
-- False

--b
type Nombre = String

data Jugador = Mano Nombre Forma
ganador :: Jugador -> Jugador -> Maybe Nombre
ganador (Mano j1 f) (Mano j2 f2) 
                                | leGana f f2 = Just j1
                                | otherwise = Just j2

                                
-- ghci> leGana Piedra Piedra
-- False
-- ghci> leGana Tijera Piedra
-- False
-- ghci> ganador (Mano "Versa" Papel) (Mano "Viky" Piedra)
-- Just "Versa"

instance Eq Forma where
    Piedra == Piedra = True
    Tijera == Tijera = True 
    Papel == Papel = True 
    _ == _ = False

{- Ejercicio 2 -}
quienJugo :: Forma -> [Jugador] -> [Nombre]
quienJugo f [] = []
quienJugo f ((Mano j1 f1):js) 
                                | f == f1 = j1 : quienJugo f js
                                | otherwise = quienJugo f js


ejemplo1 :: [Jugador]
ejemplo1 = [Mano "Versa" Papel,Mano "Viky" Piedra,Mano "Julian" Tijera]

-- ghci> quienJugo Tijera ejemplo1 
-- ["Julian"]
-- ghci> quienJugo Piedra ejemplo1 
-- ["Viky"]