-- Examen viejo 2021 parte funcional
-- Vamos a reprecentar un tren de carga usando HAskell y para elllo se deben definir nuevos tipos
-- * primeramente se debe definir el tipo Item que tiene constructores Azucar, Cafe, Maiz, Trigo 
-- y Yerba, todos ellos sin parametros. El tipo Item NO DEBE pertenecer a la clase Eq
-- * Luego se debe definir el tipo Toneladas como sinonimo del tipo Int.
-- * El tipo Cargamento debe tener dos constructores : 
--     *constructor SinCarga : No tiene parametros y trptrsenta el cargamento vacio.
--     * constructor Carga : tiene dos parametros, el primero de tipo Item ( indica el tipo de carga
--     que tiene el cargamento) y el segundo parametro es de tipo Toneladas (el peso de ese cargamento).
--  *El tipo Numeracion que debe ser un sinonimo de Int
--  * El tipo Tren que tiene dos constructores :
--     * Constructor Vagon : Tiene tres parametros, el primero de tipo Numeracion (la numeracion del vagon)
--     el segundo tipo Cargamento (el cargamento que lleva ese vagon) y el tercero de tipo Tren (que lleva el resto del tren)
--     *constructor Fin no tiene parametros y representa el fin del tren

-- Asegurarse que los tipor Tren, Cargamento e Item esten en la clase Show
-- 
-- a) programar la funcion :
-- vagones_item :: Tren -> Item -> [Numeracion]
-- que dado un tren ts y un item i, devuelve las numeraciones de los vagones del tren ts que teansporta el item i
-- b) Dar una exprecion de tipo Tren que tenga al menos tres elementos donde se utilicen los dos constructores de tipo

-- funcion extra, transforma lista de triplas en tren

data Item = Azucar | Cafe | Maiz | Trigo | Yerba deriving Show
type Toneladas = Int
data Cargamento= SinCarga | Carga Item Toneladas deriving Show
type Numeracion = Int 
data Tren = Vagon Numeracion Cargamento Tren | Fin deriving Show

--a
igualitem :: Item -> Item -> Bool
igualitem Azucar Azucar = True
igualitem Cafe Cafe = True
igualitem Maiz Maiz = True
igualitem Trigo Trigo = True
igualitem Yerba Yerba = True
igualitem _ _ = False

vagones_item :: Tren -> Item -> [Numeracion]
vagones_item Fin it1 = []
vagones_item (Vagon num (SinCarga) ts) it1 = vagones_item ts it1
vagones_item (Vagon num (Carga it tons) ts) it1 
                                                | igualitem it it1 = num:vagones_item ts it1
                                                | otherwise= vagones_item ts it1

--b
ejemplotrens :: Tren
ejemplotrens = Vagon 69 (Carga Cafe 7) (Vagon 76 SinCarga (Vagon 30000  (Carga Yerba 4000) Fin))

-- ghci> vagones_item ejemplotrens Yerba
-- [30000]