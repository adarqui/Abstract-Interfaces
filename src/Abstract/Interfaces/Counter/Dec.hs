{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Counter.Dec (
 CounterDec,
{-
 decr,
 decrBy,
-}
 counterToDec
) where


import qualified Abstract.Interfaces.Counter as C


data CounterDec m t = CounterDec {
 _cD :: C.Counter m t
}

counterToDec :: C.Counter m t -> CounterDec m t
counterToDec c = CounterDec { _cD = c }

{-
decr :: (Monad m) => forall t. CounterDec m a t -> m t
decr (CounterDec c') = C.decr c'


decrBy :: (Monad m) => forall t. CounterDec m a t -> t -> m t
decrBy (CounterDec c') = C.decrBy c'
-}
