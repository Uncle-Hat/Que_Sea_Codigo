{- Ejercicio 1 -}

type Letras = (Char,Char,Char)
type Numeracion = Int
data Matricula = Patente Letras Numeracion deriving(Ord,Eq,Show)

letra_valida :: Char -> Bool
letra_valida c = 'A'<=c && c<='Z'

letras_validas :: Letras -> Bool
letras_validas (a,b,c) = letra_valida a && letra_valida b && letra_valida c

matricula_valida :: Matricula -> Bool
matricula_valida (Patente c num) = letras_validas c && ((num>=0)&&(num<=999))

-- ghci> matricula_valida (Patente ('A','B','C') 124)
-- True
-- ghci> matricula_valida (Patente ('A','B','C') 1000)
-- False
-- ghci> matricula_valida (Patente ('A','!','C') 100)
-- False

{- Ejercicio 2 -}

filtrar_patentes :: [Matricula] -> Numeracion -> [Matricula]
filtrar_patentes [] n = []
filtrar_patentes (Patente letras numeracion:ps) n
                                                    | numeracion == n = (Patente letras numeracion):filtrar_patentes ps n
                                                    | otherwise = filtrar_patentes ps n
ejpttes :: [Matricula]
ejpttes =  [(Patente ('A','B','C') 100),(Patente ('C','D','E') 200)]
-- ghci> filtrar_patentes [(Patente ('A','B','C') 100),(Patente ('C','D','E') 200)] 200
-- [Patente ('C','D','E') 200]

{- Ejercicio 3 -}
type Titular = String
data Estado = SinDeuda | ConDeuda
data Registro = AgregaReg Matricula Estado Titular Registro | SinRegs
equiv ::Estado -> Estado -> Bool
equiv SinDeuda SinDeuda = True
equiv ConDeuda ConDeuda = True
equiv _ _ = False


consulta :: Registro -> Titular -> Estado -> [Matricula]
consulta SinRegs ti ei = []
consulta (AgregaReg mat est tit rs) ti ei
                                            | tit == ti && equiv est ei = mat:consulta rs ti ei  
                                            | otherwise = consulta rs ti ei 


ejemploreg :: Registro
ejemploreg = AgregaReg (Patente ('A','X','Z') 130) SinDeuda "Juan" 
            (AgregaReg (Patente ('C','V','A') 400) ConDeuda "Jaime" SinRegs)

-- ghci> consulta ejemploreg "Jaime" SinDeuda
-- []
-- ghci> consulta ejemploreg "Jaime" ConDeuda
-- [Patente ('C','V','A') 400]