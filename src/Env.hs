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
     "auth" >: T.Text,
     "name" >: T.Text,
     "user_id" >: T.Text
   ]

instance ToJWT User
instance FromJWT User