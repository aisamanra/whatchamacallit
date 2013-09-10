module Main where

import           Codec.Crypto.RSA
import           Crypto.Random
import           Crypto.Random.DRBG
import           Data.Binary
import qualified Data.ByteString.Lazy as BS
import           Numeric (showHex)

toHex :: (Binary a) => a -> String
toHex = concat . map (flip showHex "") . BS.unpack . encode

main :: IO ()
main = do
  (pub, priv) <- genPair
  putStrLn ("pub: " ++ toHex pub)
  putStrLn ("priv: " ++ toHex priv)

genPair :: IO (PublicKey, PrivateKey)
genPair = go `fmap` (newGenIO :: IO HashDRBG)
  where go g = let (pub, priv, _) = generateKeyPair g 1024 in (pub, priv)
