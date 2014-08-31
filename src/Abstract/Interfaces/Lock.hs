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


data Lock m = Lock {
 _lkname :: String,
 _acquire :: m (),
 _tryAcquire :: m Bool,
 _release :: m (),
 _with :: forall t. m t -> m t,
 _tryWith :: forall t. m t -> m (Maybe t),
 _wait :: m (),
 _locked :: m Bool
}


acquire :: Lock m -> m ()
acquire Lock {..} = _acquire


tryAcquire :: Lock m -> m Bool
tryAcquire Lock {..} = _tryAcquire


release :: Lock m -> m ()
release Lock {..} = _release


with :: Lock m -> m t -> m t
with Lock {..} ioAct = _with ioAct


tryWith :: Lock m -> m t -> m (Maybe t)
tryWith Lock {..} ioAct = _tryWith ioAct


wait :: Lock m -> m ()
wait Lock {..} = _wait


locked :: Lock m -> m Bool
locked Lock {..} = _locked
