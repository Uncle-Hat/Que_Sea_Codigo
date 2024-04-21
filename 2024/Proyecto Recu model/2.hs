data TipoLadrillo = Ceramico | Hormigon | Tradicional
data UsoDeLadrillo = Pared | Techo

type Largo = Float
data MaterialViga = Hierro | Madera

data MarcaCemento = Minetti | LomaNegra

type Precio = Int

data MaterialesConstruccion = Ladrillo TipoLadrillo UsoDeLadrillo Precio
                            | Vigueta Largo MaterialViga Precio
                            | Cemento MarcaCemento Precio

ladrillosDeMenorPrecio :: [MaterialesConstruccion] -> Int -> [MaterialesConstruccion]
ladrillosDeMenorPrecio [] _ = []
ladrillosDeMenorPrecio ((Ladrillo o p q : lm)) n | n >= q = Ladrillo o p q : ladrillosDeMenorPrecio lm n
                                                 | otherwise = ladrillosDeMenorPrecio lm n
ladrillosDeMenorPrecio ((_ : lm)) n = ladrillosDeMenorPrecio lm n

mismoLadrillo :: TipoLadrillo -> TipoLadrillo -> Bool
mismoLadrillo Ceramico Ceramico = True
mismoLadrillo Hormigon Hormigon = True
mismoLadrillo Tradicional Tradicional = True
mismoLadrillo _ _ = False

mismoLargo :: Largo -> Largo -> Bool
mismoLargo x y | x == y = True
               | otherwise = False

mismoMaterial :: MaterialViga -> MaterialViga -> Bool
mismoMaterial Hierro Hierro = True
mismoMaterial Madera Madera = True
mismoMaterial _ _ = False

mismoCemento :: MarcaCemento -> MarcaCemento -> Bool
mismoCemento Minetti Minetti = True
mismoCemento LomaNegra LomaNegra = True
mismoCemento _ _ = False


instance Eq MaterialesConstruccion where
    Ladrillo t1 _ _ == Ladrillo t2 _ _ = mismoLadrillo t1 t2
    Vigueta l1 m1 _ == Vigueta l2 m2 _ = mismoLargo l1 l2 && mismoMaterial m1 m2
    Cemento n1 _ == Cemento n2 _ = mismoCemento n1 n2
    _ == _ = False

--------------------------------------------------------------------------------
data Estado = Seco | EnFlor | Verde | ConFrutos

data ArbolesNativos = EvolucionDelArbol String Estado Int Int Int ArbolesNativos | NoHayMasArboles

eFrutos :: Estado -> Bool
eFrutos ConFrutos = True
eFrutos _ = False

eFlor :: Estado -> Bool
eFlor EnFlor = True
eFlor _ = False

eVerde :: Estado -> Bool
eVerde Verde = True
eVerde _ = False

paraVender :: ArbolesNativos -> String -> Bool
paraVender NoHayMasArboles _ = False
paraVender (EvolucionDelArbol n e a d ap arb ) s | n == s = eFrutos e || (eFlor e && (a > 7 || d > 7) && ap >= 8) || (eVerde e && a >= 9 && d >= 9 && ap >= 9)
                                                 | otherwise = paraVender arb s

devolverAltura :: ArbolesNativos -> String -> Maybe Int
devolverAltura NoHayMasArboles _ = Nothing
devolverAltura (EvolucionDelArbol n _ a _ _ arb) s | n == s = Just a
                                                   | otherwise = devolverAltura arb s

arbol :: ArbolesNativos
arbol = EvolucionDelArbol "Manzano" ConFrutos 7 8 9 (EvolucionDelArbol "Peral" Verde 10 9 7 (EvolucionDelArbol "Naranjo" EnFlor 8 9 2 (EvolucionDelArbol "Algarrobo" ConFrutos 10 10 10 NoHayMasArboles)))