module Main where

import           Codec.Crypto.RSA
import           Crypto.Random
import           Crypto.Random.DRBG
import           Data.Binary
import qualified Data.ByteString.Lazy as BS
import           Numeric (showHex)
import           System.Environment (getArgs)
import           System.IO (hPutStrLn, stderr)

toHex :: (Binary a) => a -> String
toHex = concat . map (flip showHex "") . BS.unpack . encode

main :: IO ()
main = do
  args <- getArgs
  let size = case args of (s:_) -> read s
                          _     -> 1024
  hPutStrLn stderr ("Generating key pair of size " ++ show size)
  (pub, priv) <- genPair size
  putStrLn ("pub: " ++ toHex pub)
  putStrLn ("priv: " ++ toHex priv)

genPair :: Int -> IO (PublicKey, PrivateKey)
genPair size = go `fmap` (newGenIO :: IO HashDRBG)
  where go g = let (pub, priv, _) = generateKeyPair g size in (pub, priv)
