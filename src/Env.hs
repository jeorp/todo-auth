{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase                 #-}
{-# LANGUAGE OverloadedLabels           #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TypeOperators              #-}

module Env where
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