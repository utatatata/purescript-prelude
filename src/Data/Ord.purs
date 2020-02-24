module Data.Ord
  ( class Ord, compare
  , class Ord1, compare1
  , 
  )
  where

import Data.Eq (class Eq)
import Data.Ordering (Ordering(..))

class Eq a <= Ord a where
  compare :: a -> a -> Ordering

instance ordBoolean :: Ord Boolean where
  compare = ordBooleanImpl LT EQ GT

instance ordInt :: Ord Int where
  compare = ordIntImpl LT EQ GT

instance ordNumber :: Ord Number where
  compare = ordNumberImpl LT EQ GT

instance ordChar :: Ord Char where
  compare = ordCharImpl LT EQ GT

instance ordString :: Ord String where
  compare = ordStringImpl LT EQ GT

foreign import ordBooleanImpl
  :: Ordering 
  -> Ordering
  -> Ordering
  -> Boolean
  -> Boolean
  -> Ordering

foreign import ordIntImpl
  :: Ordering 
  -> Ordering
  -> Ordering
  -> Int
  -> Int
  -> Ordering

foreign import ordNumberImpl
  :: Ordering 
  -> Ordering
  -> Ordering
  -> Number
  -> Number
  -> Ordering

foreign import ordStringImpl
  :: Ordering 
  -> Ordering
  -> Ordering
  -> String
  -> String
  -> Ordering

foreign import ordCharImpl
  :: Ordering 
  -> Ordering
  -> Ordering
  -> Char
  -> Char
  -> Ordering

instance ordOrdering :: Ord Ordering where
  compare LT LT = EQ
  compare EQ EQ = EQ
  compare GT GT = EQ
  compare LT _ = LT
  compare EQ LT = GT
  compare EQ GT = LT
  compare GT _ = GT

lessThan :: forall a. Ord a => a -> a -> Boolean
lessThan a1 a2 = case a1 `compare` a2 of
  LT -> true
  _ -> false

greaterThan :: forall a. Ord a => a -> a -> Boolean
greaterThan a1 a2 = case a1 `compare` a2 of
  GT -> true
  _ -> false

lessThanOrEq :: forall a. Ord a => a -> a -> Boolean
lessThanOrEq a1 a2 = case a1 `compare` a2 of
  GT -> false
  _ -> true

greaterThanOrEq :: forall a. Ord a => a -> a -> Boolean
greaterThanOrEq a1 a2 = case a1 `compare` a2 of
  LT -> false
  _ -> true

infixl 4 lessThan as <
infixl 4 lessThanOrEq as <=
infixl 4 greaterThan as >
infixl 4 greaterThanOrEq as >=

comparing :: forall a b. Ord b => (a -> b) -> (a -> a -> Ordering)
comparing f x y = compare (f x) (f y)

min :: forall a. Ord a => a -> a -> a
min x y =
  case compare x y of
    LT -> x
    EQ -> x
    GT -> y

max :: forall a. Ord a => a -> a -> a
max x y =
  case compare x y of
    LT -> y
    GT -> x
    EQ -> x

clamp :: forall a. Ord a => a -> a -> a -> a
clamp low hi x = min hi (max low x)

between :: forall a. Ord a => a -> a -> a -> Boolean
between low hi x
  | x < low = false
  | x > hi = false
  | true = true

abs :: forall a. Ord a => Ring a => a -> a
abs x = if x>= zero then x else negate x

signum :: forall a. Ord a => Ring a => a -> a
signum x = if x >= zero then one else negate one