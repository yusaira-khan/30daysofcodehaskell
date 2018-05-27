
import Control.Applicative
import Control.Monad
import System.IO
import Data.List


pairToList :: (a, a) -> [a]
pairToList (x,y) = [x,y]

isEvenIndex :: (Int ,y) -> Bool
isEvenIndex (x,y) = even x

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret  

solveAll :: [String] -> [String]
solveAll ns = map solve ns

solve :: String -> String
solve n_temp = do
    let enum_ntemp = zip [0..] n_temp
    let pair = partition isEvenIndex enum_ntemp
    let nlist = pairToList pair
    let names = intercalate " " $ map (\i -> (map snd i)) nlist
    names

main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    let line = getMultipleLines n
    let bleh = liftM solveAll line
    bleh2 <- bleh
    let bleh3 = intercalate "\n" bleh2
    
    putStrLn bleh3
