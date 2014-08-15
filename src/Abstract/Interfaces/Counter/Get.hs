{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Counter.Get (
 CounterG,
 get,
 counterToGet
) where

import qualified Abstract.Interfaces.Counter as C

data CounterG m a t = CounterG {
 _cG :: C.Counter m a t
}


counterToGet :: C.Counter m a t -> CounterG m a t
counterToGet c = CounterG { _cG = c }


get :: (Monad m) => forall t. CounterG m a t -> m (Maybe t)
get (CounterG c') = C.get c'
