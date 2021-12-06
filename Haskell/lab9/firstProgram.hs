
main :: IO ()

main = do
    putStrLn "Hello"
    name <- getLine
    putStrLn ("Hello " ++ name)
