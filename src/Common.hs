{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE OverloadedLabels           #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TypeOperators              #-}
{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeApplications  #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

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


instance Forall (KeyTargetAre KnownSymbol FromHttpApiData) xs 
    => FromForm (Record xs) where
  fromForm form = hgenerateFor (Proxy @ (KeyTargetAre KnownSymbol FromHttpApiData)) 
    $ \m -> let k = stringKeyOf m in Field <$> parseUnique k form
