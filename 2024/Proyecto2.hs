-- Ejercicio 1 - Tipos enumerados
-- a)
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
import Control.Monad (when)
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

-- Ejercicio 2 - Clases de tipos
-- *Se ha modificado el tipo NotaBasica para derivarlo con el fin de llevar a cabo la función
-- ghci> Do <= Re
-- True
-- ghci> min Fa Sol
-- Fa

-- E|ercicio 3 - Polimorfismo ad hoc 
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

-- Ejercicio 4 - Sinonimo de tipos; constructores con parametros
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
{- d) Programa la funcion contar_futbolistas :: [Deportista] -> Zona -> Int que
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

-- Ejercicio 5 - Definicion de clases
{- 
Cuando hablamos de definición de clases, ¿De qué hablamos?
-}


-- a)
sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

-- b)
data Alteracion = Bemol|Natural|Sostenido

-- c)
data NotaMusical = Nota NotaBasica Alteracion

-- d)
sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota nb Sostenido) = sonidoNatural nb +1
sonidoCromatico (Nota nb Natural) = sonidoNatural nb
sonidoCromatico (Nota nb Bemol) = sonidoNatural nb -1

-- ghci> sonidoCromatico (Nota Do Sostenido) 
-- 1
-- ghci> sonidoCromatico (Nota Re Sostenido) 
-- 3

-- e)
instance Eq NotaMusical
      where 
      a==b = sonidoCromatico a == sonidoCromatico b

-- ghci>  sonidoCromatico (Nota Do Sostenido) == sonidoCromatico (Nota Do Sostenido)
-- True
-- ghci>  sonidoCromatico (Nota Do Sostenido) == sonidoCromatico (Nota Re Bemol)
-- True

-- f)
instance Ord NotaMusical
      where
            a<=b = sonidoCromatico a <= sonidoCromatico b
            -- Instancia en el Orden de las NotaMusical donde cuando a es menor que b, el sonido cromático de a es menor igual que el sonido cromátrico b

-- ghci> sonidoCromatico (Nota Re Sostenido) <= sonidoCromatico (Nota Do Sostenido)
-- False
-- ghci>  sonidoCromatico (Nota Do Sostenido) > sonidoCromatico (Nota Re Sostenido)
-- False
-- ghci>  sonidoCromatico (Nota Do Sostenido) < sonidoCromatico (Nota Re Sostenido)
-- True

-- Ejercicio 6 - Tipos enumerados con polimorfismo

-- a)
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento xs = Just (head xs)

-- ghci> primerElemento [1,2,3,4]
-- Just 1
-- ghci> primerElemento []
-- Nothing

-- Ejercicio 7 - Tipos Recursivos
-- a) Programa las siguientes funciones:
data Cola = VaciaC | Encolada Deportista Cola 
-- 1) 
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada _ c) = Just c

-- 2) 
encolar :: Deportista -> Cola -> Cola
encolar dep VaciaC = Encolada dep VaciaC
encolar dep (Encolada d c) = Encolada d (Encolada dep c)

-- 3) 
busca :: Show Deportista => Cola -> Zona -> Maybe Deportista
busca VaciaC _ = Nothing
busca (Encolada (Futbolista _ nc ph a) _) z = Just (Futbolista z nc ph a)
busca _ _ = Nothing
-- b) A que otro tipo se parece Cola?.
-- Al tipo de listas convencional ':'

-- Ejercicio 8

-- a)
--Se podría definir como un nodo con nombre y número


data ListaAsoc a b = Vacia | Nodo a b ( ListaAsoc a b ) deriving (Show, Eq)

-- b)

-- 1
la_long :: ListaAsoc a b -> Int 
la_long Vacia = 0
la_long (Nodo _ _ la) = 1 + la_long la

ejemplo3Nodos :: ListaAsoc String Integer
ejemplo3Nodos = Nodo "Jeremias" 3513475621 (Nodo "Julio" 4808140 (Nodo "Julian" 987654312 Vacia))
ejemplo4Nodos :: ListaAsoc String Integer
ejemplo4Nodos = Nodo "Chino" 1212121 (Nodo "Viky" 14141414 (Nodo "Rotio" 55555555 (Nodo "Nico" 4 Vacia )))
-- ghci> la_long ejemplo3Nodos
-- 3
-- ghci> la_long ejemplo4Nodos
-- 4

