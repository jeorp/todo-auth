{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE OverloadedLabels           #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TypeOperators              #-}

module Common where
import Data.Proxy
import qualified Data.Text as T
import Servant.API
import Web.FormUrlEncoded (FromForm(..), parseUnique)
import Data.Extensible
import Data.Time.Clock (UTCTime)

type TodoFields =
 '[
    "todo_id" >: Int,
    "user_id" >: Int,
    "created_at" >: UTCTime,
    "updated_at" >: UTCTime,
    "term" >: UTCTime,
    "title" >: T.Text,
    "done" >: Bool,
    "detail" >: T.Text
  ]

type TodoFinishedFields =
 '[
     "history_id" >: Int,
     "is_finish" >: Bool,
     "finished_at" >: UTCTime
  ] ++ TodoFields

type Todo = Record TodoFields

type TodoFnished = Record TodoFinishedFields

instance FromForm (Record xs) where
  fromForm form = undefined
