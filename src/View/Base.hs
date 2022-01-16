{-# LANGUAGE OverloadedStrings #-}

module View.Base where

import Lucid
import qualified Data.Text as T 

header :: Html ()
header = do
  header_ $ do
    meta_ [charset_ "utf-8"]
    meta_ [name_ "viewport", content_ "width=device-width, initial-scale=1, shrink-to-fit=no"]
    link_ 
     [
        rel_ "stylesheet", 
        href_ "https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css",
        integrity_ "sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk",
        crossorigin_ "anonymous"
     ]

cdnScripts :: Html ()
cdnScripts = do
  script_ 
    [
      src_ "https://code.jquery.com/jquery-3.5.1.slim.min.js",
      integrity_ "sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj",
      crossorigin_ "anonymous"
    ] T.empty
  script_ 
    [
      src_ "https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js",
      integrity_ "sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo",
      crossorigin_ "anonymous"
    ] T.empty 
  script_ 
    [
      src_ "https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js",
      integrity_ "sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI",
      crossorigin_ "anonymous"
    ] T.empty


base :: Html() -> Html ()
base content = do
  doctype_
  html_ $ do
   header
   body_ $ do
     content
     cdnScripts