{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE OverloadedLabels           #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TypeOperators              #-}

module Utility.GetToken where
import Env

import Prelude hiding (readFile)
import qualified Data.ByteString as B
import Data.Text 
import Data.Char
import Data.Text.IO
import Data.Attoparsec.Text

import Data.Proxy
import GHC.TypeLits
import Data.Extensible

configFile = "config.env"


class MakeRec kv where
  make :: proxy kv -> Parser (TargetOf kv)

instance MakeRec ("discord_client_id" :> B.ByteString) where
  make _ = pure ""

instance MakeRec ("discord_client_secret" :> B.ByteString) where
  make _ = pure ""

instance MakeRec ("github_client_id" :> B.ByteString) where
  make _ = pure ""

instance MakeRec ("github_client_secret" :> B.ByteString) where
  make _ = pure ""

instance MakeRec ("google_client_id" :> B.ByteString) where
  make _ = pure ""

instance MakeRec ("google_client_secret" :> B.ByteString) where
  make _ = pure ""

instance MakeRec ("twitter_client_id" :> B.ByteString) where
  make _ = pure ""

instance MakeRec ("twitter_client_secret" :> B.ByteString) where
  make _ = return ""

parseTokens :: Parser Tokens
parseTokens = hgenerateFor (Proxy :: Proxy MakeRec) (\m -> Field . pure <$> make m)

