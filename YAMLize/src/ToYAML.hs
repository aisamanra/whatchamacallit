{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import Control.Monad ((>=>))
import qualified Data.Aeson as Json
import qualified Data.ByteString.Char8 as BS
import qualified Data.ByteString.Lazy.Char8 as BSL
import Data.Maybe (fromJust)
import qualified Data.Yaml as Yaml

main = do
  contents <- BSL.getContents
  let value :: Yaml.Value = fromJust (Json.decode contents)
  BS.putStrLn (Yaml.encode value)
