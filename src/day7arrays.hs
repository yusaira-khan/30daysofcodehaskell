import System.IO
import Data.List
main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    arr_temp <- getLine
    let arr = words arr_temp
    let rarr = intercalate " " $reverse arr
    putStrLn rarr
