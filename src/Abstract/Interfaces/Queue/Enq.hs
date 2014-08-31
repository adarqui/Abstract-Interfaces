{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Queue.Enq (
 QueueEnq (..),
 enqueue,
 enqueueBatch,
 queueToEnq
) where


import qualified Abstract.Interfaces.Queue as Q


data QueueEnq m t = QueueEnq {
 _qEnq :: Q.Queue m t
}


queueToEnq :: Q.Queue m t -> QueueEnq m t
queueToEnq q = QueueEnq { _qEnq = q }


enqueue :: (Monad m) => forall t. QueueEnq m t -> t -> m ()
enqueue (QueueEnq q') = Q.enqueue q'

enqueueBatch :: (Monad m) => forall t. QueueEnq m t -> [t] -> m ()
enqueueBatch (QueueEnq q') = Q.enqueueBatch q'
