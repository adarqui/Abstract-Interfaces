{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Stack.Pop (
 StackPop (..),
 pop,
 drain,
 stackToPop
) where


import qualified Abstract.Interfaces.Stack as S


data StackPop m a t = StackPop {
 _sPop :: S.Stack m a t
}


stackToPop :: S.Stack m a t -> StackPop m a t
stackToPop s = StackPop { _sPop = s }


pop :: (Monad m) => forall t. StackPop m a t -> m (Maybe t)
pop (StackPop s') = S.pop s'


drain :: (Monad m) => forall t. StackPop m a t -> m [t]
drain (StackPop s') = S.drain s'
