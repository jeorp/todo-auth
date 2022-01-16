{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE OverloadedLabels           #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TypeOperators              #-}

module Common where
import qualified Data.Text as T
import Data.Extensible
import Data.Time.Clock (UTCTime)

configFile = "config.env"

type Todo = Record 
 '[
    "id" >: Int,
    "created_at" >: UTCTime,
    "updated_at" >: UTCTime,
    "term" >: UTCTime,
    "title" >: T.Text,
    "done" >: Bool,
    "detail" >: T.Text
  ]
