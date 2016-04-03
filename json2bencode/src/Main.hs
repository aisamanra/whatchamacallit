{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Data.Aeson
import           Data.BEncode
import           Data.ByteString.Lazy (ByteString, fromStrict)
import qualified Data.ByteString.Lazy.Char8 as BS
import qualified Data.HashMap.Strict as HM
import qualified Data.Map.Lazy as M
import           Data.Scientific (isInteger)
import           Data.Text (Text, unpack)
import           Data.Text.Encoding (encodeUtf8)
import qualified Data.Vector as V
import           System.Environment (getArgs)
import           System.Exit (die)

byteify :: Text -> ByteString
byteify = fromStrict . encodeUtf8

convert :: Value -> Either String BEncode
convert (Object os) =
  (BDict . M.fromList) `fmap` mapM go (HM.toList os)
  where go (k, v) = (,) (unpack k) `fmap` convert v
convert (Array as) =
  BList `fmap` mapM convert (V.toList as)
convert (Number n)
  | isInteger n = return $ BInt (floor n)
  | otherwise   = Left ("Input contains a non-integer number: " ++ show n)
convert (String ts) =
  return $ BString (byteify ts)
convert (Bool b) = Left ("Input contains a boolean: " ++ show b)
convert (Null) = return $ BString ""

main :: IO ()
main = do
  content <- do
    args <- getArgs
    case args of
      []     -> BS.getContents
      ["-"]  -> BS.getContents
      [file] -> BS.readFile file
      _      -> die "Usage: json2bencode [file]"
  case decode content of
    Just val -> case convert val of
      Right bval -> BS.putStrLn (bPack bval)
      Left err   -> putStrLn err
    Nothing -> putStrLn "Unable to parse JSON"
