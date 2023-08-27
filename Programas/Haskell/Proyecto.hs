
--1
--a)
esCero :: Int -> Bool      -- verifica si un entero es igual a 0.
esCero x = x == 0
--b) 
esPositivo :: Int -> Bool  -- verifica si un entero es estrictamente mayor a 0.
esPositivo x = x>0
--c) 
esVocal :: Char -> Bool   -- verifica si un caracter es una vocal en minúscula.
esVocal x   | x == 'a'|| x =='e'|| x =='i'|| x =='o'|| x =='u' = True --El or lógico recibe booleanos, por lo tanto tenemos que dárselos mediante casos
            | otherwise = False
--d)
valorAbsoluto :: Int -> Int -- devuelve el valor absoluto de un entero ingresado
valorAbsoluto x | x<0 = (-1)*x
                | x>=0 = x
--2. Programa las siguientes funciones usando recursion o composicion:
--a)
paratodo :: [Bool] -> Bool -- verifica que todos los elementos de una lista sean True
paratodo [] = True
paratodo (x:xs) | x == True = paratodo xs
                | otherwise = False
--b)
sumatoria :: [Int] -> Int -- calcula la suma de todos los elementos de una lista de enteros.
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--c)
productoria :: [Int] -> Int -- calcula el producto de todos los elementos de la lista de enteros.
productoria [] = 1 --Neutro del producto
productoria (x:xs) = x*productoria xs
--d)
factorial :: Int -> Int -- toma un numero n y calcula n!.
factorial 0 = 1 --definición factorial (Álgebra)
factorial n = n*factorial (n-1)
{-
e)
Utiliza la funcion sumatoria para definir promedio :: [Int] -> Int
toma una lista de numeros no vacia y calcula el valor promedio truncado,
usando division entera.
-}
--e)
promedio :: [Int] -> Int
promedio xs = div(sumatoria xs) (length xs) -- *Tuve problemas de tipos usando el operador '/' y por lo tanto decidí utilizar el div para realizar la división entera

--3. Programá la funcion pertenece :: Int -> [Int] -> Bool, que verifica si un número se encuentra en una lista.
pertenece :: Int -> [Int] -> Bool
pertenece c [] = False
pertenece c (x:xs)  | c == x = True
                    | c /= x = pertenece c xs

{- 4. Programa las siguientes funciones que implementan los cuantificadores generales. Nota que
el segundo parametro de cada funcion, es otra funcion! -}
{- a) paratodo’ :: [a] -> (a -> Bool) -> Bool, dada una lista xs de tipo [a] y un
predicado t :: a -> Bool, determina si todos los elementos de xs satisfacen el
predicado t. -}

paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] t = False
paratodo' (x:xs) t  | t x == True = True
                    | t x /= True = False

{- b) existe’ :: [a] -> (a -> Bool) -> Bool, dada una lista xs de tipo [a] y un
predicado t :: a -> Bool, determina si algun elemento de xs satisface el predicado
t. -}
existe' :: [a] -> (a -> Bool) -> Bool
existe' [] p = False
existe' (x:xs) p    | p x == True = True 
                    | p x == False = existe' xs p

{- c) sumatoria’ :: [a] -> (a -> Int) -> Int, dada una lista xs de tipo [a] y una
funcion t :: a -> Int (toma elementos de tipo a y devuelve enteros), calcula la
suma de los valores que resultan de la aplicacion de t a los elementos de xs.-}

sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] p = 0
sumatoria' (x:xs) p = p x + sumatoria' xs p


{- d) productoria’ :: [a] -> (a -> Int) -> Int, dada una lista de xs de tipo [a]
y una funcion t :: a -> Int, calcula el producto de los valores que resultan de la
aplicacion de t a los elementos de xs. -}
productoria' :: [a] -> (a -> Int) -> Int
productoria' [] p = 1
productoria' (x:xs) p = p x * productoria' xs p

