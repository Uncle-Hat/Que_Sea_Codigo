{-# LANGUAGE NPlusKPatterns #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}

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
existeDivisor n xs = existe' xs (\x -> mod n x == 0) --mod es la función que da el resto de una división n/m
-- ghci> existeDivisor 120 [10,20,30]
-- True
-- ghci> existeDivisor 120 [0]
-- *** Exception: divide by zero
-- ghci> existeDivisor 120 [153]
-- False
-- e)
{- esPrimo :: Int -> Bool
esPrimo n = esMultiplo n 1 && esMultiplo n n && not(esMultiplo n _) -}

-- f)


-- g)


-- h)


-- i)
