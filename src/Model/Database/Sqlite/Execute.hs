{-# LANGUAGE OverloadedStrings #-}

module Model.Database.Sqlite.Execute where

import qualified Data.Text as T
import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow
import Model.Database.Sqlite.Model