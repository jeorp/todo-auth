{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase                 #-}
{-# LANGUAGE OverloadedLabels           #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TypeOperators              #-}

module Env where
import Data.Extensible
import Servant.Auth.Server (FromJWT, ToJWT)

type User = Record
  '[ 
     "auth" >: String,
     "name" >: String,
     "id" >: String
   ]

instance ToJWT User
instance FromJWT User