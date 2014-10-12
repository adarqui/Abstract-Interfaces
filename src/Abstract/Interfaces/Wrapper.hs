{-# LANGUAGE DeriveGeneric #-}
module Abstract.Interfaces.Wrapper (
 HostDataWrapper (..)
) where

import GHC.Generics

data HostDataWrapper a = HostDataWrapper {
 h :: String,
 d :: a
} deriving (Show, Read, Generic)
