{-# LANGUAGE RankNTypes #-}
module Abstract.Interfaces.Queue.Enq (
 QueueEnq (..),
 enqueue,
 enqueueBatch
) where


import qualified Abstract.Interfaces.Queue as Q


data QueueEnq m a t = QueueEnq {
 _qEnq :: Q.Queue m a t
}


enqueue :: (Monad m) => forall t. QueueEnq m a t -> t -> m ()
enqueue (QueueEnq q') = Q.enqueue q'

enqueueBatch :: (Monad m) => forall t. QueueEnq m a t -> [t] -> m ()
enqueueBatch (QueueEnq q') = Q.enqueueBatch q'
