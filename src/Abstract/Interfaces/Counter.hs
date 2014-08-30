{-# LANGUAGE DeriveDataTypeable, RecordWildCards #-}
module Abstract.Interfaces.Counter (
 Counter (..),
 CounterError (..),
 incr,
 incrBy,
 decr,
 decrBy,
 get,
 reset,
 gentleReset
) where


import Control.Exception
import Data.Typeable

data CounterError =
   CreateFailed
 | DestroyFailed
 | OperationFailed
 | Disassociated
 deriving (Show, Typeable)

instance Exception CounterError


data Counter m a t = Counter {
 _c :: a,
 _incr :: a -> m t,
 _incrBy :: a -> t -> m t,
 _decr :: a -> m t,
 _decrBy :: a -> t -> m t,
 _get :: a -> m (Maybe t),
 _reset :: a -> m (),
 _gentleReset :: a -> m ()
}


incr :: (Monad m) => Counter m a t -> m t
incr Counter {..} = _incr _c


incrBy :: (Monad m) => Counter m a t -> t -> m t
incrBy Counter {..} n = _incrBy _c n


decr :: (Monad m) => Counter m a t -> m t
decr Counter {..} = _decr _c


decrBy :: (Monad m) => Counter m a t -> t -> m t
decrBy Counter {..} n = _decrBy _c n


get :: (Monad m) => Counter m a t -> m (Maybe t)
get Counter {..} = _get _c


reset :: (Monad m) => Counter m a t -> m ()
reset Counter {..} = _reset _c


gentleReset :: (Monad m) => Counter m a t -> m ()
gentleReset Counter {..} = _gentleReset _c
