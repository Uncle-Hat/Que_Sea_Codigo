{- Ejercicio 1 -}

--a
type Ejes = Int
type Altura = Float
type Peso = Int
data Auto = SoloA | ConTrailer Ejes Altura deriving Show
data Rodado = Moto | Automovil Auto | Bus Ejes Altura | Camion Ejes Altura Peso deriving Show

--b

verejes :: Rodado -> Int
verejes Moto = 0
verejes (Automovil SoloA) = 2
verejes (Automovil (ConTrailer ej _)) = ej
verejes (Bus ej _) = ej
verejes (Camion ej _ _) = ej

veralt :: Rodado -> Float
veralt Moto = 1.0
veralt (Automovil SoloA) = 1.8
veralt (Automovil( ConTrailer _ alt)) = alt
veralt (Bus _ alt) = alt 
veralt (Camion _ alt _) = alt

igualrodado :: Rodado -> Rodado -> Bool
igualrodado Moto Moto = True
igualrodado a b = verejes a == verejes b || (verejes a < verejes b && veralt a > veralt b) || False

--c
autosConTrailer :: [Rodado] -> Altura -> [Rodado]
autosConTrailer [] a = []
autosConTrailer ((Automovil (ConTrailer ej alt)):lr) a
                                                        | alt > a = Automovil (ConTrailer ej alt): autosConTrailer lr a
                                                        | otherwise = autosConTrailer lr a 

--d
dosIguales :: [Rodado] -> Bool
dosIguales [] = True
dosIguales (rod:rod1:rs) = igualrodado rod rod1 || False

-- ghci> dosIguales ejemplo1 
-- True
-- ghci> dosIguales ejemplo2
-- False


ejemplo1 :: [Rodado]
ejemplo1 = [Moto,Moto,Automovil(ConTrailer 5 2.0),Bus 2 3.0]
ejemplo2 :: [Rodado]
ejemplo2 = [Moto,Automovil(ConTrailer 5 2.0),Bus 2 3.0,Moto]

{- Ejercicio 2 -}

-- a
--Equivocación grave a la hora de leer la consigna, coloqué una ciudad en vez de dos
type Ciudad = String
type Distancia = Int
data Tramo = DefinicionDelTramo Ciudad Ciudad Distancia deriving Show
data Viaje = Unico Tramo | ConEscala Tramo Viaje deriving Show

-- b
tramopasapor :: Tramo -> Ciudad -> Bool
tramopasapor (DefinicionDelTramo c1 c2 d) c = c1==c || c2==c || False


viajePasaPor :: Viaje -> Ciudad -> Bool
viajePasaPor (Unico t) c = tramopasapor t c
viajePasaPor (ConEscala t vs) c = tramopasapor t c || viajePasaPor vs c || False

-- c
tramodist :: Tramo -> Distancia
tramodist (DefinicionDelTramo c1 c2 d) = d

tramoMasLargo :: Viaje -> Tramo
tramoMasLargo (Unico t) = t
tramoMasLargo (ConEscala t v)
                                        | tramodist t > tramodist (tramoMasLargo v) = t 
                                        | otherwise = tramoMasLargo v

--d
instance Eq Tramo 
    where
    DefinicionDelTramo c1 c2 d1 == DefinicionDelTramo cc1 cc2 dd1 = (c1==cc1||c1==cc2)&& (c2==cc1||c2==cc2)
ejemploViaje :: Viaje
ejemploViaje = ConEscala (DefinicionDelTramo "Venezuela" "Colombia" 50) (Unico(DefinicionDelTramo "Cancun" "Mexico" 5))