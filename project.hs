module Project where

    import Data.Char;

    multiple :: Int
    multiple = 2
    
    adder :: Int
    adder = 5
    
    modder :: Int
    modder = 127
    
    encodeInt :: Int -> Int
    encodeInt i = ((multiple * i) + adder) `mod` modder
        
    decodeInt :: Int -> Int
    decodeInt i = ((i+modder-adder) `div` multiple) `mod` modder
    
    encodeChar :: Char -> Int
    encodeChar c = ord c
    
    decodeChar :: Int -> Char
    decodeChar i = chr i
    
    encode :: Char -> Int
    encode c = encodeInt (encodeChar c)
    
    decode :: Int -> Char
    decode i = decodeChar (decodeInt i)
    
    encodeString :: [Char] -> [Int]
    encodeString [] = []
    encodeString [c] = encode c:[]
    encodeString (c:cs) = encode c : encodeString cs
    
    decodeString :: [Int] -> [Char]
    decodeString [] = []
    decodeString [n] = decode n:[]
    decodeString (n:ns) = decode n : decodeString ns
    
    