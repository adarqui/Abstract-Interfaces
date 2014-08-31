{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Stack.Pop (
 StackPop (..),
 pop,
 drain,
 stackToPop
) where


import qualified Abstract.Interfaces.Stack as S


data StackPop m t = StackPop {
 _sPop :: S.Stack m t
}


stackToPop :: S.Stack m t -> StackPop m t
stackToPop s = StackPop { _sPop = s }


pop :: (Monad m) => forall t. StackPop m t -> m (Maybe t)
pop (StackPop s') = S.pop s'


drain :: (Monad m) => forall t. StackPop m t -> m [t]
drain (StackPop s') = S.drain s'
