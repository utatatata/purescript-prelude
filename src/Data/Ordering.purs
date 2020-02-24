module Data.Ordering (Ordering(..), invert) where

import Data.Eq (class Eq)
import Data.Semigroup (class Semigroup)
import Data.Show (class Show)

data Ordering = LT | GT | EQ

instance eqOrdering :: Eq Ordering where
  eq LT LT = true
  eq GT GT = true
  eq EQ EQ = true
  eq _ _ = false

instance semigroupOrdering :: Semigroup Ordering where
  append LT _ = LT
  append GT _ = GT
  append EQ y = y

instance showOrdering :: Show Ordering where
  show LT = "LT"
  show GT = "GT"
  show EQ = "EQ"

invert :: Ordering -> Ordering
invert GT = LT
invert EQ = EQ
invert LT = GT