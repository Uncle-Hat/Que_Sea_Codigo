{-1. Objetivo-}

{-En este proyecto definiremos nuestros propios tipos de datos. La importancia de poder definir
nuevos tipos de datos reside en la facilidad con la que podemos modelar problemas y resolverlos
usando las mismas herramientas que para los tipos pre-existentes.
El objetivo de este proyecto es aprender a declarar nuevos tipos de datos en Haskell y definir
funciones para manipular expresiones que utilizan estos tipos. -}



{- -- 2. Ejercicios ---------------------------------------- -}



{- -- 1. Tipos enumerados. ---------- -}


-- a) Implementa el tipo Carrera como esta definido arriba.

data Carrera = Matematica | Fisica | Computacion | Astronomia

{- b) Definı la siguiente funcion, usando pattern matching: titulo :: Carrera -> String
que devuelve el nombre completo de la carrera en forma de string. Por ejemplo, para el
constructor Matematica, debe devolver ”Licenciatura en Matematica”. -}

titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Computacion"
titulo Astronomia = "Licenciatura en Astronomia"

-- *Main> titulo Matematica 
-- "Licenciatura en Matematica"
-- *Main> titulo Fisica 
-- "Licenciatura en Fisica"

-- c) Definir el tipo NotaBasica con constructores Do, Re, Mi, Fa, Sol, La y Si

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving(Eq,Ord,Show)

{- d) El sistema de notacion musical anglosajon, tambien conocido como notacion o cifrado
americano, relaciona las notas basicas con letras de la A a la G. Este sistema se usa por
ejemplo para las tablaturas de guitarra. Programar usando pattern matching la funcion:
cifradoAmericano : : NotaBasica −> Char
que relaciona las notas Do, Re, Mi, Fa, Sol, La y Si con los caracteres ’C’ , ’D’, ’E’,
’F’, ’G’, ’A’ y ’B’ respectivamente. -}

cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'


-- *Main> cifradoAmericano Do
-- 'C'
-- *Main> cifradoAmericano Re
-- 'D'
-- *Main> cifradoAmericano Fa
-- 'F'


{- -- 2. Clases de tipos.-}

{- a) Completar la definicion del tipo NotaBasica para que las expresiones
*Main> Do <= Re
*Main> Fa `min` Sol
sean validas y no generen error. Ayuda: usar deriving con multiples clases. -}

-- *Main> Fa `min` Sol
-- Fa
-- *Main> Do <= Re
-- True


{- --3-Polimorfismo ad hoc-------------- -}


{- a) Definir usando polimorfismo ad hoc la funcion minimoElemento que calcula (de manera
recursiva) cual es el menor valor de una lista de tipo [a]. Asegurarse que solo este
definida para listas no vacıas. -}

minimoElemento :: Ord a => [a] -> a 
minimoElemento [x] = x
minimoElemento (x:xs) = x `min` (minimoElemento xs)

-- *Main> minimoElemento [5,4,3,2,1]
-- 1
-- *Main> minimoElemento [5,10,2,100,1,4]
-- 1

{- b) Definir la funcion minimoElemento’ de manera tal que el caso base de la recursion
sea el de la lista vacıa. Para ello revisar la clase Bounded.
Ayuda: Para probar esta funcion dentro de ghci con listas vacıas, indicar el tipo concreto con tipos de la clase Bounded, por ejemplo: ([1,5,10]::[Int]), ([]::[Bool]),
etc.-}

minimoElemento' :: (Bounded a, Ord a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' (x:xs) = min x (minimoElemento' xs) 

-- *Main> minimoElemento' ([1, 5, 10] :: [Int])
-- 1
-- *Main> minimoElemento' ([]::[Bool])
-- True

{-c) Usar la funcion minimoElemento para determinar la nota mas grave de la melodıa:
[Fa, La, Sol, Re, Fa] -}
{- En las definiciones de los ejercicios siguientes, deben agregar deriving solo cuando sea
estrictamente necesario -}
-- *Main> minimoElemento [Fa,La,Sol,Re,Fa]
-- Re


