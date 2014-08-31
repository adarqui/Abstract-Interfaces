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
 | OperationFailed
 | Disassociated
 deriving (Show, Typeable)

instance Exception StackError


data Stack m t = Stack {
 _push :: t -> m (),
 _pushBatch :: [t] -> m (),
 _pop :: m (Maybe t),
 _drain :: m [t],
 _size :: m Int,
 _destroy :: m ()
}


push :: (Monad m) => Stack m t -> t -> m ()
push Stack {..} t = _push t


pop :: (Monad m) => Stack m t -> m (Maybe t)
pop Stack {..} = _pop


pushBatch :: (Monad m) => Stack m t -> [t] -> m ()
pushBatch Stack {..} ts = _pushBatch ts


drain :: (Monad m) => Stack m t -> m [t]
drain Stack{..} = _drain


size :: (Monad m) => Stack m t -> m Int
size Stack {..} = _size


destroy :: (Monad m) => Stack m t -> m ()
destroy Stack {..} = _destroy
