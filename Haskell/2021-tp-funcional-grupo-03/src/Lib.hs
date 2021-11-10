module Lib where
import Data.Char
import Data.List
import Text.Show.Functions

data Tablero = Tablero { celdas :: [Celda],
                         cabezal :: Posicion,
                         filas :: Int,
                         columnas :: Int
} deriving (Show, Eq) 


data Celda = Celda {
    posicion :: Posicion,
    listaBolitas :: [Bolita]
} deriving (Show, Eq)

data PuntoCardinal = Norte | Sur | Este | Oeste deriving (Show, Eq)

data Bolita = Rojo | Azul | Verde | Negro deriving (Show,Eq)

type Sentencia = (Tablero -> Tablero)

type Condicion = (Tablero -> Bool)

type Posicion = (Int,Int)


posiciones :: Int -> Int ->[Posicion]
posiciones cantidadFilas cantidadColumnas = [(x, y) | x<-[1..cantidadFilas], y<-[1..cantidadColumnas] ]  

generarCelda :: Posicion -> Celda
generarCelda unaPosicion = Celda unaPosicion []

generarListaDeCeldas :: Int -> Int -> [Celda]
generarListaDeCeldas cantidadFilas cantidadColumnas = map generarCelda (posiciones cantidadFilas cantidadColumnas)

generarTablero :: Int -> Int -> Tablero
generarTablero cantidadFilas cantidadColumnas = Tablero (generarListaDeCeldas cantidadFilas cantidadColumnas) (1,1) cantidadFilas cantidadColumnas

primerElementoCabezal :: Tablero -> Int
primerElementoCabezal = fst . cabezal

segundoElementoCabezal :: Tablero ->Int
segundoElementoCabezal = snd . cabezal

cambiarPosicion :: PuntoCardinal -> Posicion -> Posicion
cambiarPosicion puntoCardinal (unaFila ,unaColumna)
 | puntoCardinal == Norte = (unaFila + 1, unaColumna)
 | puntoCardinal == Sur = (unaFila - 1, unaColumna)
 | puntoCardinal == Este = (unaFila, unaColumna + 1)
 | puntoCardinal == Oeste = (unaFila, unaColumna - 1)

mover :: PuntoCardinal -> Tablero -> Tablero 
mover unPuntoCardinal unTablero
  | not . puedeMoverse unPuntoCardinal $ unTablero = error "El cabezal se cayó del tablero"
  | otherwise = cambiarPuntoCardinal (cambiarPosicion unPuntoCardinal) unTablero

cambiarPuntoCardinal :: (Posicion -> Posicion) -> Tablero -> Tablero
cambiarPuntoCardinal unaFuncion unTablero = unTablero { cabezal = unaFuncion (cabezal unTablero)}

buscarCeldaActualEnLista :: [Celda] -> Posicion -> Celda
buscarCeldaActualEnLista listaDeCeldas unCabezal
  | unCabezal == (posicion . head $ listaDeCeldas) = head listaDeCeldas 
  | otherwise = buscarCeldaActualEnLista (tail listaDeCeldas) unCabezal 

buscarCeldaActual :: Tablero -> Celda
buscarCeldaActual unTablero = buscarCeldaActualEnLista (celdas unTablero) (cabezal unTablero)

listaDeCeldasSinActual :: Tablero -> [Celda]
listaDeCeldasSinActual unTablero = filter ((/=) . buscarCeldaActual $ unTablero) (celdas unTablero)

modificarCeldaActual :: (Celda -> Celda) -> Tablero -> Tablero
modificarCeldaActual unaFuncion unTablero = unTablero {celdas = unaFuncion (buscarCeldaActual unTablero) : (listaDeCeldasSinActual unTablero)} 

modificarBolitas :: ([Bolita]->[Bolita]) -> Celda -> Celda
modificarBolitas unaFuncion unaCelda = unaCelda {listaBolitas = unaFuncion (listaBolitas unaCelda)}

--PONER UNA BOLITA

poner :: Bolita -> Tablero ->Tablero
poner = modificarCeldaActual . modificarBolitas . (:) 

-- SACAR UNA BOLITA

sacar :: Bolita ->Tablero ->Tablero
sacar unaBolita unTablero
  | not  (hayBolitas unaBolita unTablero) = error ("No hay bolitas de color " ++ (show unaBolita))
  | otherwise = (modificarCeldaActual . modificarBolitas . delete) unaBolita unTablero

-- REPETIR

repetir :: Int -> [Sentencia] -> Tablero -> Tablero 
repetir cantidadDeVeces unasSentencias unTablero = (!!) (iterate (programa unasSentencias) unTablero) cantidadDeVeces

-- ALTERNATIVA

aplicarSentencia :: Tablero -> Sentencia -> Tablero
aplicarSentencia unTablero unaSentencia = unaSentencia unTablero

alternativa :: Condicion -> [Sentencia] -> [Sentencia] -> Tablero -> Tablero
alternativa unaCondicion sentencias1 sentencias2 unTablero
  | unaCondicion unTablero = programa sentencias1 unTablero 
  | otherwise = programa sentencias2 unTablero

si :: Condicion -> [Sentencia] -> Tablero -> Tablero
si unaCondicion unaSentencia unTablero = alternativa unaCondicion unaSentencia [] unTablero 

siNo :: Condicion -> [Sentencia] -> Tablero -> Tablero
siNo unaCondicion unaSentencia unTablero = alternativa unaCondicion [] unaSentencia unTablero 

mientras :: Condicion -> [Sentencia] -> Tablero -> Tablero
mientras unaCondicion unaSentencia unTablero 
  | unaCondicion unTablero = unTablero
  | otherwise = mientras unaCondicion unaSentencia (programa unaSentencia unTablero)


irAlBorde :: PuntoCardinal -> Tablero -> Tablero 
irAlBorde unPuntoCardinal unTablero = mientras (puedeMoverse unPuntoCardinal) [mover unPuntoCardinal] unTablero

-- Punto 5

puedeMoverse :: PuntoCardinal -> Tablero -> Bool
puedeMoverse unPuntoCardinal unTablero 
  | unPuntoCardinal == Norte = primerElementoCabezal unTablero /= filas unTablero 
  | unPuntoCardinal == Sur = primerElementoCabezal unTablero /= 1 
  | unPuntoCardinal == Oeste = segundoElementoCabezal unTablero /= 1 
  | unPuntoCardinal == Este = segundoElementoCabezal unTablero /= columnas unTablero 


hayBolitas :: Bolita -> Tablero -> Bool
hayBolitas unaBolita unTablero = (> 0) . (cantidadDeBolitas unaBolita) $ unTablero  

cantidadDeBolitas :: Bolita -> Tablero -> Int 
cantidadDeBolitas unaBolita unTablero =  length . filter (==unaBolita) $ (listaBolitas . buscarCeldaActual $ unTablero)

--Punto 6

programa :: [Sentencia] -> Tablero -> Tablero 
programa unaSentencia unTablero = foldl aplicarSentencia unTablero unaSentencia

--Punto 7

sentenciasDeGobstones :: [Sentencia]
sentenciasDeGobstones = [mover Norte, poner Negro, poner Negro, poner Azul, mover Norte, repetir 15 [poner Rojo, poner Azul], alternativa (hayBolitas Verde) [mover Este, poner Negro] [mover Sur, mover Este, poner Azul], mover Este, mientras ((>9).(cantidadDeBolitas Verde)) [poner Verde], poner Azul]

realizarProgramaGobstones :: Tablero
realizarProgramaGobstones = programa sentenciasDeGobstones (generarTablero 3 3)                                                   