{-4. Sinonimo de tipos; constructores con parametros.-}


{- a) Implementa el tipo Deportista y todos sus tipos accesorios (NumCamiseta, Altura, Zona, etc) tal como estan definidos arriba. -}

-- Sinonimo de Tipo
type Altura = Int
type NumCamiseta = Int

-- Tipos algebraicos sin parametros
data Zona = Arco | Defensa | Mediocampo | Delantera 
data TipoReves = DosManos | UnaMano
data Modalidad = Carretera | Pista | Monte | BMX
data PiernaHabil = Izquierda | Derecha

-- Sinónimo
type ManoHabil = PiernaHabil

-- Deportista es un tipo algebraico con constructores parametricos
data Deportista = Ajedrecista | Ciclista Modalidad | Velocista Altura | Tenista TipoReves ManoHabil Altura | Futbolista Zona NumCamiseta PiernaHabil Altura


{- b) ¿Cual es el tipo del constructor Ciclista? -}
-- Ciclista es del tipo Deportista

{- c) Programa la funcion contar_velocistas :: [Deportista] -> Int que dada una
lista de deportistas xs, devuelve la cantidad de velocistas que hay dentro de xs.
Programa contar_velocistas sin usar igualdad, utilizando pattern matching. -}

contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas (Velocista n:xs) = 1 + contar_velocistas xs
contar_velocistas (n:xs) = 0 + contar_velocistas xs

-- *Main> contar_velocistas [Velocista 5]
-- 1
-- *Main> contar_velocistas [Velocista 1]
-- 1
-- *Main> contar_velocistas [Velocista 4, Velocista 8, Ciclista Carretera]
-- 2

{- d) Programa la funcion contar_futbolistas :: [Deportista] -> Zona -> Int que
dada una lista de deportistas xs, y una zona z, devuelve la cantidad de futbolistas
incluidos en xs que juegan en la zona z. Programa contar_futbolistas sin usar
igualdad, utilizando pattern matching. -}

contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] z = 0
contar_futbolistas (x:xs) z | esfutz z x = 1 + contar_futbolistas xs z
                            |otherwise = contar_futbolistas xs z

esfutz :: Zona -> Deportista -> Bool
esfutz Arco (Futbolista Arco _ _ _) = True
esfutz Defensa (Futbolista Defensa _ _ _) = True
esfutz Mediocampo (Futbolista Mediocampo _ _ _) = True
esfutz Delantera (Futbolista Delantera _ _ _) = True
esfutz _ _ = False

-- *Main> contar_futbolistas [Futbolista Arco 7 Derecha 5, Futbolista Mediocampo 8 Izquierda 10] Arco
-- 1
-- *Main> contar_futbolistas [Futbolista Arco 7 Derecha 5, Futbolista Mediocampo 8 Izquierda 10] Mediocampo
-- 1
-- *Main> contar_futbolistas [Futbolista Arco 7 Derecha 5, Futbolista Mediocampo 8 Izquierda 10] Defensa
-- 0

{- e) ¿La funcion anterior usa filter? Si no es ası, reprogramala para usarla.-}

contar_futbolistasF :: [Deportista] -> Zona -> Int
contar_futbolistasF xs checkzone = length (filter (esfutz checkzone) xs )

-- *Main> contar_futbolistasF [Futbolista Arco 7 Derecha 5, Futbolista Mediocampo 8 Izquierda 10] Arco
-- 1 


{- 5. Definicion de clases. -}


{- a) Implementa la funcion sonidoNatural como esta definida arriba. -}

sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

{- b) Definir el tipo enumerado Alteracion que consta de los constructores Bemol, Natural y Sostenido. -}

data Alteracion = Bemol | Natural | Sostenido 

