module Data.List where

import Control.Apply (class Apply)
import Data.Functor (class Functor, map)
import Data.Semigroup (class Semigroup)

data List a
  = Nil
  | Cons a (List a)

infixr 6 Cons as :

-- instance semigroupList :: Semigroup (List a) where
--   append xs ys = foldr (:) ys xs

instance functorList :: Functor List where
  map f Nil = Nil
  map f (Cons x xs) = Cons (f x) (map f xs)

-- instance applyList :: Apply List where
--   apply fs xs = map (\f -> map f xs) fs

