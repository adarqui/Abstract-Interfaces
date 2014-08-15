{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Queue.Deq (
 QueueDeq (..),
 dequeue,
 drain,
 queueToDeq
) where


import qualified Abstract.Interfaces.Queue as Q


data QueueDeq m a t = QueueDeq {
 _qDeq :: Q.Queue m a t
}


queueToDeq :: Q.Queue m a t -> QueueDeq m a t
queueToDeq q = QueueDeq { _qDeq = q }


dequeue :: (Monad m) => forall t. QueueDeq m a t -> m (Maybe t)
dequeue (QueueDeq q') = Q.dequeue q'


drain :: (Monad m) => forall t. QueueDeq m a t -> m [t]
drain (QueueDeq q') = Q.drain q'
