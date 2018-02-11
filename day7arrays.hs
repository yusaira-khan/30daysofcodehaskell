import System.IO
import Data.List
main :: IO ()
main = do
    -- n_temp <- getLine
    let n_temp="2"
    let n = read n_temp :: Int
    -- arr_temp <- getLine
    let arr_temp = "1 4 3 2"
    let arr = words arr_temp
    let rarr = intercalate " " $reverse arr
    putStrLn rarr
