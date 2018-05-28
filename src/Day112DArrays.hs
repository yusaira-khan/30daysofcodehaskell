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
    getLine  >>= (\ line ->  
    readMultipleLinesAsStringList (n - 1) >>= (\ rest ->
    return (line : rest) ))

getHourGlasses :: [[Int]] -> [[Int]] -> [[[Int]]]
getHourGlasses (a:b:[]) acc= 
    []  
getHourGlasses ((a0:a1:[]):(b0:b1:[]):(c0:c1:[]):r) acc =
    getHourGlasses (acc++r) []
getHourGlasses ((a0:a1:a2:ar):b@(b0:b1:b2:br):c@(c0:c1:c2:cr):r) acc =
    let accNew = (if  acc == [] then [b,c] else acc)
    in 
    [[a0,a1,a2],[b1],[c0,c1,c2]]:(getHourGlasses ((a1:a2:ar):(b1:b2:br):(c1:c2:cr):r) accNew)


putHourGlass :: [[[Int]]] -> IO()
putHourGlass [] = 
    putStrLn ""
putHourGlass ([[a0,a1,a2],[b1],[c0,c1,c2]]:r) =
    putStr ( show a0 )>>
    putStr " " >>
    putStr ( show a1 )>>
    putStr " " >>
    putStrLn ( show a2 )>>
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
-- utHourGlass b =
--   putStrLn $ show b


solve :: IO()
solve = 
    readMultipleLinesAsStringList 6 >>= (\ arrTemp -> 
    let arr = Data.List.map (\x -> Data.List.map (read :: String -> Int) . words $ x) arrTemp
    in let hG = getHourGlasses arr []
    in let hGFlat = Data.List.map concat hG:: [[Int]]
    in let hgSum =  Data.List.map (Data.List.foldr (+) 0) hGFlat :: [Int]
    in let hgSumMax = Data.List.maximum hgSum
    in putStrLn(show (hgSumMax)))

-- putStrLn (show hG) >>
--     putStrLn (show hGFlat) >> 
--     putHourGlass hG >> 
--     putStrLn(show (length hG)) >>
--     putStrLn(show (hgSum)) >>
    