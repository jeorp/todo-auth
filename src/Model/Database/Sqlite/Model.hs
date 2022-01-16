{-# LANGUAGE TemplateHaskell, DataKinds, FlexibleContexts #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}

module Model.Database.Sqlite.Model where
import Data.Extensible
import Lens.Micro
import Data.Proxy
import GHC.TypeLits
import Database.SQLite.Simple.FromRow (field, FromRow(..)) 
import Database.SQLite.Simple.FromField (FromField)

instance Forall (KeyTargetAre KnownSymbol FromField) xs => FromRow (Record xs) where
  fromRow =  hgenerateFor (Proxy :: Proxy (KeyTargetAre KnownSymbol FromField)) (const $ Field . pure <$> field)