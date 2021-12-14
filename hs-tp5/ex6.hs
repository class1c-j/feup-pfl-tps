module Map where
data Map k v = Empty | Node (k,v) (Map k v) (Map k v) deriving Show 

empty :: Map k a
empty = Empty

insert :: Ord k => k -> a -> Map k a -> Map k a
insert k v Empty = Node (k,v) Empty Empty
insert k v (Node (k1, v1) l r)
    | k < k1 = Node (k1, v1) (insert k v l) r 
    | k > k1 = Node (k1, v1) l (insert k v r)
    | otherwise  = Node (k1, v1) l r