-- 2
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat la Vacia = la
la_concat Vacia la = la
la_concat (Nodo clave dato la) lista = Nodo clave dato (la_concat lista la)
-- ghci> la_concat ejemplo3Nodos ejemplo4Nodos 
-- Nodo "Jeremias" 3513475621 (Nodo "Chino" 1212121 (Nodo "Julio" 4808140 (Nodo "Viky" 14141414 (Nodo "Julian" 987654312 (Nodo "Rotio" 55555555 (Nodo "Nico" 4 Vacia))))))

-- ghci> la_concat ejemplo4Nodos ejemplo3Nodos 
-- Nodo "Chino" 1212121 (Nodo "Jeremias" 3513475621 (Nodo "Viky" 14141414 (Nodo "Julio" 4808140 (Nodo "Rotio" 55555555 (Nodo "Julian" 987654312 (Nodo "Nico" 4 Vacia))))))

-- ghci> la_concat ejemplo3Nodos ejemplo4Nodos 
-- Nodo "Jeremias" 3513475621 (Nodo "Chino" 1212121 (Nodo "Julio" 4808140 (Nodo "Viky" 14141414 (Nodo "Julian" 987654312 (Nodo "Rotio" 55555555 (Nodo "Nico" 4 Vacia))))))

-- 3
-- Requerimos que la función agregue un nodo a la lista de asociaciones si la clave no estaba en la lista, pero si la lista ya tenia la clave, la actualiza

la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia c d = Nodo c d Vacia
la_agregar (Nodo clave dato la) c d
                                    |c == clave = Nodo c dato (la_agregar la clave dato)
                                    |otherwise = Nodo c d (la_agregar la clave dato)
-- ghci> la_agregar ejemplo4Nodos "Jonas" 12897310298
-- Nodo "Jonas" 12897310298 (Nodo "Chino" 1212121 (Nodo "Viky" 14141414 (Nodo "Rotio" 55555555 (Nodo "Nico" 4 Vacia))))
-- ghci> la_agregar ejemplo4Nodos "Candace" 33333142
-- Nodo "Candace" 33333142 (Nodo "Chino" 1212121 (Nodo "Viky" 14141414 (Nodo "Rotio" 55555555 (Nodo "Nico" 4 Vacia))))
-- ghci> la_agregar Vacia "Candace" 33333142
-- Nodo "Candace" 33333142 Vacia

-- 4
la_pares :: ListaAsoc a b -> [(a, b)] --Que transforma una lista de asociaciones en una lista de pares clave-dato.
la_pares Vacia = []
la_pares (Nodo clave dato la) = (clave,dato) : la_pares la 
-- ghci> la_pares ejemplo4Nodos 
-- [("Chino",1212121),("Viky",14141414),("Rotio",55555555),("Nico",4)]
-- ghci> la_pares ejemplo3Nodos 
-- [("Jeremias",3513475621),("Julio",4808140),("Julian",987654312)]
--5 dada una lista y una clave devuelve el dato asociado, si es que existe. En caso contrario devuelve Nothing.
la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b 
la_busca Vacia _ = Nothing
la_busca (Nodo clave dato la) c 
                              | clave == c = Just dato
                              | otherwise = la_busca la c
-- ghci> la_busca ejemplo4Nodos "Chino"
-- Just 1212121
-- ghci> la_busca ejemplo4Nodos "Rotsio"
-- Nothing
-- ghci> la_busca ejemplo4Nodos ""
-- Nothing
-- ghci> la_busca ejemplo4Nodos "Viky"
-- Just 14141414

-- 6) dada una clave a elimina la entrada en la lista
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia = Vacia
la_borrar c (Nodo clave dato la) 
                               | c == clave = la_borrar c la
                               | otherwise = Nodo clave dato (la_borrar c la)
-- ghci> la_borrar "Chino" ejemplo4Nodos
-- Nodo "Viky" 14141414 (Nodo "Rotio" 55555555 (Nodo "Nico" 4 Vacia))
-- ghci> la_borrar "Viky" ejemplo4Nodos
-- Nodo "Chino" 1212121 (Nodo "Rotio" 55555555 (Nodo "Nico" 4 Vacia))
-- ghci> la_borrar "" ejemplo4Nodos
-- Nodo "Chino" 1212121 (Nodo "Viky" 14141414 (Nodo "Rotio" 55555555 (Nodo "Nico" 4 Vacia)))

