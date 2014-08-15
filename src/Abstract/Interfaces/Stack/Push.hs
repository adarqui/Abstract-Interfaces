{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Stack.Push (
 StackPush (..),
 push,
 pushBatch
) where


import qualified Abstract.Interfaces.Stack as S


data StackPush m a t = StackPush {
 _sPush :: S.Stack m a t
}


push :: (Monad m) => forall t. StackPush m a t -> t -> m ()
push (StackPush s') t = S.push s' t


pushBatch :: (Monad m) => forall t. StackPush m a t -> [t] -> m ()
pushBatch (StackPush s') ts = S.pushBatch s' ts
