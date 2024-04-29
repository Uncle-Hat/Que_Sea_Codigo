-- Ejercicio 1

-- a)
-- 2

-- b) 
-- 1,2

-- c)
-- 2

-- d)
-- 4

-- Ejercicio 2
--a
type AnioAgenda= Int
type Precio = Int
type Titulo = String 
data Marca = Monoblock | Papikra
data Categoria = Literatura | Infantiles | Autoayuda | Comics deriving Eq
data Editorial = Altea | Minotauro | Panini 
data ArticulosLibreria = Libro Categoria Editorial Titulo Precio 
                        | Agenda Marca AnioAgenda Precio 
                        | Cuaderno Marca Precio 

--Tipo de dato con constructores

--b
cuantosLibros :: [ArticulosLibreria] -> Categoria -> Int
cuantosLibros [] _ = 0
cuantosLibros (Agenda{}:xs) c = cuantosLibros xs c
cuantosLibros (Cuaderno{}:xs) c = cuantosLibros xs c
cuantosLibros (Libro cat _ _ _:xs) c
                                |cat == c = 1 + cuantosLibros xs c
                                |otherwise = cuantosLibros xs c

ejemplo :: [ArticulosLibreria]
ejemplo = [Libro Literatura Altea "El quijote" 13,Agenda Papikra 14 1452, Cuaderno Monoblock 13]  

-- ghci> cuantosLibros ejemplo Infantiles
-- 0
-- ghci> cuantosLibros ejemplo Literatura
-- 1
-- ghci> cuantosLibros ejemplolist Literatura
-- 1
-- ghci> cuantosLibros ejemplolist Infantiles 
-- 2

--c
auxEd :: ArticulosLibreria -> Maybe Editorial
auxEd (Libro _ ed _ _) = Just ed
auxEd _ = Nothing

auxTit :: ArticulosLibreria -> Maybe Titulo
auxTit (Libro _ _ tit _) = Just tit
auxTit _ = Nothing
-- Libro son iguales sólo si tienen la misma Editorial y el mismo Título
-- dos Agendas son iguales solo si tienen la misma marca el mismo año y el mismo precio,
-- dos cuadernos son iguales si tiene la misma marca y el mismo precio

igprops :: ArticulosLibreria -> ArticulosLibreria -> Bool
igprops (Libro _ Altea _ prec) (Libro _ Altea _ prec1) = prec==prec1
igprops (Libro _ Minotauro _ prec) (Libro _ Minotauro _ prec1) = prec==prec1
igprops (Libro _ Panini _ prec) (Libro _ Altea _ prec1) = prec==prec1
igprops (Agenda Monoblock _ prec) (Agenda Monoblock _ prec1) = prec==prec1
igprops (Agenda Papikra _ prec) (Agenda Papikra _ prec1) = prec==prec1
igprops (Cuaderno Monoblock prec) (Cuaderno Monoblock prec1) = prec == prec1
igprops (Cuaderno Papikra prec) (Cuaderno Papikra prec1) = prec == prec1
igprops _ _ = False

ejemplo1 :: ArticulosLibreria
ejemplo1 = Libro Literatura Altea "Mi Auto" 16

ejemplo2 :: ArticulosLibreria
ejemplo2 = Libro Literatura Altea "Mi Auto" 16
ejemplolist :: [ArticulosLibreria]
ejemplolist = [Libro Literatura Altea "Mi Auto" 16,Libro Infantiles Altea "Iron Maidem" 16,Libro Infantiles Altea "Los tres chanchitos" 3]

-- ghci> igprops ejemplo1 ejemplo2
-- False
-- ghci> igprops ejemplo1 ejemplo1
-- True

--Ejercicio 3

-- a
data Nivel = One | Two | Three deriving (Eq, Show)
data NotasDeIngles = EvolucionDelEstudiante String Nivel Int Int Int NotasDeIngles 
                    | NoHayMasEstudiantes 

-- b
pasaDeNivel :: NotasDeIngles -> String -> Bool
pasaDeNivel NoHayMasEstudiantes _ = False
pasaDeNivel (EvolucionDelEstudiante nam lvl prim seg fnl ee) name 
                                                    | (nam == name) && (lvl == One || lvl == Two) = (prim >= 7 || seg >= 7) && fnl >= 6
                                                    | (nam == name) && lvl == Three = ( prim >= 7 || seg >= 7) && fnl >= 8 
                                                    | otherwise = pasaDeNivel ee name
-- ghci> pasaDeNivel ejemploEstudiantes "Julian"
-- True

ejemploEstudiante :: NotasDeIngles
ejemploEstudiante = EvolucionDelEstudiante "Juan" One 10 10 10 NoHayMasEstudiantes
ejemploEstudiantes :: NotasDeIngles
ejemploEstudiantes = EvolucionDelEstudiante "Ricardo" Two 7 7 10 (EvolucionDelEstudiante "Mirian" One 5 6 4 (EvolucionDelEstudiante "Julian" Three 8 7 9 NoHayMasEstudiantes))

-- c

devolverNivel :: NotasDeIngles -> String -> Maybe Nivel
devolverNivel NoHayMasEstudiantes n = Nothing
devolverNivel (EvolucionDelEstudiante nam lvl _ _ _ ee) n 
                                                            | n == nam = Just lvl
                                                            | otherwise = devolverNivel ee n
-- ghci> devolverNivel ejemploEstudiantes "Ricardo"
-- Just Two
