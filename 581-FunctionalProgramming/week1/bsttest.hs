module HW1 where


--
-- * Part 1: Binary trees
--

-- | Integer-labeled binary trees.
data Tree = Node Int Tree Tree   -- ^ Internal nodes
          | Leaf Int             -- ^ Leaf nodes
  deriving (Eq,Show)


-- | An example binary tree, which will be used in tests.
t1 :: Tree
t1 = Node 1 (Node 2 (Node 3 (Leaf 4) (Leaf 5))
                    (Leaf 7))
            (Node 7 (Leaf 8) (Leaf 9))

-- | Another example binary tree, used in tests.
t2 :: Tree
t2 = Node 6 (Node 2 (Leaf 1) (Node 4 (Leaf 3) (Leaf 5)))
            (Node 8 (Leaf 7) (Leaf 9))


-- | The integer at the left-most node of a binary tree.
--
--   >>> leftmost (Leaf 3)
--   3
--
--   >>> leftmost (Node 5 (Leaf 6) (Leaf 7))
--   6
--   
--   >>> leftmost t1
--   4
--
--   >>> leftmost t2
--   1
--
leftmost :: Tree -> Int
leftmost (Leaf i)     = i
leftmost (Node _ l _) = leftmost l

rightmost :: Tree -> Int
rightmost (Leaf i) = i
rightmost (Node _ _ r) = rightmost r

travel :: Tree -> [Int]
travel (Leaf i) = i : []
travel (Node i l r) = i : (travel l) ++ (travel r)

maxint :: Tree -> Int
maxint (Leaf i) = i
maxint (Node i l r) = maximum (travel (Node i l r))

minint :: Tree -> Int
minint (Leaf i) = i
minint (Node i l r) =  minimum (travel (Node i l r))

sumints :: Tree -> Int
sumints (Leaf i) = i
sumints (Node i l r) = sum (travel (Node i l r))

preorder :: Tree -> [Int]
preroder (Leaf i) = i : []
preorder (Node i l r) = travel (Node i l r)

inorder :: Tree -> [Int]
inorder (Leaf i) = i : []
inorder (Node i l r) = i : (inorder r) ++ (inorder l)

inBST :: Int -> Tree -> Bool
inBST a (Leaf i) = (a == i)
inBST a (Node i l r) = elem a (travel (Node i l r))

sorted :: [Int] -> Bool
sorted [] = True
sorted [x] = True
sorted (x:y:z) = (x <= y) && sorted (y:z) 

isBST :: Tree -> Bool
isBST (Leaf i) = True
isBST (Node i l r) = sorted (preorder (Node i l r))

