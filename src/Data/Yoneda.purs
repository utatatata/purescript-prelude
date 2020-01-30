module Data.Yoneda where

import Control.Semigroupoid ((<<<))
import Data.Functor (class Functor)

newtype Yoneda f a = Yoneda (forall b. (a -> b) -> f b)

instance functorYoneda :: Functor (Yoneda f) where
  map f m = Yoneda (\k -> runYoneda m (k <<< f))

runYoneda :: forall f a b. Yoneda f a -> (a -> b) -> f b
runYoneda (Yoneda f) k = f k