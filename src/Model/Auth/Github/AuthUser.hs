{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase                 #-}
{-# LANGUAGE OverloadedLabels           #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TypeOperators              #-}

module Model.Auth.Github.AuthUser where

import Control.Monad.IO.Class (MonadIO, liftIO)
import Data.Aeson (FromJSON, ToJSON, toJSON)
import Data.ByteString (ByteString)
import Data.Extensible
import Data.String (IsString (..))
import Lens.Micro ((&), (.~), (?~), (^.))
import qualified Network.Wreq as W

baseUrl = "https://github.com/"

type GithubUser = Record
  '[ "login" >: String,
     "id" >: String, 
     "email" >: Maybe String
   ]