{- c) Definir el tipo NotaMusical que consta de un unico constructor llamado Nota que
toma dos parametros. El primer parametro es de tipo NotaBasica y el segundo de tipo
Alteracion. De esta manera cuando se quiera representar una nota alterada se puede
usar como segundo parametro del constructor un Bemol o Sostenido y si se quiere
representar una nota sin alteraciones se usa Natural como segundo parametro -}

data NotaMusical = Nota NotaBasica Alteracion

{- d) Definı la funcion sonidoCromatico :: NotaMusical -> Int que devuelve el sonido
de una nota, incrementando en uno su valor si tiene la alteracion Sostenido, decrementando en uno si tiene la alteracion Bemol y dejando su valor intacto si la alteracion
es Natural -}

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota nb Sostenido)  = (sonidoNatural nb) + 1
sonidoCromatico (Nota nb Natural)  = (sonidoNatural nb)
sonidoCromatico (Nota nb Bemol)  = (sonidoNatural nb) - 1

-- *Main> sonidoCromatico (Nota Re Sostenido)
-- 3
-- *Main> sonidoCromatico (Nota Sol Bemol)
-- 6

{- e) Incluı el tipo NotaMusical a la clase Eq de manera tal que dos notas que tengan el
mismo valor de sonidoCromatico se consideren iguales-}

instance Eq NotaMusical 
    where 
        a == b = sonidoCromatico a == sonidoCromatico b

-- *Main> sonidoCromatico (Nota Mi Bemol)
-- 3
-- *Main> sonidoCromatico (Nota Re Sostenido)
-- 3
-- *Main> (Nota Re Sostenido) == (Nota Mi Bemol)
-- True

{- f ) Incluı el tipo NotaMusical a la clase Ord definiendo el operador <=. Se debe definir
que una nota es menor o igual a otra si y solo si el valor de sonidoCromatico para la
primera es menor o igual al valor de sonidoCromatico para la segunda. -}

instance Ord NotaMusical
    where
        a<=b = sonidoCromatico a <= sonidoCromatico b

-- *Main> sonidoCromatico (Nota Sol Natural)
-- 7
-- *Main> sonidoCromatico (Nota Re Natural)
-- 2
-- *Main> (Nota Sol Natural) <= (Nota Re Natural)
-- False

{-
6. Tipos enumerados con polimorfismo.
a) Definir la funcion primerElemento que devuelve el primer elemento de una lista no
vacıa, o Nothing si la lista es vacıa.
primerElemento : : [ a ] −> Maybe a
7. Tipos recursivos.
a) Programa las siguientes funciones:
1) atender :: Cola -> Maybe Cola, que elimina de la cola a la persona que esta
en la primer posicion de una cola, por haber sido atendida. Si la cola esta vacıa,
devuelve Nothing.
2) encolar :: Deportista -> Cola -> Cola, que agrega una persona a una cola
de deportistas, en la ultima posicion.
3) busca :: Cola -> Zona -> Maybe Deportista, que devuelve el/la primera
futbolista dentro de la cola que juega en la zona que se corresponde con el segundo
parametro. Si no hay futbolistas jugando en esa zona devuelve Nothing.
b) ¿A que otro tipo se parece Cola?
8. Tipos recursivos y polimorficos
a) ¿Como se debe instanciar el tipo ListaAsoc para representar la informacion almacenada
en una guıa telefonica?
b) Programa las siguientes funciones:
1) la_long :: ListaAsoc a b -> Int que devuelve la cantidad de datos en una
lista.
2) la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b, que devuelve la concatenacion de dos listas de asociaciones.
3) la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b, que
agrega un nodo a la lista de asociaciones si la clave no esta en la lista, o actualiza
el valor si la clave ya se encontraba.
4) la_pares :: ListaAsoc a b -> [(a, b)] que transforma una lista de asociaciones en una lista de pares clave-dato.
5) la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b que dada una lista
y una clave devuelve el dato asociado, si es que existe. En caso contrario devuelve
Nothing.
6) la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b que dada
una clave a elimina la entrada en la lista.
9. (Punto *)
10. (Punto *)
-}