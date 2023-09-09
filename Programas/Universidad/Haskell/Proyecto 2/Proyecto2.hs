{-1. Objetivo
En este proyecto definiremos nuestros propios tipos de datos. La importancia de poder definir
nuevos tipos de datos reside en la facilidad con la que podemos modelar problemas y resolverlos
usando las mismas herramientas que para los tipos pre-existentes.
El objetivo de este proyecto es aprender a declarar nuevos tipos de datos en Haskell y definir
funciones para manipular expresiones que utilizan estos tipos.-}


-- 2. Ejercicios
{- 1. Tipos enumerados. Cuando los distintos valores que debemos distinguir en un tipo son
finitos, podemos enumerar cada uno de los valores del tipo. Por ejemplo, podrıamos representar
las carreras que se dictan en nuestra facultad definiendo el siguiente tipo:
d a t a Carrera = Matematica | Fisica | Computacion | Astronomia
Cada uno de estos valores es un constructor, ya que al utilizarlos en una expresion, generan
un valor del tipo Carrera. -}

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


{- c) Para escribir musica se utiliza la denominada notacion musical, la cual consta de
notas (do, re, mi, ...). Ademas, estas notas pueden presentar algun modificador ]
(sostenido) o [ (bemol), por ejemplo do], si[, etc. Por ahora nos vamos a olvidar de
estos modificadores (llamados alteraciones) y vamos a representar las notas basicas.
Definir el tipo NotaBasica con constructores Do, Re, Mi, Fa, Sol, La y Si -}
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


{- 2. Clases de tipos. En Haskell usamos el operador (==) para comparar valores del mismo tipo:
1
*Main> 4 == 5
False
*Main> 3 == (2 + 1)
True
Sin embargo, si intentamos comparar dos valores del tipo Carrera veremos que el interprete
nos mostrara un error similar al siguiente:
*Main> Matematica == Matematica
• No instance for (Eq Carrera) arising from a use of ‘==’
El problema es que todavıa no hemos equipado al tipo nuevo Carrera con una nocion de
igualdad entre sus valores. ¿Como logramos eso en Haskell? Debemos garantizar que el tipo
Carrera sea un miembro de la clase Eq. Conceptualmente, una clase es un conjunto de
tipos que proveen ciertas operaciones especiales:
Clase Eq: tipos que proveen una nocion de igualdad (operador ==).
Clase Ord: tipos que proveen una nocion de orden (operadores <=, >=, funciones min,
max y mas).
Clase Bounded: tipos que proveen una cota superior y una cota inferior para sus valores.
Tienen entonces un elemento mas grande, definido como la constante maxBound, y un
elemento mas chico, definido como minBound.
Clase Show: tipos que proveen una representacion en forma de texto (funcion show).
Muchısimas mas.
Podemos indicar al interprete que infiera automaticamente la definicion de una clase para un
tipo dado en el momento de su definicion, usando deriving como se muestra a continuacion:
d a t a Carrera = Matematica | Fisica | Computacion | Astronomia d e r i v i n g Eq
Ahora es posible comparar carreras:
*Main> Matematica == Matematica
True
*Main> Matematica == Computacion
False -}

{- a) Completar la definicion del tipo NotaBasica para que las expresiones
*Main> Do <= Re
*Main> Fa `min` Sol
sean validas y no generen error. Ayuda: usar deriving con multiples clases. -}

-- *Main> Fa `min` Sol
-- Fa
-- *Main> Do <= Re
-- True

