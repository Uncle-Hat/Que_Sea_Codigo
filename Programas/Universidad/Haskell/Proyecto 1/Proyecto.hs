

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
esVocal x       | x == 'a'|| x =='e'|| x =='i'|| x =='o'|| x =='u' = True --El or lógico recibe booleanos, por lo tanto tenemos que dárselos mediante casos
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
pertenece c (x:xs)      | c == x = True
                        | c /= x = pertenece c xs

{-
*Main> pertenece 5 [5,6,7,8,9]
True
*Main> pertenece 5 [6,7,8,9]
False
-}


{- 4. Programa las siguientes funciones que implementan los cuantificadores generales. Nota que
el segundo parametro de cada funcion, es otra funcion! -}

-- a) paratodo’ :: [a] -> (a -> Bool) -> Bool, dada una lista xs de tipo [a] y un
-- predicado t :: a -> Bool, determina si todos los elementos de xs satisfacen el
-- predicado t. 

paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] t = False
paratodo' (x:xs) t      | t x == True = True
                        | t x /= True = False

{- 
*Main> paratodo' [5,4,2,1,0] (<0)
False
*Main> paratodo' [5,4,2,1] (>0)
True
-}

-- b) existe’ :: [a] -> (a -> Bool) -> Bool, dada una lista xs de tipo [a] y un
-- predicado t :: a -> Bool, determina si algun elemento de xs satisface el predicado t.

existe' :: [a] -> (a -> Bool) -> Bool
existe' [] p = False
existe' (x:xs) p        | p x == True = True 
                        | p x == False = existe' xs p

{- 
*Main> existe' [5,(-3),7] (<0)
True
*Main> existe' [5,(-3),7] (>0)
True
*Main> existe' [5,(-3),7] (==0)
False
-}

-- c) sumatoria’ :: [a] -> (a -> Int) -> Int, dada una lista xs de tipo [a] y una
-- funcion t :: a -> Int (toma elementos de tipo a y devuelve enteros), calcula la
-- suma de los valores que resultan de la aplicacion de t a los elementos de xs.

sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] p = 0
sumatoria' (x:xs) p = p x + sumatoria' xs p

{-
*Main> sumatoria' [4,5,6,7,8,9] (+10)
99 
-}

-- d) productoria’ :: [a] -> (a -> Int) -> Int, dada una lista de xs de tipo [a]
-- y una funcion t :: a -> Int, calcula el producto de los valores que resultan de la
-- aplicacion de t a los elementos de xs.
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
factorialnorecurs :: Int -> Int
factorialnorecurs n = productoria' [1..n] id

-- g) Programar la funcion multiplicaPrimos :: [Int] -> Int que calcula el producto de todos los numeros primos de una lista. 
devuelvePrimos :: [Int] -> [Int]
devuelvePrimos [] = []
devuelvePrimos (x:xs)   | esPrimo x == True = x : devuelvePrimos xs
                        | esPrimo x == False = devuelvePrimos xs

multiplicaPrimos :: [Int] -> Int
multiplicaPrimos xs =  productoria (devuelvePrimos xs)

{- 
*Main> multiplicaPrimos [5]
5
*Main> multiplicaPrimos [1,2,3,5,6,7,8,9]
210 -}

-- h) Programar la funcion esFib :: Int -> Bool, que dado un entero n, devuelve True si y solo si n esta en la sucesion de Fibonacci.

fib :: Int -> Int
fib n   | (n<=1) = n --Razonamos que en los dos primeros casos devuelve su propio n tal que fib 1= 1 y fib 0 = 0 *Tuve problemas llevando a cabo el código por mi mismo, por lo tanto implementé código y traté de entender qué hace
        | otherwise = fib(n-1) + fib(n-2)

esFib :: Int -> Bool
esFib n = pertenece n (map fib [0..(n+1)])

{- 
*Main> fib 5
5
*Main> fib 23
28657
*Main> fib 1
1
*Main> fib 8
21 
Main> esFib 2
True
*Main> esFib 1
True
*Main> esFib 8
True
*Main> esFib 12
False
-}

{- Ayuda: Realizar una funcion auxiliar fib :: Int -> Int que dado un n devuelva el
n-esimo elemento de la sucesion. -}

{- i) Utilizando la funcion del apartado anterior, definı la funcion todosFib :: [Int] -> Bool
que dada una lista xs de enteros, devuelva si todos los elementos de la lista pertenecen
(o no) a la sucesion de Fibonacci. -}
{- todosFib :: [Int] -> Bool
todosFib xs = paratodo' esFib xs -}


{- 7. Indaga en Hoogle sobre las funciones map y filter. Tambien podes consultar su tipo en
ghci con el comando :t.-}
{- 
*Main> :t map
map :: (a -> b) -> [a] -> [b]
*Main> :t filter
filter :: (a -> Bool) -> [a] -> [a]
-}


{-8. Programa una funcion que dada una lista de numeros xs, devuelve la lista que resulta de
duplicar cada valor de xs.-}
-- a) Definila usando recursion.
duplica :: [Int] -> [Int]
duplica [] = []
duplica (x:xs) = ((2*x) : duplica xs)

