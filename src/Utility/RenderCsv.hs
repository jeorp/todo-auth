{-# LANGUAGE TemplateHaskell, DataKinds, FlexibleContexts #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}
module Utility.RenderCsv where

import Data.Csv (ToField, FromField, ToNamedRecord, FromNamedRecord, 
                  toNamedRecord, parseNamedRecord, (.:), (.=))
import Data.Extensible
import Data.Proxy
import GHC.TypeLits
import Data.String
import qualified Data.ByteString as B

instance Forall (KeyTargetAre KnownSymbol FromField) xs => FromNamedRecord (Record xs) where
  parseNamedRecord r = hgenerateFor (Proxy :: Proxy (KeyTargetAre KnownSymbol FromField)) $ 
    \m -> let k = symbolVal (proxyKeyOf m) in Field . pure <$> r .: fromString k

instance Forall (KeyTargetAre KnownSymbol ToField) xs => ToNamedRecord (Record xs) where
  toNamedRecord r = undefined