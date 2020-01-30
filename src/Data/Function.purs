module Data.Function where

flip :: forall a b c. (a -> b -> c) -> b -> a -> c
flip f b a = f a b