-- b) Definila utilizando la funcion map.
duplicamap :: [Int] -> [Int]
duplicamap xs = map (*2) xs

{-
*Main> duplica [4,5,6,7]
[8,10,12,14]
*Main> duplicamap [4,5,6,7]
[8,10,12,14]
-}


{-9. Programa una funcion que dada una lista de numeros xs, calcula una lista que tiene como
elementos aquellos numeros de xs que son primos.-}

-- a) Definila usando recursion.
sonPrimos :: [Int] -> [Int]
sonPrimos [] = []
sonPrimos (x:xs)|  esPrimo x == True = x : sonPrimos xs
                |  esPrimo x == False = sonPrimos xs 

-- b) Definila utilizando la funcion filter.
sonPrimosFiltered :: [Int] -> [Int]
sonPrimosFiltered xs = filter esPrimo xs

{-
*Main> sonPrimos [2,3,4,5]
[2,3,5]
*Main> sonPrimosFiltered [2,3,4,5]
[2,3,5]
-}

-- c) Revisa tu definicion del ejercicio 6g. ¿Como podes mejorarla?
{- Mi definicion de 6g fue 
devuelvePrimos :: [Int] -> [Int]
devuelvePrimos [] = []
devuelvePrimos (x:xs)   | esPrimo x == True = x : devuelvePrimos xs
                        | esPrimo x == False = devuelvePrimos xs

multiplicaPrimos :: [Int] -> Int
multiplicaPrimos xs =  productoria (devuelvePrimos xs)
-}
-- * Creo que se puede mejorar por medio de una función filter 
multiplicaPrimosFiltered :: [Int] -> Int
multiplicaPrimosFiltered xs = productoria(filter esPrimo xs) 

{- 
*Main> multiplicaPrimosFiltered [1,2,3,4,5,6,7,8,9,10]
210
*Main> multiplicaPrimosFiltered [2,3,4,5,6,7]
210
-}


{- 10. La funcion primIgualesA toma un valor y una lista, y calcula el tramo inicial mas largo de
la lista cuyos elementos son iguales a ese valor. Por ejemplo: -}

-- a) Programa primIgualesA por recursion.
primIgualesA :: (Eq a) => a -> [a] -> [a]
primIgualesA n [] = []
primIgualesA n (x:xs)   | (n == x) = x: primIgualesA n xs
                        | otherwise = []

{-
*Main> primIgualesA 5 [0,1,2,3,4,5,5,5,5,5,4,3,2,1,5,67]
[]
*Main> primIgualesA 5 [5,5,5,2,5,4,3,2,1,5,67]
[5,5,5]
-}

-- b) Programa nuevamente la funcion utilizando primIgualesA.

primIgualesAtakewhile :: Eq a => a -> [a] -> [a]
primIgualesAtakewhile n xs = takeWhile (==n) xs

{- 
*Main> primIgualesAtakewhile 5 [5,5,5,5,5,4,3,2,1,5,67]
[5,5,5,5,5]
*Main> primIgualesAtakewhile 5 [0,1,2,3,4,5,5,5,5,5,4,3,2,1,5,67]
[]
-}


{- 11. La funcion primIguales toma una lista y devuelve el mayor tramo inicial de 
la lista cuyos elementos son todos iguales entre sı. Por ejemplo: -}
-- * No estoy seguro si el tramo inicial de la lista se refiera a que solo puede estar al principio de la lista o si es el primer tramo que se repite
-- a) Programa primIguales por recursion.
primIguales :: Eq a => [a] -> [a] 
primIguales [] = []
primIguales [x] = [x]
primIguales  (x:y:xs)   | x==y = x :primIguales (y:xs)
                        | x/=y = [x]

{-
*Main> primIguales [True,True,True,False,False]
[True,True,True]
*Main> primIguales [5,5,5,5,3,4,2,1]
[5,5,5,5]
*Main> primIguales [5,5,5,5,3,4,2,1,1,1]
[5,5,5,5]
*Main> primIguales [5,5,3,4,2,1,1,1]
[5,5]
-}
-- b) Usa cualquier version de primIgualesA para programar primIguales. Esta permitido dividir en casos, pero no usar recursion.
primIguales' :: Eq a => [a] -> [a]
primIguales' [] = []
primIguales' (x:xs) = primIgualesA x (x:xs)

