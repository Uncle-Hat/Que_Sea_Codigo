{-# LANGUAGE NPlusKPatterns #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}


{- 
Explicación, el (h) son anotaciones hechas para acordarme la lógica detrás de algunos programas
-}
-- Ejercicio 1
--a)
esCero :: Int -> Bool
esCero x = x == 0
-- ghci> esCero 5
-- False

--b)
esPositivo :: Int -> Bool
esPositivo x = x>=0
-- ghci> esPositivo 1
-- True
-- ghci> esPositivo (-4)
-- False
-- ghci> esPositivo 0
-- True

--c)
esVocal :: Char -> Bool
esVocal x = x=='a'||x=='e'||x=='i'||x=='o'||x=='u'
-- ghci> esVocal 'a'
-- True
-- ghci> esVocal 'c'
-- False
-- ghci> esVocal 'i'
-- True

--d)
valorAbsoluto :: Int -> Int
valorAbsoluto x
                | esPositivo x = x
                | otherwise = -x
-- ghci> valorAbsoluto (-5)
-- 5
-- ghci> valorAbsoluto 0
-- 0
-- ghci> valorAbsoluto 3
-- 3

-- Ejercicio 2
--a)
{- todos.xs := <paratodo i : 0=< i < #xs : xs.i>
CB
xs = []
todos.[] = <paratodo i : 0=< i < #[] : [].i >
-- Definición de #
todos.[] = <Paratodo i : 0<=i<0 : [].i>
-- Rango vacío (0<=i<0 = False)
todos.[] = True

HI = todos.xs = <paratodo i : 0=< i < #xs : xs.i>

CI
xs = x:xs
todos.(x:xs) = <paratodo i : 0 =< i < #(x:xs) : (x:xs).i >
--Lógica
todos.(x:xs) = <paratodo i : (0 = i) ^ (1=< i < #(x:xs)) : (x:xs).i >
--Partición de Rango, definición de #
todos.(x:xs) = <paratodo i : 0=i : (x:xs).i> ^ <paratodo i : 1=<i<#xs+1 : (x:xs).i>
--Rango Unitario
todos.(x:xs) = (x:xs).0 ^ <paratodo i : 1=<i<#xs+1 : (x:xs).i>
-- Cambio de variable i = i+1
todos.(x:xs) = (x:xs).0 ^ <paratodo i : 1=<i+1<#xs+1 : (x:xs).i+1>
-- Álgebra, axiomas del orden
todos.(x:xs) = (x:xs).0 ^ <paratodo i : 0=<i<#xs : xs.i>
-- HI
todos.(x:xs) = x ^ todos.xs
 -}

paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs)
            | x  = paratodo xs
            | otherwise = False
-- ghci> paratodo [True,True,False,False]
-- False
-- ghci> paratodo [False,True]
-- False
-- ghci> paratodo [True,True]
-- True

--b)
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs
-- ghci> sumatoria [4,5,6,7,8]
-- 30
-- ghci> sumatoria [1,2,3,4,5,6,7,8,9]
-- 45
--c)
productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x*productoria xs
-- ghci> productoria [5,4,3,2,1]
-- 120
-- ghci> productoria [1,2,3]
-- 6

--d)
factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial (x-1)
-- ghci> factorial 5
-- 120
-- ghci> factorial 10
-- 3628800

--e)
promedio :: [Int] -> Int
promedio [] = 0
promedio xs = sumatoria xs `div` length xs
-- ghci> promedio [7]
-- 7
-- ghci> promedio [1,2]
-- 1
-- ghci> promedio [1,2,0]
-- 1

-- Ejercicio 3
pertenece :: Int -> [Int] -> Bool
pertenece _ [] = False
pertenece n (x:xs)
                  | n == x = True
                  | otherwise = pertenece n xs
-- ghci> pertenece 5 [4,3,2,1]
-- False
-- ghci> pertenece 5 [4,3,5,1]
-- True
-- ghi> pertenece 0 [1,3,5,1]
-- False
-- ghci> pertenece 0 [0,3,5,1]
-- True

-- Ejercicio 4

--a)
paratododerivando :: (a->Bool) -> [a] -> Bool
paratododerivando _ [] = True
paratododerivando f (x:xs) = f x && paratododerivando f xs
-- ghci> paratododerivando esPositivo [1,(-2),3,4,(-3)]
-- False
-- ghci> paratododerivando esPositivo [1,3,4,5]
-- True

paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] _ = True
paratodo' (x:xs) f = f x && paratodo' xs f
-- ghci> paratodo' [1,(-2),3,4,(-3)] esPositivo
-- False
-- ghci> paratodo' [1,3,4] esPositivo
-- True


