data Tree a = Node (Tree a) a (Tree a) | Leaf a

depth :: Tree a -> Integer
depth (Node left _payload right) = 1 + max (depth left) (depth right)
depth (Leaf _payload) = 1

Node (Leaf 2) 5 (Node (Leaf 2) 1 (Leaf 3))
