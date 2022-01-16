{-# LANGUAGE OverloadedStrings #-}


module GetToken where
import Common

import Prelude hiding (readFile)
import Data.Text 
import Data.Char
import Data.Text.IO
import Data.Attoparsec.Text