--b)
existederivando ::  (a -> Bool) -> [a] -> Bool
existederivando _ []  = False
existederivando f (x:xs) = f x || existederivando f xs
-- ghci> existederivando esVocal "SeñorKioskero"
-- True
-- ghci> existederivando esVocal "fldsmdf"
-- False

existe' :: [a] -> (a->Bool) -> Bool
existe' [] _ = False
existe' (x:xs) f = f x || existe' xs f
-- ghci> existe' "fldsmdf" esVocal
-- False
-- ghci> existe' "Samguchedemilanga" esVocal
-- True

--c)
sumatoriaderivando :: (a -> Int) -> [a] -> Int
sumatoriaderivando _ [] = 0
sumatoriaderivando f (x:xs) = f x + sumatoriaderivando f xs
-- ghci> sumatoriaderivando valorAbsoluto [(-1),(-2),3,4,5,(-1234)]
-- 1249
-- ghci> sumatoriaderivando valorAbsoluto [(-1),(-2),3,4,5,(-5)]
-- 20


--d)
productoriaderivando :: (a->Int) -> [a] -> Int
productoriaderivando _ [] = 1
productoriaderivando f (x:xs) = f x * productoriaderivando f xs
-- ghci> productoriaderivando valorAbsoluto [4,3,(-4),2,1]
-- 96
-- ghci> productoriaderivando  valorAbsoluto [1,2,0]
-- 0
productoria' :: [a] -> (a->Int) -> Int
productoria' [] _ = 1
productoria' (x:xs) f = f x * productoria' xs f
-- ghci> productoria' [-1,2,3] valorAbsoluto 
-- 6


-- Ejercicio 5
paratodoRedef :: (a -> Bool) -> [a] -> Bool
paratodoRedef f xs = paratodo' xs f 
-- ghci> paratodoRedef esCero [0,1,0,0,0,0]
-- False
-- ghci> paratodoRedef esCero [0,0,0,0,0,1]
-- False

-- Ejercicio 6
-- a)
todosPares :: [Int] -> Bool 
todosPares xs = paratodo' xs even
-- ghci> todosPares [2,4,6]
-- True
-- ghci> todosPares [1,2,3,4,5]
-- False

-- b)

--Aux

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n xs = existe' xs (\x -> mod x n == 0)
-- ghci> hayMultiplo 5 [1]
-- False
-- ghci> hayMultiplo 5 [10,2,3]
-- True
-- ghci> hayMultiplo 5 [10,2,3]

-- c)
sumaCuadrados :: Int -> Int
sumaCuadrados n = sumatoriaderivando (^2) [0..n]
-- ghci> sumaCuadrados 4
-- 30
-- ghci> sumaCuadrados 4
-- 30
-- ghci> sumaCuadrados 120
-- 583220
-- ghci> sumaCuadrados (-4)
-- 0

-- d)

existeDivisor :: Int -> [Int] -> Bool
existeDivisor n xs = existe' xs (\x -> mod n x == 0) -- (h) mod es la función que da el resto de una división n/m
-- ghci> existeDivisor 120 [10,20,30]
-- True
-- ghci> existeDivisor 120 [0]
-- *** Exception: divide by zero
-- ghci> existeDivisor 120 [153]
-- False

-- e)
esPrimo :: Int -> Bool
esPrimo n = not(existeDivisor n [2..n-1]) || n == 2

{-
(h) Acá interpreto el rango de búsqueda entre 2 y n-1 ya que se asume que todo número se divide a sí mismo y a uno.
lectura semántica de la función:
La función revisa si existe un divisor distinto a 1 y n y, si lo llegara a encontrar; da como resultado que no es primo.
-}

-- ghci> esPrimo 4
-- False
-- ghci> esPrimo 5
-- True
-- ghci> esPrimo 6
-- False
-- ghci> esPrimo 7
-- True


-- f)
factorialredef :: Int -> Int
factorialredef n = productoria [1..n] 

-- ghci> factorialredef 10
-- 3628800
-- ghci> factorialredef 5
-- 120
-- ghci> factorialredef 1
-- 1
-- ghci> factorialredef 0
-- 1

-- g)
multiplicaPrimos :: [Int] -> Int
multiplicaPrimos xs = productoriaderivando id (filter esPrimo xs) 
-- ghci> multiplicaPrimos [1,2,3,5,6,7,8,9]
-- 210
-- ghci> multiplicaPrimos [2,4,5,7,8,9,0]
-- 0
-- ghci> multiplicaPrimos [2,4,5,7,8,9,1]
-- 70

-- h)
{- fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

esFib :: Int -> Bool
esFib n =
 -}

