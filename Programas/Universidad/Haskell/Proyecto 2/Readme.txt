Listas Ejemplo:
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

[Ajedrecista, Ciclista Carretera , Velocista 1 , Tenista DosManos Izquierda 2 ,Futbolista Arco 7 Derecha 5]
[Ajedrecista, Velocista 1 , Tenista DosManos Izquierda 2 ,Futbolista Arco 7 Derecha 5, Ajedrecista, Ajedrecista, Futbolista Defensa 10 Derecha 2]
[Velocista 1,Velocista 4,Velocista 7,Ajedrecista,Ajedrecista]
[Futbolista Arco 7 Derecha 5, Futbolista Mediocampo 8 Izquierda 10]