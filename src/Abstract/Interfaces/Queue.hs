{-# LANGUAGE DeriveDataTypeable, RecordWildCards #-}
module Abstract.Interfaces.Queue (
 Queue (..),
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


data Queue m t = Queue {
name :: String,
 _enqueue :: t -> m (),
 _enqueueBatch :: [t] -> m (),
 _dequeue :: m (Maybe t),
 _blDequeue :: m (Maybe t),
 _drain :: m [t],
 _size :: m Int,
 _destroy :: m ()
}


enqueue :: (Monad m) => Queue m t -> t -> m ()
enqueue Queue {..} t = _enqueue t


enqueueBatch :: (Monad m) => Queue m t -> [t] -> m ()
enqueueBatch Queue {..} ts = _enqueueBatch ts


dequeue :: (Monad m) => Queue m t -> m (Maybe t)
dequeue Queue {..} = _dequeue


blDequeue :: (Monad m) => Queue m t -> m (Maybe t)
blDequeue Queue {..} = _blDequeue


drain :: (Monad m) => Queue m t -> m [t]
drain Queue {..} = _drain


size :: (Monad m) => Queue m t -> m Int
size Queue {..} = _size


destroy :: (Monad m) => Queue m t -> m ()
destroy Queue {..} = _destroy
