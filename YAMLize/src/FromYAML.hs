{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import Control.Monad ((>=>))
import qualified Data.Aeson as Json
import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy.Char8 as BSL
import Data.Maybe (fromJust)
import qualified Data.Yaml as Yaml

main = do
  contents <- BS.getContents
  let value :: Yaml.Value = fromJust (Yaml.decode contents)
  BSL.putStrLn (Json.encode value)
