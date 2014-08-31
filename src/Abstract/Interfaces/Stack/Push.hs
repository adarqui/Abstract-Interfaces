{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Stack.Push (
 StackPush (..),
 push,
 pushBatch,
 stackToPush
) where


import qualified Abstract.Interfaces.Stack as S


data StackPush m t = StackPush {
 _sPush :: S.Stack m t
}


stackToPush :: S.Stack m t -> StackPush m t
stackToPush s = StackPush { _sPush = s }


push :: (Monad m) => forall t. StackPush m t -> t -> m ()
push (StackPush s') t = S.push s' t


pushBatch :: (Monad m) => forall t. StackPush m t -> [t] -> m ()
pushBatch (StackPush s') ts = S.pushBatch s' ts
