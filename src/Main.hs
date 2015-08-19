{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Data.Text.Lazy (pack)
import System.Environment
import Control.Monad

import Data.Person

main :: IO ()
main = do
  port <- liftM read $ getEnv "PORT"    
  scotty port $ do
    let c = Person "1234560987" "Cris" 99 [Person "000000000000" "Justin" 10 []]
    get "/" $ do
      json [c, c]

    delete "/" $ do
      text "deleted!"

    post "/" $ do
      myPerson <- jsonData
      text $ pack $ name myPerson

    put "/" $ do
      text "put-ted!"
