{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Counter.Inc (
 CounterI (..),
 incr,
 incrBy
) where


import qualified Abstract.Interfaces.Counter as C


data CounterI m a t = CounterI {
 _cI :: C.Counter m a t
}


incr :: (Monad m) => forall t. CounterI m a t -> m t
incr (CounterI c') = C.incr c'


incrBy :: (Monad m) => forall t. CounterI m a t -> t -> m t
incrBy (CounterI c') = C.incrBy c'
