{-# LANGUAGE DeriveDataTypeable, RecordWildCards #-}

module Abstract.Interfaces.Stack (
 Stack (..),
 StackError (..),
 push,
 pushBatch,
 pop,
 drain,
 size,
 destroy
) where


import Control.Exception
import Data.Typeable

data StackError =
   CreateFailed
 | DestroyFailed
 | EmptyStack
 | OperationFailed
 | PushFailed
 | PopFailed
 | Disassociated
 | NotImplemented
 deriving (Show, Typeable)


instance Exception StackError

data Stack m a t = Stack {
 _s :: a,
 _sname :: String,
 _push :: a -> t -> m (),
 _pushBatch :: a -> [t] -> m (),
 _pop :: a -> m (Maybe t),
 _drain :: a -> m [t],
 _size :: a -> m Int,
 _destroy :: a -> m ()
}


push :: (Monad m) => Stack m a t -> t -> m ()
push Stack {..} t = _push _s t


pop :: (Monad m) => Stack m a t -> m (Maybe t)
pop Stack {..} = _pop _s


pushBatch :: (Monad m) => Stack m a t -> [t] -> m ()
pushBatch Stack {..} ts = _pushBatch _s ts


drain :: (Monad m) => Stack m a t -> m [t]
drain Stack{..} = _drain _s


size :: (Monad m) => Stack m a t -> m Int
size Stack {..} = _size _s


destroy :: (Monad m) => Stack m a t -> m ()
destroy Stack {..} = _destroy _s
