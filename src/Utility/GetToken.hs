{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE OverloadedLabels           #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TypeOperators              #-}

module Utility.GetToken where
import Env

import Prelude hiding (readFile)
import Data.Text 
import Data.Char
import Data.Text.IO
import Data.Attoparsec.Text

import Data.Proxy
import Data.Extensible

configFile = "config.env"

class ParseRecord a where
  parseRecord :: Proxy a -> Parser a


