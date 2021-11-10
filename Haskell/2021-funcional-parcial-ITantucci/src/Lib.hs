module Lib where
import Data.Char
import Data.List
import Text.Show.Functions

data Persona = Persona { nombre :: String,
                         niveles :: Niveles

} deriving (Show, Eq)

type Niveles = (Int,Int,Int)

data Pocion = Pocion { nombrePocion:: String,
                receta :: [Cosa], --Cambie el tipo de Receta a lo ultimo
                efectosDePocion :: [Efecto]
}deriving (Show)

data Cosa = Cosa {gramos::Int,
                      elemento::String 
}deriving (Show)

type Efecto = Niveles ->Niveles

harry :: Persona 
harry = Persona "Harry Potter" (11,5,4)

ron ::Persona
ron = Persona "Ron Weasley" (6,4,6)

hermione :: Persona
hermione = Persona "Hermione Granger" (12,8,2)

felixFelices :: Pocion
felixFelices = Pocion "felixFelices" [Cosa 52 "Escarabajos Machacados",Cosa 2 "Ojo Tigre Sucio"] [f1,f2,f3]

multijugos :: Pocion
multijugos = Pocion "multijugos" [Cosa 10 "Cuerno Bicornio en Polvo", Cosa 4 "Sanguijuelas Hormonales"] [invertir3,f1,f2,duplicarNiveles,f3]

duplicarNiveles :: Efecto
duplicarNiveles (suerte,nivelDeConvencimiento,nivelDeFuera) = ((*2) suerte, (*2) nivelDeConvencimiento,(*2) nivelDeFuera)

sumaNiveles :: Niveles -> Int
sumaNiveles (suerte,nivelDeConvencimiento,nivelDeFuera) = suerte + nivelDeConvencimiento + nivelDeFuera

diferenciaNiveles :: Niveles -> Int
diferenciaNiveles unosNiveles  = subtract (minimoEntreTres unosNiveles) (maximoEntreTres unosNiveles)


maximoEntreTres :: Niveles -> Int
maximoEntreTres unosNiveles = max (max (fst3 unosNiveles) (snd3 unosNiveles)) (trd3 unosNiveles)

minimoEntreTres :: Niveles -> Int
minimoEntreTres unosNiveles = min (min (fst3 unosNiveles) (snd3 unosNiveles)) (trd3 unosNiveles)

sumaNivelesPersona :: Persona -> Int
sumaNivelesPersona  = sumaNiveles . niveles 

diferenciaNivelesPersona :: Persona -> Int
diferenciaNivelesPersona = diferenciaNiveles . niveles 


--Definir la función efectosDePocion, que recibe una poción y devuelve una lista con todos los efectos de cada uno de sus ingredientes. (Definida en el Data de pocion)

pocionesHeavies :: [Pocion] -> [String]
pocionesHeavies unaListaDePociones =map nombrePocion (filter tieneMasDe4Habilidades unaListaDePociones)

tieneMasDe4Habilidades :: Pocion -> Bool
tieneMasDe4Habilidades  = (>4) . length .  efectosDePocion 

incluyeA ::Eq a =>  [a]->[a]->Bool
incluyeA  unaLista = (/= []) . intersect unaLista


--esPocionMagica :: Pocion -> Bool
--esPocionMagica unaPocion = tieneTodasLasVocales (nombre unaPocion) && (take 1 (words (receta unaPocion)))

tomarPocion :: Pocion-> Persona-> Persona
tomarPocion unaPocion  = aplicar . efectosDePocion $ unaPocion

aplicar ::[Efecto] -> Persona -> Persona 
aplicar unosEfectos unaPersona = foldl aplicarEfecto unaPersona unosEfectos

aplicarEfecto :: Persona -> Efecto -> Persona
aplicarEfecto unaPersona unEfecto = mapNiveles unEfecto unaPersona

mapNiveles :: (Niveles->Niveles) -> Persona -> Persona
mapNiveles unaFuncion unaPersona = unaPersona { niveles = unaFuncion . niveles $ unaPersona }

esAntidoto :: Persona ->Pocion -> Pocion -> Bool
esAntidoto unaPersona unaPocion otraPocion = (tomarPocion unaPocion unaPersona) == (tomarPocion otraPocion unaPersona)

personaMasAfectada :: Pocion -> (Persona ->Int) -> [Persona] ->Persona
personaMasAfectada unaPocion unaPonderacion unaListaDePersonas | length unaListaDePersonas == 1 = head unaListaDePersonas
                                                               | (aplicarPocionYPonderacion unaPocion unaPonderacion (head unaListaDePersonas)) >= (aplicarPocionYPonderacion unaPocion unaPonderacion (head (tail unaListaDePersonas))) = personaMasAfectada unaPocion unaPonderacion (head unaListaDePersonas : (drop 1 (tail unaListaDePersonas)))
                                                               | otherwise = personaMasAfectada unaPocion unaPonderacion (drop 1 unaListaDePersonas)

personaMasAfectada' ::Pocion -> (Persona ->Int) -> ([Persona] ->Persona)
personaMasAfectada' pocion criterio = maximoSegun (criterio . tomarPocion pocion)

muiltiplicarDosTuplas :: (Int,Int,Int) -> Niveles -> Niveles
muiltiplicarDosTuplas (a,b,c) (suerte,nivelDeConvencimiento,nivelDeFuera) = (a * suerte, b * nivelDeConvencimiento, c * nivelDeFuera)


aplicarPocionYPonderacion :: Pocion ->(Persona ->Int)->Persona->Int
aplicarPocionYPonderacion unaPocion unaPonderacion unaPersona = unaPonderacion (tomarPocion unaPocion unaPersona)


--superPocion :: [String] ->  Pocion
--superPocion listaDeIngredientes = Pocion "SuperPocion" (generarListaDeIngredientes listaDeIngredientes) []


--generarListaDeIngredientes :: [String] -> [Receta]
--generarListaDeIngredientes listaDeIngredientes | length listaDeIngredientes == 1 = ["1 Gramo de " ++ (head listaDeIngredientes)]
   --                                            | otherwise =map ("1 Gramo de") map ("Gramos de" ++) (tail listaDeIngredientes)




--Funciones
f1 (ns, nc, nf) = (ns + 1, nc + 2, nf + 3)
f2 (ns, nc, nf) = (ns, nc, nf + 5)
f3 (ns, nc, nf) = (ns, nc, nf - 3)
invertir3 (a, b, c) = (c, b, a)
sinRepetidos [] = []
sinRepetidos (x:xs) = x : filter (/= x) (sinRepetidos xs)
misPociones = [felixFelices, multijugos]
fst3 (a,_,_) = a
snd3 (_,b,_) = b
trd3 (_,_,c) = c
maxSegun f x y | f x > f y = x
               | otherwise = y

maximoSegun f xs = foldl1 (maxSegun f) xs
