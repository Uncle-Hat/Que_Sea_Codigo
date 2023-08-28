
--1
--a)
esCero :: Int -> Bool      -- verifica si un entero es igual a 0.
esCero x = x == 0
{-
*Main> esCero 5
False
*Main> esCero 0
True
-}
--b) 
esPositivo :: Int -> Bool  -- verifica si un entero es estrictamente mayor a 0.
esPositivo x = x>0
{- *Main> esPositivo 5
True
*Main> esPositivo (-3)
False
*Main> esPositivo 2
True -}

--c) 
esVocal :: Char -> Bool   -- verifica si un caracter es una vocal en minúscula.
esVocal x   | x == 'a'|| x =='e'|| x =='i'|| x =='o'|| x =='u' = True --El or lógico recibe booleanos, por lo tanto tenemos que dárselos mediante casos
            | otherwise = False

{- 
*Main> esVocal 'a'
True
*Main> esVocal 'e'
True
*Main> esVocal 'b'
False -}
--d)
valorAbsoluto :: Int -> Int -- devuelve el valor absoluto de un entero ingresado
valorAbsoluto x | x<0 = (-1)*x
                | x>=0 = x
{-
*Main> valorAbsoluto (-5)
5
*Main> valorAbsoluto (-10)
10
*Main> valorAbsoluto 5
5 
-}
--2. Programa las siguientes funciones usando recursion o composicion:
--a)
paratodo :: [Bool] -> Bool -- verifica que todos los elementos de una lista sean True
paratodo [] = True
paratodo (x:xs) | x == True = paratodo xs
                | otherwise = False

{- 
*Main> paratodo [True,False]
False
*Main> paratodo [True,True]
True
-}
--b)
sumatoria :: [Int] -> Int -- calcula la suma de todos los elementos de una lista de enteros.
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs
{- 
*Main> sumatoria [5,4,3,2,1]
15
-}
--c)
productoria :: [Int] -> Int -- calcula el producto de todos los elementos de la lista de enteros.
productoria [] = 1 --Neutro del producto
productoria (x:xs) = x*productoria xs
{-
*Main> productoria [5,4,3,2,1]
120
-}
--d)
factorial :: Int -> Int -- toma un numero n y calcula n!.
factorial 0 = 1 --definición factorial (Álgebra)
factorial n = n*factorial (n-1)
{- 
*Main> factorial 10
3628800
-}
{-
e)
Utiliza la funcion sumatoria para definir promedio :: [Int] -> Int
toma una lista de numeros no vacia y calcula el valor promedio truncado,
usando division entera.
-}
--e)
promedio :: [Int] -> Int
promedio xs = div(sumatoria xs) (length xs) -- *Tuve problemas de tipos usando el operador '/' y por lo tanto decidí utilizar el div para realizar la división entera
{- 
*Main> promedio [5,7,8,9,10]
7
-}
--3. Programá la funcion pertenece :: Int -> [Int] -> Bool, que verifica si un número se encuentra en una lista.
pertenece :: Int -> [Int] -> Bool
pertenece c [] = False
pertenece c (x:xs)  | c == x = True
                    | c /= x = pertenece c xs
{-
 *Main> pertenece 5 [5,6,7,8,9]
True
*Main> pertenece 5 [6,7,8,9]
False
 -}
{- 4. Programa las siguientes funciones que implementan los cuantificadores generales. Nota que
el segundo parametro de cada funcion, es otra funcion! -}
{- a) paratodo’ :: [a] -> (a -> Bool) -> Bool, dada una lista xs de tipo [a] y un
predicado t :: a -> Bool, determina si todos los elementos de xs satisfacen el
predicado t. -}

paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] t = False
paratodo' (x:xs) t  | t x == True = True
                    | t x /= True = False
{- 
*Main> paratodo' [5,4,2,1,0] (<0)
False
*Main> paratodo' [5,4,2,1] (>0)
True
-}
{- b) existe’ :: [a] -> (a -> Bool) -> Bool, dada una lista xs de tipo [a] y un
predicado t :: a -> Bool, determina si algun elemento de xs satisface el predicado
t. -}
existe' :: [a] -> (a -> Bool) -> Bool
existe' [] p = False
existe' (x:xs) p    | p x == True = True 
                    | p x == False = existe' xs p
{- 
*Main> existe' [5,(-3),7] (<0)
True
*Main> existe' [5,(-3),7] (>0)
True
*Main> existe' [5,(-3),7] (==0)
False
-}
{- c) sumatoria’ :: [a] -> (a -> Int) -> Int, dada una lista xs de tipo [a] y una
funcion t :: a -> Int (toma elementos de tipo a y devuelve enteros), calcula la
suma de los valores que resultan de la aplicacion de t a los elementos de xs.-}

sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] p = 0
sumatoria' (x:xs) p = p x + sumatoria' xs p
{-
*Main> sumatoria' [4,5,6,7,8,9] (+10)
99 
-}

{- d) productoria’ :: [a] -> (a -> Int) -> Int, dada una lista de xs de tipo [a]
y una funcion t :: a -> Int, calcula el producto de los valores que resultan de la
aplicacion de t a los elementos de xs. -}
productoria' :: [a] -> (a -> Int) -> Int
productoria' [] p = 1
productoria' (x:xs) p = p x * productoria' xs p
{- 
*Main> productoria' [5,6,7,8] (+1)
3024
-}

{- 5. Defin ı nuevamente la funcion paratodo, pero esta vez usando la funcion paratodo’ (sin
recursion ni analisis por casos!).-}

paratodonorec :: [a] -> (a -> Bool) -> Bool
paratodonorec xs c = paratodo' xs c
{- 
*Main> paratodonorec [5,6,7,8,9] (<10)
True
-}
{-
6. Utilizando las funciones del ejercicio 4, programa las siguientes funciones por composicion,
sin usar recursion ni analisis por casos.
-}
{- a) todosPares :: [Int] -> Bool verifica que todos los numeros de una lista sean
pares. -}
todosPares :: [Int] -> Bool
todosPares xs = paratodo' xs even
{- 
*Main> paratodonorec [5,6,7,8,9] (<10)
True
-}

{- b) hayMultiplo :: Int -> [Int] -> Bool verifica si existe algun numero dentro del
segundo parametro que sea multiplo del primer parametro. -}
esMultiplo :: Int -> Int -> Bool
esMultiplo c x  = mod c x == 0
{- 
*Main> esMultiplo 5 10
False
*Main> esMultiplo 5 5
True
*Main> esMultiplo 5 1
True
-}
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo c xs = existe' xs (esMultiplo c)
{- 
*Main> hayMultiplo 5 [5,10,20]
True
*Main> hayMultiplo 5 [10,20]
False
-}


{-
c) sumaCuadrados :: Int -> Int, dado un numero no negativo n, calcula la suma de
los primeros n cuadrados, es decir Ayuda: En Haskell se puede escribir la lista que contiene el rango de numeros entre n
y m como [n..m].-}
sumaCuadrados :: Int -> Int 
sumaCuadrados n = sumatoria'[0..n] (^2)
{-
*Main> sumaCuadrados 100
338350
-}

{-
d) Programar la fucion existeDivisor::Int-> [Int] -> Bool, que dado en entero n
y una lista ls , devuelve True si y solo si, existe algun elemento en ls que divida a na.
-}
existeDivisor :: Int -> [Int] -> Bool
existeDivisor n ls = existe' ls (esMultiplo n)
{- 
*Main> existeDivisor 5 [10]
False
*Main> existeDivisor 5 [20]
False
*Main> existeDivisor 5 [1]
True
-}

{- e) Utilizando la funcion del apartado anterior, definı la funcion esPrimo:: Int -> Bool,
que dado un entero n, devuelve True si y solo si n es primo.
Ayuda: En Haskell se puede escribir la lista que contiene el rango de numeros entre n
y m como [n..m]. -}


esPrimo :: Int -> Bool
esPrimo n = not(existe' [2..n-1] (esMultiplo n)) || n == 2

{-*Main> esPrimo 1
True
*Main> esPrimo 123412
False
*Main> esPrimo 12
False-}

--f ) ¿Se te ocurre como redefinir factorial (ej. 2d) para evitar usar recursion?


{- g) Programar la funcion multiplicaPrimos :: [Int] -> Int que calcula el producto
de todos los numeros primos de una lista. -}
{- multiplicaPrimos :: [Int] -> Int
multiplicaPrimos xs = -}

{-
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
b) Programa nuevamente la funcion utilizandoexiste' ls (esDivisor n) takeWhile.
11. La funcion primIguales toma una lista y devuelve el mayor tramo inicial de 
la lista cuyos elementos son todos iguales entre sı. Por ejemplo:
a) Programa primIguales por recursion.
b) Usa cualquier version de primIgualesA para programar existe' ls (esDivisor n)primIguales. Esta permitido
dividir en casos, pero no usar recursion.
-}