-- E|ercicio 1
-- a)
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
data Carrera = Matematica | Fisica | Computacion | Astronomia

-- b)
titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Computacion"
titulo Astronomia = "Licenciatura en Astronomia"

-- c)
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si  deriving (Eq,Ord,Show) 


--d)
cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

-- E|ercicio 2
-- *Se ha modificado el tipo NotaBasica para derivarlo con el fin de llevar a cabo la función
-- ghci> Do <= Re
-- True
-- ghci> min Fa Sol
-- Fa

-- E|ercicio 3
-- a)
minimoElemento :: Ord a => [a] -> a 
minimoElemento [x] = x
minimoElemento (x:y:xs) 
                        | x<y = minimoElemento (x:xs)
                        | otherwise = minimoElemento (y:xs)
-- ghci> minimoElemento [4,2,3,5,7]
-- 2
-- ghci> minimoElemento [1,2,5,7,9,20,0]
-- 0

-- b)
minimoElemento' :: (Bounded a, Ord a) => [a] -> a
minimoElemento' [] = minBound
minimoElemento' xs = minimum xs
-- ghci> minimoElemento' ([1,5,10]::[Int])
-- 1
-- ghci> minimoElemento' ([]::[Bool])
-- False
-- b


--c)
-- ghci> minimoElemento [Fa,La,Sol,Re,Fa]
-- Re

-- E|ercicio 4
-- a)
-- Sinonimos de tipo
type Altura = Int
type NumCamiseta = Int

-- Tipos algebraicos sin parametros (aka enumerados)
data Zona = Arco | Defensa | Mediocampo | Delantera deriving Eq
data TipoReves = DosManos | UnaMano
data Modalidad = Carretera | Pista | Monte | BMX
data PiernaHabil = Izquierda | Derecha

-- Sinonimo
type ManoHabil = PiernaHabil

-- Deportista es un tipo algebraico con constructores parametricos
data Deportista = Ajedrecista -- Constructor sin argumentos 
                | Ciclista Modalidad -- Constructor con un argumento
                | Velocista Altura -- Constructor con un argumento
                | Tenista TipoReves ManoHabil Altura -- Constructor con tres argumentos
                | Futbolista Zona NumCamiseta PiernaHabil Altura -- Constructor con ...



ejemploDeportistaACT :: [Deportista]
ejemploDeportistaACT = [Ajedrecista,Ciclista Carretera,Tenista DosManos Izquierda 170] --Es acortado cada elemento que tiene en la lista
ejemploDeportistaFT :: [Deportista]
ejemploDeportistaFT = [Futbolista Arco 10 Izquierda 180,Velocista 160, Velocista 120]
eDVVVFAC :: [Deportista]
eDVVVFAC = [Velocista 170, Velocista 130, Velocista 150, Futbolista Delantera 10 Derecha 160, Ajedrecista, Ciclista BMX]
-- b)
-- Ciclista es de tipo Deportista

-- c)
contar_Velocistas :: [Deportista] -> Int
contar_Velocistas [] = 0
contar_Velocistas (Velocista _:xs) = 1 + contar_Velocistas xs
contar_Velocistas (_:xs) = 0 + contar_Velocistas xs

-- ghci> contar_velocistas eDVVVFAC 
-- 3
-- ghci> contar_velocistas ejemploDeportistaFT 
-- 2
-- ghci> contar_velocistas ejemploDeportistaACT
-- 0


-- d,e)
{- d) Program´a la funci´on contar_futbolistas :: [Deportista] -> Zona -> Int que
dada una lista de deportistas xs, y una zona z, devuelve la cantidad de futbolistas
incluidos en xs que juegan en la zona z. Programa contar_futbolistas sin usar
igualdad, utilizando pattern matching. -}

contar_Futbolistas :: [Deportista] -> Zona -> Int
contar_Futbolistas [] _ = 0
contar_Futbolistas deportistas z  = length(filter (esfutz z) deportistas)

esfutz :: Zona -> Deportista -> Bool
esfutz zona (Futbolista z _ _ _) = zona == z
esfutz _ _ = False

-- ghci> contar_Futbolistas ejemploDeportistaFT Arco
-- 1
-- ghci> contar_Futbolistas eDVVVFAC Mediocampo
-- 0
-- **Para poder comparar el auxiliar coloqué un deriving a Zona tipo Eq 