{- 5. Defin ı nuevamente la funcion paratodo, pero esta vez usando la funcion paratodo’ (sin
recursion ni analisis por casos!).-}

paratodonorec :: [a] -> (a -> Bool) -> Bool
paratodonorec xs c = paratodo' xs c

{-
6. Utilizando las funciones del ejercicio 4, programa las siguientes funciones por composicion,
sin usar recursion ni analisis por casos.
-}
{- a) todosPares :: [Int] -> Bool verifica que todos los numeros de una lista sean
pares. -}
todosPares :: [Int] -> Bool
todosPares xs = paratodo' xs even


{- b) hayMultiplo :: Int -> [Int] -> Bool verifica si existe algun numero dentro del
segundo parametro que sea multiplo del primer parametro. -}
esMultiplo :: Int -> [Int] -> Bool
esMultiplo c [] = False
esMultiplo c (x:xs) | mod c x == 0 = True
                    | mod c x /= 0 = esMultiplo c xs
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo c xs = esMultiplo c xs

{-
c) sumaCuadrados :: Int -> Int, dado un numero no negativo n, calcula la suma de
los primeros n cuadrados, es decir Ayuda: En Haskell se puede escribir la lista que contiene el rango de numeros entre n
y m como [n..m].-}
sumaCuadrados :: Int -> Int sumaCuadrados n = sumatoria'[0..] (^2)

{-
d) Programar la fucion existeDivisor::Int-> [Int] -> Bool, que dado en entero n
y una lista ls , devuelve True si y solo si, existe algun elemento en ls que divida a na.
-}
esDivisor 
existeDivisor :: Int -> [Int] -> Bool
existeDivisor n ls = existe 

{- e) Utilizando la funcion del apartado anterior, definı la funcion esPrimo:: Int -> Bool,
que dado un entero n, devuelve True si y solo si n es primo.
Ayuda: En Haskell se puede escribir la lista que contiene el rango de numeros entre n
y m como [n..m]. -}

{-
f ) ¿Se te ocurre como redefinir factorial (ej. 2d) para evitar usar recursion?
g) Programar la funcion multiplicaPrimos :: [Int] -> Int que calcula el producto
de todos los numeros primos de una lista.
h) Programar la funcion esFib :: Int -> Bool, que dado un entero n, devuelve True
si y solo si n esta en la sucesion de Fibonacci.
Ayuda: Realizar una funcion auxiliar fib :: Int -> Int que dado un n devuelva el
n-esimo elemento de la sucesion.
i) Utilizando la funcion del apartado anterior, definı la funcion todosFib :: [Int] -> Bool
que dada una lista xs de enteros, devuelva si todos los elementos de la lista pertenecen
(o no) a la sucesion de Fibonacci.
7. Indaga en Hoogle sobre las funciones map y filter. Tambien podes consultar su tipo en
ghci con el comando :t.
8. Programa una funcion que dada una lista de numeros xs, devuelve la lista que resulta de
duplicar cada valor de xs.
a) Definila usando recursion.
b) Definila utilizando la funcion map.

9. Programa una funcion que dada una lista de numeros xs, calcula una lista que tiene como
elementos aquellos numeros de xs que son primos.
a) Definila usando recursion.
b) Definila utilizando la funcion filter.
c) Revisa tu definicion del ejercicio 6g. ¿Como podes mejorarla?
10. La funcion primIgualesA toma un valor y una lista, y calcula el tramo inicial mas largo de
la lista cuyos elementos son iguales a ese valor. Por ejemplo:
a) Programa primIgualesA por recursion.
b) Programa nuevamente la funcion utilizando takeWhile.
11. La funcion primIguales toma una lista y devuelve el mayor tramo inicial de 
la lista cuyos elementos son todos iguales entre sı. Por ejemplo:
a) Programa primIguales por recursion.
b) Usa cualquier version de primIgualesA para programar primIguales. Esta permitido
dividir en casos, pero no usar recursion.
-}
