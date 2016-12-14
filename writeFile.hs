module WriteFile where

    import System.IO
    import ReadFile
    import Data.Char

    writeMain1 :: FilePath -> FilePath -> IO ()
    writeMain1 fpIn fpOut = do
        contents <-readString fpIn
        writeFile fpOut (map toUpper contents)
