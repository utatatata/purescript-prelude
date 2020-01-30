module Control.Subcategory.Constituency where

class ObjectOf (p:: Type -> Type -> Type) (a :: Type)

instance objectOfFn :: ObjectOf Function a

class OperatorOf (p :: Type -> Type -> Type) (a :: Type)

instance operatorOfFn :: OperatorOf Function a
