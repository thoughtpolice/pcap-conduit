-- |
-- Module      : Network.Pcap.Conduit
-- Copyright   : (c) Austin Seipp 2012
-- License     : BSD3
--
-- Maintainer  : mad.one@gmail.com
-- Stability   : experimental
-- Portability : GHC probably
--
-- This package provides conduit 'Sources' for pcap data ( captured by
-- wireshark, tcpdump, etc.) You can enumerate pcap files and live
-- interfaces.
--
-- Based on @pcap-enumerator@.
--
module Network.Pcap.Conduit
       ( Packet        -- :: *
       , sourceOffline -- :: MonadIO m => FilePath -> Source m Packet
       , sourceLive    -- :: MonadIO m => String -> Int -> Bool -> Int64 -> Source m Packet
       ) where

import Control.Monad.IO.Class (liftIO, MonadIO)
import Data.ByteString (ByteString)
import Data.Conduit (Source, yield)
import Data.Int (Int64)
import Network.Pcap

-- | Convenient alias.
type Packet = (PktHdr, ByteString)

-- | Create a conduit 'Source' from a pcap data file.
sourceOffline :: MonadIO m => FilePath -> Source m Packet
sourceOffline path = (liftIO $ openOffline path) >>= sourcePcap1

-- | Create a conduit 'Source' from a live interface.
sourceLive :: MonadIO m
           => String -- ^ Device name
           -> Int    -- ^ Snapshot length in bytes
           -> Bool   -- ^ Promiscuous mode?
           -> Int64  -- ^ Timeout (in microseconds)
           -> Source m Packet
sourceLive n s p t = (liftIO $ openLive n s p t) >>= sourcePcap1

sourcePcap1 :: MonadIO m => PcapHandle -> Source m Packet
sourcePcap1 h = do
  pkt@(hdr,_) <- liftIO (nextBS h)
  if (hdrCaptureLength hdr == 0)
    then return ()
    else yield pkt >> sourcePcap1 h
