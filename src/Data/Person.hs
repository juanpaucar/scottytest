{-# LANGUAGE DeriveGeneric #-}

module Data.Person where

import GHC.Generics (Generic)
import Data.Aeson (ToJSON, FromJSON)

data Person = Person { id   :: String
                     , name :: String
                     , age  :: Int
                     , kids :: [Person]
                     } deriving (Show, Generic)

instance ToJSON Person

instance FromJSON Person
