module Data.Semigroup where

class Semigroup a where
  append :: a -> a -> a

infixr 5 append as <>

instance semigroupFn :: Semigroup s' => Semigroup (s -> s') where
  append f g x = f x <> g x