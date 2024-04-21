
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
instance Ord Temperatura 
    where
        compare O B = LT
        compare B A = LT
        compare A F = LT 
        compare F G = LT
        compare G K = LT
        compare K M = LT
        compare _ _ = EQ

instance Ord Luminosidad
    where
        compare SuperGigante Gigante = GT
        compare Gigante  SecuenciaPrincipal = GT
        compare SecuenciaPrincipal Enana = GT

instance Ord Astro
    where
        Estrella a b c < Estrella d e f = a < d && b < e 
