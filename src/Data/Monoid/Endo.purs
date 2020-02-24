module Data.Monoid.Endo where

import Data.Eq (class Eq)

newtype Endo c a = Endo (c a a)

derive newtype instance eqEndo :: Eq (c a a) => Eq (Endo c a)

derive newtype instance ordEndo :: Ord (c a a) => Ord (Endo c a)