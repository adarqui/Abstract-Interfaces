{-# LANGUAGE DeriveDataTypeable, RecordWildCards #-}
module Abstract.Interfaces.Queue (
 Queue,
 QueueError (..),
 enqueue,
 enqueueBatch,
 dequeue,
 drain,
 size,
 destroy
) where


import Control.Exception
import Data.Typeable

data QueueError =
   CreateFailed
 | DestroyFailed
 | OperationFailed
 | Disassociated
 deriving (Show, Typeable)

instance Exception QueueError


data Queue m a t = Queue {
 _q :: a,
 _qname :: String,
 _enqueue :: a -> t -> m (),
 _enqueueBatch :: a -> [t] -> m (),
 _dequeue :: a -> m (Maybe t),
 _drain :: a -> m [t],
 _size :: a -> m Int,
 _destroy :: a -> m ()
}


enqueue :: (Monad m) => Queue m a t -> t -> m ()
enqueue Queue {..} t = _enqueue _q t


enqueueBatch :: (Monad m) => Queue m a t -> [t] -> m ()
enqueueBatch Queue {..} ts = _enqueueBatch _q ts


dequeue :: (Monad m) => Queue m a t -> m (Maybe t)
dequeue Queue {..} = _dequeue _q


drain :: (Monad m) => Queue m a t -> m [t]
drain Queue {..} = _drain _q


size :: (Monad m) => Queue m a t -> m Int
size Queue {..} = _size _q


destroy :: (Monad m) => Queue m a t -> m ()
destroy Queue {..} = _destroy _q
