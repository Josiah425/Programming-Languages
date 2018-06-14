> module Jbailey8_hw11
>    where

HW Due Wed. April 25 @ midnight

In Lab problems a-c:

Problem a: 
Point is a data type that represents a point in a plane. Using deriving makes
(Point a) type in the Type Class Show and Eq using "a natural" implementation. 


> data Point a = Pt a a deriving(Show, Eq)

   > :t Pt 0 0
   Pt 0 0 :: Num a => Point a
   > :t Pt 'a' 'b'
   Pt 'a' 'b' :: Point Char
   > Pt 3 6 == Pt 6 3
   False
   > Pt 3 6 == Pt 3 6
   True
What is the data type name?  What is the constructor name? 
What happens if you do not use deriving in the type declaration when you 
try to find if two points are equal?

Problem a ANSWER:

Data type name Point.
Constructor name Pt.
Error, no instance for Eq(Point a0) arising from use of '=='


Problem b: We define the data type Line as follows:
 
> data Line a = Line (Point a) (Point a) deriving (Show, Eq)

What is the data type name?  What is the constructor name?

Data type name Line
Constructor name is Line

We can consider two lines equal if the lines have the same length.  
  > Line (Pt 3 4) (Pt 4 5) == Line (Pt 3 4) (Pt 4 6)
  False
  > Line (Pt 3 4) (Pt 4 5) == Line (Pt 3 4) (Pt 4 5)
  True

Make the data type 'Line' an instance of the type Class Eq 
(NOTE: You code would be neater using a where clause to define alocal function 
     length :: Floating a => Point a -> Point a -> a 
  )
Problem b ANSWER:

 > instance (Eq a, Floating a) => Eq (Line a) where


 > ff = \xs -> [ x + 5 | x <- xs, x > -1 ]
  
   ...> ff [1,20,-3,15,2]
   [6,25,20,7]

   Using explicit recursion and pattern-matching, without guards-- OR --
   using explicit recursion with guards but without pattern-matching.  You
   may use explicit arguments.
   
Problem c ANSWER:  

> ff [] = []
> ff (x:xs) = if x > -1 then (x + 5):(ff xs) else ff xs

------------------------------------------------------------
4/19 PM problems renumbered and test "trees" corrected.
-----------------------------------------------------------

Problem 1: (easy)
Write a Haskell script which implements Ackermann's function as defined in 
homework 1.  Name your script "ack".  
You may use guards, and/or pattern matching and/or if expressions in
your definition. 
 
ack( m,n ) =	n + 1                           if m = 0
ack( m,n ) =	ack(m - 1, 1)                   if n = 0 and m > 0 
ack( m,n ) =	ack( m-1, ack( m, n-1 ) )      	if n >0 and m > 0


Problem 1 ANSWER:

> ack :: (Ord a, Num a) => a -> a -> a
> ack m n
>	| m == 0 = n + 1
>	| n == 0 && m > 0 = ack (m - 1) 1
>	| n > 0 && m > 0 = ack (m - 1) (ack m (n - 1))

Problem 2
Define a primitive recursive function 'merge' that given two sorted lists returns 
a sorted list with all the unique elements from lists.  This can be used to help solve
the last problem.
e.g.
   ....> merge [1,8,9,100] [3,7,9,99,100]    
   [1,3,7,8,9,99,100]


Problem 2 ANSWER: 

> merge :: (Ord a, Num a) => [a] -> [a] -> [a]
> merge [] ys = ys
> merge xs [] = xs
> merge (x:xs) (y:ys)
>	| x < y = x:(merge xs (y:ys))
>	| x > y = y:(merge (x:xs) ys)
>	| otherwise = x:(merge xs ys)

Problem 3:
Given the following recursive polymorphic tree data type:

> data Tree a = Leaf | Branch a (Tree a) (Tree a) deriving Show
> tree = Branch 6 (Branch 3 Leaf Leaf) (Branch 9 Leaf Leaf)

Define toList :: Tree a -> [a], that converts a tree structure to a list
structure.
    > toList tree
    [3,6,9]

What kind of tree traversal did you use?  What is the time complexity
of your code.

I used a depth first search because toList on the left will be called over and over first.
Time complexity is O(N)

Problem 3 ANSWER:

> toList :: Tree a -> [a]
> toList Leaf = []
> toList (Branch a b c) = (toList b) ++ [a] ++ (toList c)

Problem 4:
Using the Tree data type above define toTree, which converts a list of
values to a binary tree of the values of the list. 

You may assume the following behavior: Given list [1,2,3]

1. We take 1 as the current node.
2. We split the remaining list into a left and right sublist [2] and [3],
   and convert those sublists to the left and right subtrees of the current
   node respectively.

    > toTree [1,2,3]
    Branch 1 (Branch 2 Leaf Leaf) (Branch 3 Leaf Leaf)
    > toTree [1,2,3,4,5]
    Branch 1 (Branch 2 Leaf (Branch 3 Leaf Leaf)) (Branch 4 Leaf (Branch 5 Leaf Leaf))

    Yes, the tree need not be complete.

What is the most general type of the list input?   What is the most general type
of 'toTree'?

The most general type of list input is a Num.  The most general type of toTree
is a list for input of Nums

Problem 4 ANSWER:

> split lst = splitAt(((length lst) + 1) `div` 2) lst
> toTree :: (Eq a) => [a] -> Tree a
> toTree [] = Leaf
> toTree [h] = Branch h Leaf Leaf
> toTree (parent:middle:rest)
>	| rest == [] = Branch parent (toTree []) (toTree [middle])
> toTree (parent:rest) = Branch parent (toTree (fst(split rest))) (toTree (snd(split rest)))

