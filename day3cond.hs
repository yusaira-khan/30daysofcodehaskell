
import Control.Applicative
import Control.Monad
import System.IO


data Weirdness = Weird | NotWeird 
instance Show Weirdness where 
    show Weird = "Weird" 
    show NotWeird = "Not Weird" 

isWeird :: Int -> Weirdness
isWeird x 
    | odd x = Weird
    | x < 6 = NotWeird
    | x <= 20 = Weird
    | otherwise = NotWeird
main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    putStrLn $ show $ isWeird n
        
        

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret   
