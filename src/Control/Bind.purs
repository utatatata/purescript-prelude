module Control.Bind where

import Control.Apply (class Apply)

class Apply m <= Bind m where
  bind :: forall a b. m a -> (a -> m b) -> m b