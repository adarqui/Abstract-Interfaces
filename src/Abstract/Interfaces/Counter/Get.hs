module Abstract.Records.Counter.Get (
 CounterG,
 get,
 counterToGet
) where

import qualified Abstract.Records.Counter as C

data CounterG m a t = CounterG {
 _cG :: C.Counter m a t
}


counterToGet :: C.Counter m a t -> CounterG m a t
counterToGet c = CounterD { _cG = c }


get (CounterG c') = C.get c'
