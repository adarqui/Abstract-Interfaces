module Abstract.Records.Counter.Get (
 CounterG (..),
 get
) where

import qualified Abstract.Records.Counter as C

data CounterG m a t = CounterG {
 _cG :: C.Counter m a t
}

get (CounterG c') = C.get c'
