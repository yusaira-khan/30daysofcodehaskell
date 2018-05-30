{-# LANGUAGE FlexibleInstances, UndecidableInstances, DuplicateRecordFields #-}

module Day112DArrays (
solve
) where

import Control.Monad
import Data.Array
import Data.Bits
import Data.List
import Data.List.Split
import Data.Set
import Debug.Trace
import System.Environment
import System.IO
import System.IO.Unsafe



readMultipleLinesAsStringList :: Int -> IO [String]
readMultipleLinesAsStringList 0 = return []
readMultipleLinesAsStringList n = 
    getLine  >>= \line ->  
    fmap (line:) $ readMultipleLinesAsStringList (n - 1) 
    

getHourGlasses :: [[Int]] -> [[Int]] -> [[[Int]]]
getHourGlasses resetStack (a:b:[]) = 
    []  
getHourGlasses resetStack ((a0:a1:[]):(b0:b1:[]):(c0:c1:[]):rest)  =
    getHourGlasses (resetStack++rest) []
getHourGlasses resetStack ((a0:a1:a2:ar):
                    b@(b0:b1:b2:br):
                    c@(c0:c1:c2:cr):
                rest) =
    let resetStackNew = (if  resetStack == [] then [b,c] else resetStack)
    in [[a0,a1,a2],[b1],[c0,c1,c2]]:
    (getHourGlasses resetStackNew ((a1:a2:ar):(b1:b2:br):(c1:c2:cr):rest))


putHourGlass :: [[[Int]]] -> IO()
putHourGlass [] = 
    putStrLn ""
putHourGlass ([[a0,a1,a2],[b1],[c0,c1,c2]]:r) =
    putStr ( show a0 )>>
    putStr " " >>
    putStr ( show a1 )>>
    putStr " " >>
    putStrLn (show a2)>>
    putStr "  " >>
    putStr ( show b1 )>>
    putStrLn "  " >>
    putStr ( show c0 )>>
    putStr " " >>
    putStr ( show c1 )>>
    putStr " " >>
    putStrLn ( show c2 ) >>
    putStrLn "" >>
    putHourGlass r

getSumOfEachHourGlass :: [[Int]] -> [Int]
getSumOfEachHourGlass arr = 
    fmap (Data.List.foldr (+) 0 . concat) $ getHourGlasses [] arr
    


solve :: IO()
solve = 
    readMultipleLinesAsStringList 6 >>= (\ arrTemp -> 
    let arr = Data.List.map (\x -> Data.List.map (read :: String -> Int) . words $ x) arrTemp
    in putStrLn(show (Data.List.maximum . getSumOfEachHourGlass $ arr)))

-- putStrLn (show hG) >>
--     putStrLn (show hGFlat) >> 
--     putHourGlass hG >> 
--     putStrLn(show (length hG)) >>
--     putStrLn(show (hgSum)) >>
    