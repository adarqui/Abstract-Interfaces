{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Counter.Get (
 CounterGet,
 get,
 counterToGet
) where

import qualified Abstract.Interfaces.Counter as C

data CounterGet m a t = CounterGet {
 _cG :: C.Counter m a t
}


counterToGet :: C.Counter m a t -> CounterGet m a t
counterToGet c = CounterGet { _cG = c }


get :: (Monad m) => forall t. CounterGet m a t -> m (Maybe t)
get (CounterGet c') = C.get c'
