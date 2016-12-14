module ReadFile where

    import System.IO

    main1 :: FilePath -> IO ()
    main1 fp = do
        handle <- openFile fp ReadMode
        contents <- hGetContents handle
        putStr contents
        hClose handle
    
    main2 :: FilePath -> IO ()
    main2 fp = do
        withFile fp ReadMode (\handle -> do
            contents <- hGetContents handle
            putStr contents)
    
    --bracket :: IO a -> (a -> IO b) -> (a -> IO c) -> IO c

    --withFile' :: FilePath -> IOMode -> (Handle -> IO a) -> IO a
    --withFile' name mode f = bracket (openFile name mode)
    --    (\handle -> hClose handle)
    --    (\handle -> f handle)

    main3 :: FilePath -> IO ()
    main3 fp = do
        contents <- readFile fp
        putStr contents

    readString :: FilePath -> IO String
    readString fp = do
        contents <- readFile fp
        return contents

    main4 :: FilePath -> IO ()
    main4 fp = do
        str <- readString fp
        putStr str
         