module Data.Eq
  ( class Eq, eq, (==), notEq, (/=)
  , class Eq1, eq1, notEq1
  )
  where

class Eq a where
  eq :: a -> a -> Boolean

infix 4 eq as ==

notEq :: forall a. Eq a => a -> a -> Boolean
notEq x y = (x == y) == false

infix 4 notEq as /=

instance eqBoolean :: Eq Boolean where
  eq = eqBooleanImpl

instance eqInt :: Eq Int where
  eq = eqIntImpl

instance eqNumber :: Eq Number where
  eq = eqNumberImpl

instance eqChar :: Eq Char where
  eq = eqCharImpl

instance eqString :: Eq String where
  eq = eqStringImpl

foreign import eqBooleanImpl :: Boolean -> Boolean -> Boolean
foreign import eqIntImpl :: Int -> Int -> Boolean
foreign import eqNumberImpl :: Number -> Number -> Boolean
foreign import eqCharImpl :: Char -> Char -> Boolean
foreign import eqStringImpl :: String -> String -> Boolean

class Eq1 f where
  eq1 :: forall a. Eq a => f a -> f a -> Boolean

notEq1 :: forall f a. Eq1 f => Eq a => f a -> f a -> Boolean
notEq1 x y = (x `eq1` y) == false