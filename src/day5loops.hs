main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    let nstr = show n ++ " x "
    mapM_ (\i -> putStrLn $ nstr ++ show i ++ " = " ++ (show $ i*n)) [1..10]
