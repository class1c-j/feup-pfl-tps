-- |
module HaskellTp5 where

-- 5.6

data Map k v = Empty | Node k v (Map k v) (Map k v) deriving (Show)

empty :: (Map k a)
empty = Empty

insert :: (Ord k) => k -> a -> Map k a -> Map k a
insert key value Empty = Node key value Empty Empty
insert key value (Node curKey curVal left right)
  | key == curKey = Node curKey curVal left right
  | key < curKey = Node curKey curVal (insert key value left) right
  | key > curKey = Node curKey curVal left (insert key value right)

lookup :: (Ord k) => k -> Map k a -> Maybe a
lookup _ Empty = Nothing
lookup key (Node curKey curVal left right)
  | key == curKey = Just curVal
  | key < curKey = HaskellTp5.lookup key left
  | key > curKey = HaskellTp5.lookup key right