`
Problem 5: 
Implement a function which returns mirror of a Tree a.
 (http://codercareer.blogspot.com/2011/10/no-12-mirror-of-binary-trees.html)
i.e.

  ... > mirror tree1
  Node 5 Leaf (Node 10 (Node 12 (Node 15 Leaf Leaf) Leaf) Leaf)
  ... > mirror (Node "abc" Leaf (Node "x" Leaf Leaf))
  Node "abc" (Node "x" Leaf Leaf) Leaf

Problem 5 ANSWER:

> mirror :: Tree a -> Tree a
> mirror Leaf = Leaf
> mirror (Branch a b c) = (Branch a (mirror c) (mirror b))

Problem 6:
Now make Tree an instance in the EQ class -- do not use deriving. Trees are 
considered equal if they have the same structures and the leaves have are equal.  
Therefore the parameterize type of the Tree must be in the Class EQ. Below are
some possible test cases. tree1 and tree2 should be equal but not tree3 and tree4.
You may find this helpful: https://en.wikibooks.org/wiki/Haskell/Classes_and_types

> tree3 = Branch 6 (Branch 3 Leaf Leaf) (Branch 9 Leaf Leaf)

Thanks to E. O. (team A) who found typos in my test examples below:

   > tree1 = Branch 6 (Branch 3 Leaf  (Branch 9 Leaf Leaf))
   > tree2 = Branch 6 (Branch 3 Leaf (Branch 9 Leaf Leaf)) 
   > tree4 = Branch 6 (Branch 3 (Branch 9 Leaf Leaf) Leaf)

Below is correct test cases:

> tree1 = Branch 6 (Branch 3 Leaf  (Branch 9 Leaf Leaf)) Leaf
> tree2 = Branch 6 (Branch 3 Leaf (Branch 9 Leaf Leaf))  Leaf
> tree4 = Branch 6 (Branch 3 (Branch 9 Leaf Leaf) Leaf) Leaf


Example results:
  .... > tree1 == tree1
  True
  .... > tree1 == tree2
  True
  .... > tree3 == tree1
  False
  ...> tree1 /= tree3
  True

Problem 6 ANSWER:

> instance (Eq a) => Eq (Tree a) where
>	(Leaf) == (Leaf) = True
>	(Branch a b c) == (Branch a2 b2 c2) = (a == a2) && (b == b2) && (c == c2)
>	_==_ = False



Problem 7: Make Tree an instance of the Functor class. Read this before your start:
https://en.wikibooks.org/wiki/Haskell/The_Functor_class


Problem 7 ANSWER:

> instance Functor Tree where
>	fmap f Leaf = Leaf
>	fmap f (Branch a b c) = Branch (f a) (fmap f b) (fmap f c)


Problem 8:
Define a function replicate' which given a list of numbers returns a 
list with each number duplicated its value.   USE List Comprehension
Notation (this is a repeat of problem 8 from HW 10 homework) 
     
     Hw11> replicate' [2, 4, 1]
     [2,2,4,4,4,4,1]

> replicate' :: (Eq a, Num a, Enum a) => [a] -> [a]


Problem 8 ANSWER:

> replicate' [] = []
> replicate' x = [m | m <- x, _ <- [1..m]]

Problem 9:
Define a function, sumLsts, that will take two list of lists, 
and adds one with another.

    > sumLsts [[1,1,1], [1,10,20], [-3, -4, -2]] [[3,5,6],[2,3,4],[2,3,2]]
    > [[4,6,7],[3,13,24],[-1,-1,0]]


Use list comprehension notation to solve this problem. You may use 'zip' in 
your solution.
What is the most general type of sumLst?

The most general type is a list of Nums

Problem 9 ANSWER:

> sumLsts [] [] = []
> sumLsts (h1:t1) (h2:t2) = [ ele | ele <- zipWith (+) h1 h2] : (sumLsts t1 t2)

Problem 10:
Write a function, sumSingleLsts, that will take two list of lists, and adds one with another but
the solution will have have a continue list of sums. 

    > sumSingleLst [[1,1,1], [1,10,20], [-3, -4, -2]] [[3,5,6],[2,3,4],[2,3,2]]
    > [4,6,7,3,13,24,-1,-1,0]

Use list comprehension notation to solve this problem. You may use 'zip' in 
your solution.
What is the most general type of sumSingleLsts?

most general type of sumSingleLsts is a list of Nums

Problem 10 ANSWER:

> sumSingleLst [] [] = []
> sumSingleLst (h1:t1) (h2:t2) = [ ele | ele <- zipWith (+) h1 h2] ++ (sumSingleLst t1 t2)


Problem 11: (from http://en.wikipedia.org/wiki/Thue%E2%80%93Morse_sequence )
In previous homework 10 problem 7 you wrote a primitive recursive function to
produce the next element in the Thue-Morse sequence, 
(also know as Prouhet-Thue-Morse sequence)

One possible solution is 

Using the circular list idea demonstrated in fibSeq
  (http://bingweb.binghamton.edu/%7Ehead/CS471/NOTES/HASKELL/4hF02.html)
  Define thueSeq to be a sequence of thue elements.
  You should use list comprehension. May use the 'thue' definition from your homework.
e.g.
  
  ... > take 5 thueSeq
  [[0],[0,1],[0,1,1,0],[0,1,1,0,1,0,0,1],[0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0]]

Problem 11 ANSWER:

> flipBits [] = []
> flipBits (x:xs)
>	| x == 0 = [1] ++ flipBits xs
>	| x == 1 = [0] ++ flipBits xs

> thue :: (Eq a, Num a) => [a] -> [a]
> thue lst = lst ++ (flipBits lst)

> thueSeq = [0] : [(thue f) | f <- thueSeq]











