data MarcaMicro = Intel | AMD
data Nucleos = DualCore | QuadCore | HexaCore | OctaCore
type MaxFrec = Float

data MarcaRam = Kingston | MarkVision | Patriot
type Gigas = Int

data MarcaPMadre = Asus | Asrock | MSI
data Chipset = A630 | B650 | B660 | B760

data ComponentePC = Micro MarcaMicro Nucleos MaxFrec
                  | Ram MarcaRam Gigas
                  | PlacaMadre MarcaPMadre Chipset

cuantosMicros :: [ComponentePC] -> MarcaMicro -> Int
cuantosMicros [] _ = 0
cuantosMicros ((Micro Intel _ _): xs) Intel = 1 + cuantosMicros xs Intel
cuantosMicros ((Micro AMD _ _): xs) AMD = 1 + cuantosMicros xs AMD
cuantosMicros (_ : xs) m = cuantosMicros xs m

mismosCores :: Nucleos -> Nucleos -> Bool
mismosCores DualCore DualCore = True
mismosCores QuadCore QuadCore = True
mismosCores HexaCore HexaCore = True
mismosCores OctaCore OctaCore = True
mismosCores _ _ = False

mismoChipset :: Chipset -> Chipset -> Bool
mismoChipset A630 A630 = True
mismoChipset B650 B650 = True
mismoChipset B660 B660 = True
mismoChipset B760 B760 = True
mismoChipset _ _ = False

instance Eq ComponentePC where
    Micro _ n1 _ == Micro _ n2 _ = mismosCores n1 n2
    Ram _ g1 == Ram _ g2 = g1 == g2
    PlacaMadre _ c1 == PlacaMadre _ c2 = mismoChipset c1 c2
    _ == _ = False

------------------------------------------------------------
type Titulo = String
type Rank = Int
data Estado = Reproducido | SinReproducir
type Duracion = Int

data PlayList = Tema Titulo Rank Estado Duracion PlayList | SinTemas

segundosRestantes :: PlayList -> Rank -> Duracion
segundosRestantes SinTemas r = 0
segundosRestantes (Tema _ _ Reproducido _ ps) r = segundosRestantes ps r
segundosRestantes (Tema _ rank SinReproducir d ps) r | rank >= r = d + segundosRestantes ps r
                                                     | otherwise = segundosRestantes ps r

estadoDelTema :: Titulo -> PlayList -> Maybe Estado
estadoDelTema _ SinTemas = Nothing
estadoDelTema t (Tema ti _ e _ ps) | t == ti = Just e
                                   | otherwise = estadoDelTema t ps
