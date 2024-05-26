
-- a
type Nombre = String
type DistEstrella = Float
type NumSat = Int
data Luminosidad = SuperGigante | Gigante | SecuenciaPrincipal | Enana deriving Show
data Temperatura = A|B|F|G|K|M|O deriving Show
data Estructura = Rocoso | Gaseoso deriving Show
data Astro = Estrella Luminosidad Temperatura Nombre | Planeta Estructura NumSat DistEstrella deriving Show
-- b
masSatelites :: [Astro] -> Int -> [Astro]
masSatelites [] _ = []
masSatelites (Estrella {}:xs) n = masSatelites xs n
masSatelites (Planeta e ns de:xs) n 
                                    | n <= ns = Planeta e ns de: masSatelites xs n
                                    | otherwise = masSatelites xs n

ejemplo1 :: [Astro]
ejemplo1 = [Planeta Rocoso 5 1.0,Estrella SuperGigante A "Milo",Planeta Rocoso 54 77.0]
ejemplo2 :: [Astro]
ejemplo2 = [Estrella Gigante M "Mercury", Planeta Gaseoso 5 1.23]
ejemplo3 :: [Astro]
ejemplo3 = [Planeta Rocoso 1670 0.333, Estrella Enana A "Blanca"]

{- 
ghci> masSatelites ejemplo3 1
[Planeta Rocoso 1670 0.333]
ghci> masSatelites ejemplo2 3
[Planeta Gaseoso 5 1.23]
ghci> masSatelites ejemplo1 120
[]
-}

-- c
auxDTemp :: Astro -> Maybe Temperatura
auxDTemp (Planeta {}) = Nothing
auxDTemp (Estrella _ temp _ )= Just temp


auxDLumin :: Astro -> Maybe Luminosidad
auxDLumin (Planeta {}) = Nothing
auxDLumin (Estrella lum _ _) = Just lum

auxDNombre :: Astro -> Maybe Nombre
auxDNombre (Planeta {}) = Nothing
auxDNombre (Estrella _ _ nom) = Just nom        

-- Hacer Ejercicios similares

-- Ejercicio 3
--a
data Nivel = Uno | Dos | Tres deriving (Eq,Show)
data NotasDeIngles = EvolucionDelEstudiante String Nivel Int Int Int NotasDeIngles
                    | NoHayMásEstudiantes deriving Show

--Ejemplos Estudiantes
ejemploest1 :: NotasDeIngles
ejemploest1 = EvolucionDelEstudiante "Ricardo" Tres 4 5 10 NoHayMásEstudiantes
ejemploest2 :: NotasDeIngles
ejemploest2 = EvolucionDelEstudiante "Gerardo" Dos 8 8 10 NoHayMásEstudiantes
ejemplogrupest1 :: NotasDeIngles
ejemplogrupest1 = EvolucionDelEstudiante "Ricardo" Tres 4 5 10 (EvolucionDelEstudiante "Gerardo" Dos 8 8 10 (EvolucionDelEstudiante "Armando" Tres 8 8 5 NoHayMásEstudiantes))

--b
pasaDeNivel :: NotasDeIngles -> String -> Bool
pasaDeNivel NoHayMásEstudiantes _ = False
pasaDeNivel (EvolucionDelEstudiante nme lvl nta1 nta2 fnl _) nmebuscado
                                                                        | nme==nmebuscado &&( lvl == Uno||lvl==Dos) = (nta1 == 8||nta2 == 8) && fnl >=7 
                                                                        | nme == nmebuscado && lvl == Tres = (nta1 == 6||nta2 == 6) && fnl >= 7 
                                                                        | otherwise = False

-- ghci> pasaDeNivel ejemploest1 "Juan"
-- False
-- ghci> pasaDeNivel ejemploest1 "Ricardo"
-- False
-- ghci> pasaDeNivel ejemploest2 "Gerardo"
-- True

-- c
devolverNotaFinal :: NotasDeIngles -> String -> Maybe Int
devolverNotaFinal NoHayMásEstudiantes _ = Nothing
devolverNotaFinal (EvolucionDelEstudiante nme _ _ _ fnl nI) nmebuscado 
                                                                                |nmebuscado == nme = Just fnl
                                                                                |otherwise = devolverNotaFinal nI nmebuscado

-- ghci> devolverNotaFinal ejemplogrupest1 "Armando"
-- Just 5
-- ghci> devolverNotaFinal ejemplogrupest1 "Gerardo"
-- Just 10