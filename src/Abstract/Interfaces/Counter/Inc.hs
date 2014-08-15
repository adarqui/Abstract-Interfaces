{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Counter.Inc (
 CounterI,
 incr,
 incrBy,
 counterToInc
) where


import qualified Abstract.Interfaces.Counter as C


data CounterI m a t = CounterI {
 _cI :: C.Counter m a t
}


counterToInc :: C.Counter m a t -> CounterI m a t
counterToInc c = CounterI { _cI = c }


incr :: (Monad m) => forall t. CounterI m a t -> m t
incr (CounterI c') = C.incr c'


incrBy :: (Monad m) => forall t. CounterI m a t -> t -> m t
incrBy (CounterI c') = C.incrBy c'
