{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Counter.Dec (
 CounterD (..),
 decr,
 decrBy
) where


import qualified Abstract.Interfaces.Counter as C


data CounterD m a t = CounterD {
 _cD :: C.Counter m a t
}


decr :: (Monad m) => forall t. CounterD m a t -> m t
decr (CounterD c') = C.decr c'


decrBy :: (Monad m) => forall t. CounterD m a t -> t -> m t
decrBy (CounterD c') = C.decrBy c'
