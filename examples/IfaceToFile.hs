module Main
       ( main -- :: IO ()
       ) where

import System.Environment (getArgs)
import Control.Applicative

import Data.Conduit
import Data.Conduit.List as CL
import Data.Conduit.Binary

import Control.Monad.Trans.Resource

import Network.Pcap.Conduit

main :: IO ()
main = do
  [i] <- getArgs
  runResourceT $ sourceLive i 1024 False (10*1000000) $= CL.map snd
              $$ sinkFile (i++".txt")
