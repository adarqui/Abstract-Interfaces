{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Counter.Get (
 CounterGet,
{- get, -}
 counterToGet
) where

import qualified Abstract.Interfaces.Counter as C

data CounterGet m t = CounterGet {
 _cG :: C.Counter m t
}


counterToGet :: C.Counter m t -> CounterGet m t
counterToGet c = CounterGet { _cG = c }

{-
get :: (Monad m) => forall t. CounterGet m a t -> m (Maybe t)
get (CounterGet c') = C.get c'
-}
