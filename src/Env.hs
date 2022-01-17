{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase                 #-}
{-# LANGUAGE OverloadedLabels           #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TypeOperators              #-}

module Env where
import Data.ByteString (ByteString) 
import qualified Data.Text as T
import Data.Extensible
import Servant.Auth.Server (FromJWT, ToJWT)

type User = Record
  '[ 
     "user_id_const" >: Int,
     "auth_method" >: T.Text,
     "user_name" >: T.Text
   ]

instance ToJWT User
instance FromJWT User



type TokensFields =
 '[
    "discord_client_id" >: ByteString,
    "discord_client_secret" >: ByteString,
    "github_client_id" >: ByteString, 
    "github_client_secret" >: ByteString,
    "google_client_id" >: ByteString, 
    "google_client_secret" >: ByteString,
    "twitter_client_id" >: ByteString, 
    "twitter_client_secret" >: ByteString

  ]

type Tokens = Record TokensFields

