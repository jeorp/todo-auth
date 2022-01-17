{-# LANGUAGE TemplateHaskell, DataKinds, FlexibleContexts #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeApplications  #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE PolyKinds #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE CPP                   #-}
{-# LANGUAGE ScopedTypeVariables   #-}

module Utility.RenderCsv where

import Data.Csv (ToField, FromField, ToNamedRecord, FromNamedRecord, 
                  toNamedRecord, parseNamedRecord, (.:), (.=), NamedRecord)
import Control.Applicative
import Data.Constraint
import Data.Extensible
import Data.Proxy
import GHC.TypeLits
import Data.Monoid
import Data.Functor.Const
import Control.Monad.Identity
import qualified Data.HashMap.Strict as HM
import Data.String
import qualified Data.ByteString as B

instance Forall (KeyTargetAre KnownSymbol FromField) xs => FromNamedRecord (Record xs) where
  parseNamedRecord r = hgenerateFor (Proxy @ (KeyTargetAre KnownSymbol FromField)) $ 
    \m -> let k = symbolVal (proxyKeyOf m) in Field . pure <$> r .: fromString k

{- can not compile (; ;)
instance Forall (KeyTargetAre KnownSymbol ToField) xs => ToNamedRecord (Record xs) where
  toNamedRecord _ = HM.fromList . flip appEndo mempty . getConst . hgenerateFor (Proxy @ (KeyTargetAre KnownSymbol FromField)) $
    \m -> let k = symbolVal (proxyKeyOf m) in Field . pure <$> Const $ Endo ((fromString k .= proxyTargetOf m):)
-}


instance Forall (KeyTargetAre KnownSymbol ToField) xs => ToNamedRecord  (Record xs) where
  toNamedRecord = HM.fromList . flip appEndo [] . hfoldMap getConst . hzipWith
    (\(Comp Dict) -> Const . Endo . (:) .
      liftA2 (.=) (fromString . symbolVal . proxyKeyOf) (runIdentity . getField))
    (library :: xs :& Comp Dict (KeyTargetAre KnownSymbol ToField))