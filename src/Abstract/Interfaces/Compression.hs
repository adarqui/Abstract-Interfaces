module Abstract.Interfaces.Compression (
 Compression (..)
) where

class Compression a where
 compress :: a -> Either String a 
 compressFile :: String -> IO (Either String a)
 decompress :: a -> Either String a
 decompressFile :: String -> IO (Either String a)
