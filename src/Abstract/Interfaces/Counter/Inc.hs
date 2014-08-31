{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Counter.Inc (
 CounterInc,
{-
 incr,
 incrBy,
-}
 counterToInc
) where


import qualified Abstract.Interfaces.Counter as C


data CounterInc m t = CounterInc {
 _cI :: C.Counter m t
}


counterToInc :: C.Counter m t -> CounterInc m t
counterToInc c = CounterInc { _cI = c }

{-
incr :: (Monad m) => forall t. CounterInc m a t -> m t
incr (CounterInc c') = C.incr c'


incrBy :: (Monad m) => forall t. CounterInc m a t -> t -> m t
incrBy (CounterInc c') = C.incrBy c'
-}