-- i)
-- todosFib :: [Int] -> Bool

-- Ejercicio 7
-- ¿Que hacen estas funciones?
{-

La función map se define como

map :: (a -> b) -> [a] -> [b]

La función map se define como aquella
que toma una función que cambia de un
tipo a otro a cada elemento de la lista;
dando como resultado una lista del segundo tipo.


La función filter se define como

filter :: (a -> Bool) -> [a] -> [a]

El filtro básicamente lleva a cabo un 'Colador'
dentro de los elementos de la función, básicamente,
toma una función de tipo booleano y crea una nueva lista
únicamente devolviendo aquellos elementos de la lista 
que cumplen la condición.

-}

-- ¿A que equivale la expresion map succ [1, -4, 6, 2, -8], donde succ n = n+1?
{-
Tipo succ
succ :: Enum a => a -> a
La expresión succ toma un número y devuelve su sucesor,
con la función map lo que obtendremos es una nueva lista
con todos los numeros sucesores a cada numero de la lista
anterior.
-}

-- ¿Y la expresion filter esPositivo [1, -4, 6, 2, -8]?
{-
Esta expresión tomará de la lista aquellos números que cumplan la cualidad de ser positivos
Tomará la lista [1,-4,6,2,-8] y devolverá [1,6,2]
-}

-- Ejercicio 8
-- a)
duplicaValor :: [Int] -> [Int]
duplicaValor [] = []
duplicaValor (x:xs) = x*2 : duplicaValor xs
-- ghci> duplicaValor [5,2,3,4,5]
-- [10,4,6,8,10]
-- ghci> duplicaValor [5,3,2,4,7]
-- [10,6,4,8,14]

--b)
duplicaValorMap :: [Int] -> [Int]
duplicaValorMap = map (*2)
-- ghci> duplicaValorMap [5,3,2,4,7]
-- [10,6,4,8,14]

-- Ejercicio 9

-- a)
sonPrimos :: [Int] -> [Int]
sonPrimos [] = []
sonPrimos (x:xs) 
                | esPrimo x = x :sonPrimos xs 
                | otherwise = sonPrimos xs
-- ghci> sonPrimos [1,2,3,4,5,6,7,8,9,10]
-- [1,2,3,5,7]
-- ghci> sonPrimos [10,11,12,13,14,15,16]
-- [11,13]

-- b)

sonPrimosFilter :: [Int] -> [Int]
sonPrimosFilter = filter esPrimo
-- ghci> sonPrimosFilter [0..100]
-- [0,1,2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]
-- c) Sí, por lo mismo ahora le coloqué un filter para que no sea tan engorrosa


-- Ejercicio 10
-- a)
primIgualesA :: Int -> [Int] -> [Int]
primIgualesA _ [] = []
primIgualesA n (x:xs) 
                        | n == x = x:primIgualesA n xs 
                        | otherwise = primIgualesA n xs
-- ghci> primIgualesA 5 [5,4,3,2,1]
-- [5]
-- ghci> primIgualesA 5 [5,5,5,2,1]
-- [5,5,5]

-- b)
{- Según Hoogle takeWhile, aplica un predicado a una lista, devolviendo el más largo prefijo (Posiblemente vacío) de la lista xs de elementos que satisfagan el pred-}
primIgualesATW :: (Eq a) => a -> [a] -> [a]
primIgualesATW n = takeWhile (==n)
-- ghci> primIgualesATW 5 [5,5,5,5,1,2,3,4,5,5,5,5]
-- [5,5,5,5]
-- ghci> primIgualesATW 1 [1,1,1,1,1,2,3,4,5,1,1,1,1]
-- [1,1,1,1,1]

-- Ejercicio 11
-- a)
primIguales :: (Eq a) => [a] -> [a] 
primIguales [] = []
primIguales [x] = [x]
primIguales [x,_] = [x]
primIguales (x:y:xs) 
                        | x == y = x : y : primIguales xs
                        | otherwise = primIguales xs
-- ghci> primIguales [5,5,1,3,2,6]
-- [5,5]
-- ghci> primIguales [4,3,3,4,1]
-- [4]

-- b)
primIgualesReprogramado :: (Eq a) => [a] -> [a]
primIgualesReprogramado (x:xs) = x:primIgualesATW x xs
primIgualesReprogramado [] = []
-- ghci> primIgualesReprogramado [4,4,5,4,4,4,4]
-- [4,4]
-- ghci> primIgualesReprogramado [4,4,4,5]
-- [4,4,4]

-- Ejercicio 12 (*)


-- Ejercicio 13 (*)


-- Ejercicio 14 (*)


-- Ejercicio 15 (*)


-- Ejercicio 16 (*)