{-
*Main> primIguales' [True,False,True,True,True]
[True]
*Main> primIguales' [False,True,True,True]
[False]
*Main> primIguales' [True,True,True,False,True]
[True,True,True]
*Main> 
-}

{-12 Reescribir todas las funciones del punto 4 utilizando el cuantificador generalizado (sin usar
inducción y en una lı́nea por función)-}

cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen _ z [] _ = z --Al no haber elementos en la lista retorna al caso base
cuantGen op z (x:xs) t = op (t x) (cuantGen op z xs t) --Como tenemos elementos en la lista aplicamos el caso recursivo e intentamos revisar, mediante el operador al término afectando a t x
-- ghci> cuantGen (+) 0 [1,2,3,4,5,6,7,8,9,10] id 
-- 55

{- 13 (*) Definir una funcion que se denomina distancia de edicion . Que toma como entrada
dos strings (lista de caracteres). distanciaEdicion::[Char]->[Char]-> Int. La funcion
distanciaEdicion, se comporta de la siguiente manera: - Si alguna de las listas es vacıa,
devuelve la longitud de la otra lista. - Si las dos listas son no vacıas: x:xs e y:ys, compara
los primeros elementos de cada lista: -}

distanciaEdicion :: [Char] -> [Char] -> Int
distanciaEdicion [] ys = length ys
distanciaEdicion xs [] = length xs
distanciaEdicion (x:xs) (y:ys)  | x == y = distanciaEdicion xs ys
                                | x /= y = 1 + distanciaEdicion xs ys 

-- ghci> distanciaEdicion [] "hola"
-- 4
-- ghci> distanciaEdicion [] "Cómo Estás"
-- 10
-- ghci> distanciaEdicion [] "Holanda"
-- 7

{- 14. (*) Definı una funcion primeros que cumplen, primQueCumplen::[a]->(a->Bool)->[a],
tal que, dada una lista ls y un predicado p, devuelve el tramo inicial de ls que cumple p. -}
primQueCumplen :: [a] -> (a->Bool) -> [a]
primQueCumplen [] _ = []
primQueCumplen (y:ys) p | p y = y : primQueCumplen ys p
                        | otherwise = primQueCumplen ys p
-- ghci> primQueCumplen [5,1,3,7,8] esPrimo
-- [5,1,3,7]

{- 15. (*) Para cada uno de los siguientes patrones, decidı si estan bien tipados, y en tal caso da los
tipos de cada subexpresion. En caso de estar bien tipado, >el patron cubre todos los casos
de definicion?
a) f :: (a, b) -> ...
 f (x , y) = ...
b) f :: [(a, b)] -> ...
 f (a , b) = ...
c) f :: [(a, b)] -> ...
 f (x:xs) = ...
d) f :: [(a, b)] -> ...
 f ((x, y) : ((a, b) : xs)) = ...
e) f :: [(Int, a)] -> ...
 f [(0, a)] = ...
f) f :: [(Int, a)] -> ...
 f ((x, 1) : xs) = ...
g) f :: (Int -> Int) -> Int -> ...
 f a b = ...
h) f :: (Int -> Int) -> Int -> ...
 f a 3 = ...
i) f :: (Int -> Int) -> Int -> ...
 f 0 1 2 = ... -}

{- 
Respuesta 15
a) Está bien tipado, el tipo de tupla se corresponde a una tupla dentro de un paréntesis, 
b) Está mal tipado, los tipos de la subexpreción deberían ser [(a,b):ys] (Por ejemplo)
c) Está mal tipado, [(a,b)] 
d) Está bien tipado, pero la subexpresión solo responde a casos con dos o más tuplas
e) Está bien tipado, más sin embargo, únicamente corresponde al caso en que el entero es igual a cero
f) Está bien tipado, responde a aquellos casos en que a es igual a 1 //Revisar
g) está bien tipado, el tipo de la sub expresión será un operador de enteros en enteros con un parámentro entero
h) Está bien tipado, aunque solamente responede a aquellos casos en que el segundo término es 3
i) Está mal tipado, ya que la función exije dos parámetros, no tres
-}

{- 
(*) Para las siguientes declaraciones de funciones, da al menos una definicion cuando sea
posible. 
>Podes dar alguna otra definicion alternativa a la que diste en cada caso?
Por ejemplo, si la declaracion es f :: (a, b) -> a,
la respuesta es: f (x,y) = x
a) f :: (a, b) -> b
b) f :: (a, b) -> c
c) f :: (a -> b) -> a -> b
d) f :: (a -> b) -> [a] -> [b] 
-}
{-
a) f (1,d) = d
a') f (a,e) = e
b) f (c,e) = 0
b') f (1,a) = True
c) f a b = b
c') f e d = d
d) f a xs = ys
d') f a [] = []
-}