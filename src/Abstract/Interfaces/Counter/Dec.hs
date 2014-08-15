{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Counter.Dec (
 CounterD,
 decr,
 decrBy,
 counterToDec
) where


import qualified Abstract.Interfaces.Counter as C


data CounterD m a t = CounterD {
 _cD :: C.Counter m a t
}


counterToDec :: C.Counter m a t -> CounterD m a t
counterToDec c = CounterD { _cD = c }


decr :: (Monad m) => forall t. CounterD m a t -> m t
decr (CounterD c') = C.decr c'


decrBy :: (Monad m) => forall t. CounterD m a t -> t -> m t
decrBy (CounterD c') = C.decrBy c'
