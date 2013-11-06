module Main where

import Data.Aeson (Value(String), encode)
import Data.ByteString.Lazy.Char8 (putStrLn)
import Data.Text.IO (getContents)
import Prelude hiding (getContents, putStrLn)

main = getContents >>= putStrLn . encode . String
