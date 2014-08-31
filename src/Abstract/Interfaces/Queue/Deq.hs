{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Queue.Deq (
 QueueDeq (..),
 dequeue,
 drain,
 queueToDeq
) where


import qualified Abstract.Interfaces.Queue as Q


data QueueDeq m t = QueueDeq {
 _qDeq :: Q.Queue m t
}


queueToDeq :: Q.Queue m t -> QueueDeq m t
queueToDeq q = QueueDeq { _qDeq = q }


dequeue :: (Monad m) => forall t. QueueDeq m t -> m (Maybe t)
dequeue (QueueDeq q') = Q.dequeue q'


drain :: (Monad m) => forall t. QueueDeq m t -> m [t]
drain (QueueDeq q') = Q.drain q'
