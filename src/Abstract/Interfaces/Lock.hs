{-# LANGUAGE RankNTypes, RecordWildCards #-}

module Abstract.Interfaces.Lock (
 Lock (..),
 acquire,
 tryAcquire,
 release,
 with,
 tryWith,
 wait,
 locked
) where


data Lock m a = Lock {
 _lk :: a,
 _lkname :: String,
 _acquire :: a -> m (),
 _tryAcquire :: a -> m Bool,
 _release :: a -> m (),
 _with :: forall t. a -> m t -> m t,
 _tryWith :: forall t. a -> m t -> m (Maybe t),
 _wait :: a -> m (),
 _locked :: a -> m Bool
}


acquire :: Lock m a -> m ()
acquire Lock {..} = _acquire _lk


tryAcquire :: Lock m a -> m Bool
tryAcquire Lock {..} = _tryAcquire _lk


release :: Lock m a -> m ()
release Lock {..} = _release _lk


with :: Lock m a -> m t -> m t
with Lock {..} ioAct = _with _lk ioAct


tryWith :: Lock m a -> m t -> m (Maybe t)
tryWith Lock {..} ioAct = _tryWith _lk ioAct


wait :: Lock m a -> m ()
wait Lock {..} = _wait _lk


locked :: Lock m a -> m Bool
locked Lock {..} = _locked _lk
