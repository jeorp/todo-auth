{-# LANGUAGE TemplateHaskell, DataKinds, FlexibleContexts #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}
module Utility.RenderCsv where

import Data.Csv (ToField, FromField, ToNamedRecord, FromNamedRecord, 
                  toNamedRecord, parseNamedRecord, (.:), (.=))
import Data.Extensible
import qualified Data.ByteString as B

instance Forall (KeyTargetAre KnownSymbol FromField) xs => FromNamedRecord (Record xs) where
  parseNamedRecord r = undefined

instance Forall (KeyTargetAre KnownSymbol ToField) xs => ToNamedRecord (Record xs) where
  toNamedRecord r = undefined