{-
3. Polimorfismo ad hoc Recordemos la funcion sumatoria del proyecto anterior:
sumatoria : : [ I n t ] − > I n t
sumatoria [ ] = 0
sumatoria ( x : xs ) = x + sumatoria xs
2
La funcion suma todos los elementos de una lista. Esta claro que el algoritmo que se debe
seguir para sumar una lista de numeros enteros y el algoritmo para sumar una lista de
numeros decimales es identico. Ahora, si queremos sumar numeros decimales de tipo Float
usando nuestra funcion:
*Main> sumatoria [1.5, 2.7, 0.8 :: Float]
Couldn’t match expected type ‘Int’ with actual type ‘Float’
(:)
El error era previsible ya que sumatoria no es polimorfica. Si tratamos de usar polimorfismo
parametrico:
sumatoria : : [ a ] − > a
sumatoria [ ] = 0
sumatoria ( x : xs ) = x + sumatoria xs
cuando recarguemos la definicion de sumatoria:
*Main> :r
No instance for (Num a) arising from a use of ‘+’
(:)
No instance for (Num a) arising from the literal ‘0’
(:)
Esto sucede porque en la definicion, la variable de tipo a no tiene ninguna restriccion, por
lo que el tipo no tiene que tener definida necesariamente la suma (+) ni la constante 0.
El algoritmo de la funcion sumatoria mientras trabaje con tipos numericos como Int,
Integer, Float, Double deberıa funcionar bien. Todos estos tipos numericos (y otros mas)
son justamente los que estan en la clase Num. Para restringir el polimorfismo de la variable a
a esa clase de tipo se escribe:
sumatoria : : Num a => [ a ] −> a
sumatoria [ ] = 0
sumatoria ( x : xs ) = x + sumatoria xs
Este tipo de definiciones se llaman polimorfismo ad hoc, ya que no es una definicion
completamente generica.
a) Definir usando polimorfismo ad hoc la funcion minimoElemento que calcula (de manera
recursiva) cual es el menor valor de una lista de tipo [a]. Asegurarse que solo este
definida para listas no vacıas.
b) Definir la funcion minimoElemento’ de manera tal que el caso base de la recursion
sea el de la lista vacıa. Para ello revisar la clase Bounded.
Ayuda: Para probar esta funcion dentro de ghci con listas vacıas, indicar el tipo concreto con tipos de la clase Bounded, por ejemplo: ([1,5,10]::[Int]), ([]::[Bool]),
etc.
c) Usar la funcion minimoElemento para determinar la nota mas grave de la melodıa:
[Fa, La, Sol, Re, Fa]
En las definiciones de los ejercicios siguientes, deben agregar deriving solo cuando sea
estrictamente necesario.
3
4. Sinonimo de tipos; constructores con parametros. En este ejercicio, introducimos dos
conceptos: los sinonimos de tipos y tipos algebraicos cuyos constructores llevan argumentos.
Un sinonimo de tipo nos permite definir un nuevo nombre para un tipo ya existente, como el
ya conocido tipo String que no es otra cosa que un sinonimo para [Char]. Por ejemplo, si
queremos modelar la altura (en centımetros) de una persona, podemos definir:
−− Altura es un sinonimo de tipo.
t y p e Altura = I n t
Los tipos algebraicos tienen constructores que llevan parametros. Esos parametros permiten
agregar informacion, generando potencialmente infinitos valores dentro del tipo. Por ejemplo,
si queremos modelar datos sobre deportistas, podrıamos definir los siguientes tipos:
−− Sinonimos de tipo
t y p e Altura = I n t
t y p e NumCamiseta = I n t
−− Tipos algebraicos sin parametros (aka enumerados)
d a t a Zona = Arco | Defensa | Mediocampo | Delantera
d a t a TipoReves = DosManos | UnaMano
d a t a Modalidad = Carretera | Pista | Monte | BMX
d a t a PiernaHabil = Izquierda | Derecha
−− Sinonimo
t y p e ManoHabil = PiernaHabil
−− Deportista es un tipo algebraico con constructores parametricos
d a t a Deportista = Ajedrecista −− Constructor sin argumentos
| Ciclista Modalidad −− Constructor con un argumento
| Velocista Altura −− Constructor con un argumento
| Tenista TipoReves ManoHabil Altura −− Constructor con tres argumentos
| Futbolista Zona NumCamiseta PiernaHabil Altura −− Constructor con ...
a) Implementa el tipo Deportista y todos sus tipos accesorios (NumCamiseta, Altura,
Zona, etc) tal como estan definidos arriba.
b) ¿Cual es el tipo del constructor Ciclista?
c) Programa la funcion contar_velocistas :: [Deportista] -> Int que dada una
lista de deportistas xs, devuelve la cantidad de velocistas que hay dentro de xs.
Programa contar_velocistas sin usar igualdad, utilizando pattern matching.
d) Programa la funcion contar_futbolistas :: [Deportista] -> Zona -> Int que
dada una lista de deportistas xs, y una zona z, devuelve la cantidad de futbolistas
incluidos en xs que juegan en la zona z. Programa contar_futbolistas sin usar
igualdad, utilizando pattern matching.
e) ¿La funcion anterior usa filter? Si no es ası, reprogramala para usarla.
5. Definicion de clases. Vamos ahora a representar la notas musicales con sus alteraciones.
Desde que se utiliza el sistema temperado (desde mediados de siglo XVIII aprox) se considera
que hay 12 sonidos que se obtienen a partir de las notas musicales. Con el tipo NotaBasica
logramos representar las 7 notas basicas y definir el orden que hay entre ellas. Una buena
manera de ilustrarlo (sin usar un pentagrama musical) es ubicando las notas en un teclado
de piano:
Cada tecla del piano produce un sonido, y en ese sentido se puede ver que las teclas negras
no las estamos representando y en consecuencia hay sonidos que quedan por fuera. Como se
menciono anteriormente, las notas musicales pueden (o no) tener alteraciones. La alteracion
sostenido (]) sube ligeramente la afinacion (un semitono), por otro lado un bemol ([) baja
en la misma medida la afinacion de la nota. Esto se puede ver en el teclado:
4
Notar que finalmente el sostenido (]) nos lleva a la siguiente tecla del piano (si no hay una
tecla negra intermedia, llegamos a una blanca), de forma similar el bemol ([) nos lleva a la
tecla anterior. Si se enumeran los sonidos partiendo de la nota Do, arrancando desde el cero,
se pueden visualizar en el teclado:
Podemos definir entonces para las notas basicas la funcion sonidoNatural:
sonidoNatural : : NotaBasica −> I n t
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11
a) Implementa la funcion sonidoNatural como esta definida arriba.
b) Definir el tipo enumerado Alteracion que consta de los constructores Bemol, Natural
y Sostenido.
c) Definir el tipo NotaMusical que consta de un unico constructor llamado Nota que
toma dos parametros. El primer parametro es de tipo NotaBasica y el segundo de tipo
Alteracion. De esta manera cuando se quiera representar una nota alterada se puede
usar como segundo parametro del constructor un Bemol o Sostenido y si se quiere
representar una nota sin alteraciones se usa Natural como segundo parametro.
d) Definı la funcion sonidoCromatico :: NotaMusical -> Int que devuelve el sonido
de una nota, incrementando en uno su valor si tiene la alteracion Sostenido, decrementando en uno si tiene la alteracion Bemol y dejando su valor intacto si la alteracion
es Natural
e) Incluı el tipo NotaMusical a la clase Eq de manera tal que dos notas que tengan el
mismo valor de sonidoCromatico se consideren iguales.
f ) Incluı el tipo NotaMusical a la clase Ord definiendo el operador <=. Se debe definir
que una nota es menor o igual a otra si y solo si el valor de sonidoCromatico para la
primera es menor o igual al valor de sonidoCromatico para la segunda.
6. Tipos enumerados con polimorfismo.
Usualmente nos encontramos con funciones que no estan definidas para ciertos valores de su
dominio. Por ejemplo, consideremos la siguiente funcion:
dividir : : I n t −> I n t −> I n t
dividir x y = x ` di v ` y
Podemos ver que, como la division por 0 no esta definida, el interprete de Haskell nos muestra
un error:
5
$> dividir 4 0
*** Exception: divide by zero
¿Como podrıamos cambiar la definicion anterior para que la misma este definida en todo el
dominio? Podrıamos usar el tipo Maybe que se define en el Preludio de Haskell:
d a t a Maybe a = N o t hi n g | J u s t a
Para indicar que la division entera ’no tiene valor’ cuando el denominador es 0, usamos el
constructor Nothing. Cuando tiene valor definido, usamos el constructor Just.
dividir : : I n t −> I n t −> Maybe I n t
dividir x 0 = N o t hi n g
dividir x y = J u s t ( x ` di v ` y )
Y esta vez no recibimos un error si usamos el 0 como denominador:
$> dividir 4 0
Nothing
$> dividir 4 2
Just 2
Notar en la definicion anterior que Maybe a es un tipo que depende de la variable a, y en
consecuencia Maybe es un constructor de tipos polimorfico.
a) Definir la funcion primerElemento que devuelve el primer elemento de una lista no
vacıa, o Nothing si la lista es vacıa.
primerElemento : : [ a ] −> Maybe a
7. Tipos recursivos. Supongamos que queremos representar una cola de deportistas, como
aquellas que forman fila para retirar sus credenciales en la villa olımpica. Un deportista
llega y se coloca al final de la cola y espera su turno. El orden de atencion respeta el orden
de llegada, es decir, quien primero llega, es atendido primero. Podemos representar esta
situacion con el siguiente tipo:
6
d a t a Cola = VaciaC | Encolada Deportista Cola
En esta definicion, el tipo que estamos definiendo (Cola) aparece como un parametro de
uno de sus constructores; por ello se dice que el tipo es recursivo. Ası una cola o bien esta
vacıa, o bien contiene a una persona encolada, seguida del resto de la cola. Esto nos permite
representar colas cuya longitud no conocemos a priori y que pueden ser arbitrariamente
largas.
a) Programa las siguientes funciones:
1) atender :: Cola -> Maybe Cola, que elimina de la cola a la persona que esta
en la primer posicion de una cola, por haber sido atendida. Si la cola esta vacıa,
devuelve Nothing.
2) encolar :: Deportista -> Cola -> Cola, que agrega una persona a una cola
de deportistas, en la ultima posicion.
3) busca :: Cola -> Zona -> Maybe Deportista, que devuelve el/la primera
futbolista dentro de la cola que juega en la zona que se corresponde con el segundo
parametro. Si no hay futbolistas jugando en esa zona devuelve Nothing.
b) ¿A que otro tipo se parece Cola?.
8. Tipos recursivos y polimorficos. Consideremos los siguientes problemas:
Encontrar la definicion de una palabra en un diccionario;
encontrar el lugar de votacion de una persona.
Ambos problemas se resuelven eficientemente, usando un diccionario o un padron electoral.
Estos almacenan la informacion asociandola a otra que se conoce; en el caso del padron sera
el numero de documento, mientras que en el diccionario sera la palabra en sı.
Puesto que reconocemos la similitud entre un caso y el otro, deberıamos esperar poder
representar con un unico tipo de datos ambas situaciones; es decir, necesitamos un tipo
polimorfico que asocie a un dato bien conocido (la clave) la informacion relevante (el dato).
Una forma posible de representar esta situacion es con el tipo de datos recursivo lista de
asociaciones definido como:
d a t a ListaAsoc a b = Vacia | Nodo a b ( ListaAsoc a b )
Los parametro del tipo tipo a y b indican que se trata de un tipo polimorfico. Tanto a como
b son variables de tipo, y se pueden instanciar con distintos tipos, por ejemplo:
t y p e Diccionario = ListaAsoc S t r i n g S t r i n g
t y p e Padron = ListaAsoc I n t S t r i n g
a) ¿Como se debe instanciar el tipo ListaAsoc para representar la informacion almacenada
en una guıa telefonica?
b) Programa las siguientes funciones:
1) la_long :: ListaAsoc a b -> Int que devuelve la cantidad de datos en una
lista.
2) la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b, que devuelve la concatenacion de dos listas de asociaciones.
7
3) la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b, que
agrega un nodo a la lista de asociaciones si la clave no esta en la lista, o actualiza
el valor si la clave ya se encontraba.
4) la_pares :: ListaAsoc a b -> [(a, b)] que transforma una lista de asociaciones en una lista de pares clave-dato.
5) la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b que dada una lista
y una clave devuelve el dato asociado, si es que existe. En caso contrario devuelve
Nothing.
6) la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b que dada
una clave a elimina la entrada en la lista.
9. (Punto ?) Otro tipo de datos muy util y que se puede usar para representar muchas
situaciones es el arbol; por ejemplo, el analisis sintactico de una oracion, una estructura
jerarquica como un arbol genealogico o la taxonomıa de Linneo.
En este ejercicio consideramos arboles binarios, es decir que cada rama tiene solo dos
descendientes inmediatos:
d a t a Arbol a = Hoja | Rama ( Arbol a ) a ( Arbol a )
Como se muestra a continuacion, usando ese tipo de datos podemos por ejemplo representar
los prefijos comunes de varias palabras.
t y p e Prefijos = Arbol S t r i n g
can , cana , canario , canas , cant , cantar , canto : : Prefijos
can = Rama cana ” can ” cant
cana = Rama canario ”a” canas
canario = Rama Hoja ” r i o ” Hoja
canas = Rama Hoja ” s ” Hoja
cant = Rama cantar ” t ” canto
cantar = Rama Hoja ” a r ” Hoja
canto = Rama Hoja ”o” Hoja
can
a
rio s
t
ar o
Programa las siguientes funciones:
a) a_long :: Arbol a -> Int que dado un arbol devuelve la cantidad de datos almacenados.
b) a_hojas :: Arbol a -> Int que dado un arbol devuelve la cantidad de hojas.
c) a_inc :: Num a => Arbol a -> Arbol a que dado un arbol que contiene numeros,
los incrementa en uno.
d) a_map :: (a -> b) -> Arbol a -> Arbol b que dada una funcion y un arbol,
devuelve el arbol con la misma estructura, que resulta de aplicar la funcion a cada uno
de los elementos del arbol. Revisa la definicion de la funcion anterior y reprogramala
usando a_map.
8
10. (Punto ?) Un tipo tambien muy util, es el arbol binario de busqueda (ABB). Un ABB es
una estructura de datos donde cada nodo tiene un valor y cumple con la propiedad de que
los valores en el subarbol izquierdo son menores que el valor del nodo, y los valores en el
subarbol derecho son mayores. Por ejemplo:
En este ABB, el valor 5 es la raız. Los valores menores que 5 estan en el subarbol izquierdo
(3, 1, 4), y los valores mayores estan en el subarbol derecho (8, 10). Esta estructura permite
busquedas eficientes: si deseas encontrar el valor 4, comienzas en la raız y avanzas hacia la
izquierda y luego hacia la derecha para encontrarlo en el subarbol izquierdo.
Programar los siguientes apartados:
a) : Definir el tipo recursivo ABB utilizando los constructores:
RamaABB :: ABB a -> a -> ABB a
VacioABB :: ABB a
b) Definir una funcion insertarABB que tome un valor y un arbol binario como entrada y
devuelva un nuevo arbol que contenga el valor insertado en el arbol original. La funcion
tiene que tener el siguiente tipado:
insertarABB :: Ord a => a -> ABB a -> ABB a
c) Define una funcion llamada buscarEnArbol que tome un valor y un arbol binario como
entrada y devuelva True si el valor esta presente en el arbol y False en caso contrario.
La funcion tiene que tener el siguiente tipado:
buscarABB :: Eq a => a -> ABB a -> Bool
d) Notar que los constructores RamaABB y VacioABB permiten construir arboles binarios
que no cumplen la propiedad fundamental de los arboles binarios de busqueda. Por
ejemplo:
RamaABB ( RamaABB VacioABB 10 VacioABB ) 2 ( RamaABB VacioABB 11 VacioABB )
El arbol construido se ilustra a continuacion:
Claramente no es un ABB, otro caso no tan trivial es:
9
Definir la funcion verificarABB que devuelve True si el arbol cumple con la propiedad
fundamental o False en caso contrario. De manera auxiliar pueden definir las funciones
:
mayor_a_todos :: Ord a => a -> ABB a -> Bool
menor_a_todos :: Ord a => a -> ABB a -> Bool
Asegurarse que la funcion verificarABB devuelva False para los dos ejemplos mostrados. Para probar la funcion en el primer ejemplo pueden definir:
ejemplo1 = RamaABB ( RamaABB VacioABB 10 VacioABB )
2
( RamaABB VacioABB 11 VacioABB )
y luego evaluar
*Main> verificarABB ejemplo1
Se debe definir analogamente ejemplo2 con la expresion que represente el arbol del
segundo ejemplo. Ademas deben incluir como comentarios en el codigo el resultado de
la ejecucion de verificarABB para ejemplo1 y ejemplo2.
-}