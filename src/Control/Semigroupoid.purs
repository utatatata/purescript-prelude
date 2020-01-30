module Control.Semigroupoid where

class Semigroupoid a where
  compose :: forall b c d. a c d -> a b c -> a b d

instance semigroupoidFun :: Semigroupoid (->) where
  compose f g x = f (g x)

infixr 9 compose as <<<

composeFlipped :: forall a b c d. Semigroupoid a => a b c -> a c d -> a b d
composeFlipped f g = compose g f

infixr 9 composeFlipped as >>>