data Categoria = Literatura | Infantiles | Autoayuda | Comics
data Editorial = Altea | Minotauro | Panini
type Titulo = String
type Precio = Int
data Marca = Monoblock | Papikra
type AñoAgenda = Int

data ArticulosLibreria = Libro Categoria Editorial Titulo Precio
                       | Agenda Marca AñoAgenda Precio
                       | Cuaderno Marca Precio

librosBaratos :: [ArticulosLibreria] -> Precio -> [ArticulosLibreria]
librosBaratos [] _ = []
librosBaratos (Libro c e t pr : ls) p | pr == p = Libro c e t pr : librosBaratos ls p
                                      | otherwise = librosBaratos ls p
librosBaratos (_ : ls) p = librosBaratos ls p

editorial :: Editorial -> Editorial -> Bool
editorial Altea Altea = True
editorial Minotauro Minotauro = True
editorial Panini Panini = True
editorial _ _ = False

int :: Precio -> Precio -> Bool
int x y | x == y = True
        | otherwise = False

instance Eq ArticulosLibreria where
    Libro _ e1 _ p1 == Libro _ e2 _ p2 = editorial e1 e2 && int p1 p2
    Agenda _ a1 p1 == Agenda _ a2 p2 = int a1 a2 && int p1 p2
    Cuaderno _ p1 == Cuaderno _ p2 = int p1 p2
    _ == _ = False

---------------------------------------------------------------------
data Nivel = Uno | Dos | Tres deriving Show
data NotaIngles = Evolucion String Nivel Int Int Int NotaIngles | NoHayEstudiantes

nivel :: Nivel -> Nivel -> Bool
nivel Uno Uno = True
nivel Dos Dos = True
nivel Tres Tres = True
nivel _ _ = False

pasaDeNivel :: NotaIngles -> String -> Bool
pasaDeNivel NoHayEstudiantes _ = False
pasaDeNivel (Evolucion n i p s f nota) nom | n == nom = ((nivel i Uno || nivel i Dos) && ((p >= 7 && s >= 8) || (p >= 8 && s >= 7)) && (f >= 7)) || (nivel i Tres && (div (p+s) 2 >= 8) && (f >= 8))
                                           | otherwise = pasaDeNivel nota nom

alumno :: NotaIngles
alumno = Evolucion "Juan" Tres 7 8 8 NoHayEstudiantes -- = False

devolverNivel :: NotaIngles -> String -> Maybe Nivel
devolverNivel NoHayEstudiantes _ = Nothing
devolverNivel (Evolucion n i _ _ _ nota) nom | n == nom = Just i
                                             | otherwise = devolverNivel nota nom