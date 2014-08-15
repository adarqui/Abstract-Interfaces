{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Stack.Push (
 StackPush (..),
 push,
 pushBatch,
 stackToPush
) where


import qualified Abstract.Interfaces.Stack as S


data StackPush m a t = StackPush {
 _sPush :: S.Stack m a t
}


stackToPush :: S.Stack m a t -> StackPush m a t
stackToPush s = StackPush { _sPush = s }


push :: (Monad m) => forall t. StackPush m a t -> t -> m ()
push (StackPush s') t = S.push s' t


pushBatch :: (Monad m) => forall t. StackPush m a t -> [t] -> m ()
pushBatch (StackPush s') ts = S.pushBatch s' ts
