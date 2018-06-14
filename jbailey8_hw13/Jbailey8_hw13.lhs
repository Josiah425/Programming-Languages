> module Jbailey8_hw13
>    where

> iterate2 :: (a -> a) -> a -> [a]

> iterate2 f x = x : iterate2 f (f x)

> triangularHelper 0 i = i
> triangularHelper n i = triangularHelper (n-1) (i+n)

> triangular n = triangularHelper n 0

> triseq = 0 : 1 : [ i+j | (i,j) <- zip (tail triseq) [2..]]

> bigRec :: (Ord a, Num a) => a -> [a] -> [a]

> bigRec n [] = []
> bigRec n (x:xs)
>	| x > n = [x] ++ (bigRec n xs)
>	| otherwise = [] ++ (bigRec n xs)

> bigList n [] = []
> bigList n (x:xs) = [x | x > n] ++ (bigList n [y | y <- xs, y > n])




A
1) t -> t

2 a) 3
2 b) 8
2 c) error
2 d) Monoid

3 a) 6
3 b) x + x

4 a) 3
4 b) Monad

B

> mysB :: a -> b -> a
> mysB x z = x

> hLen :: (Num u, Eq t) => ([t] -> u) -> [t] -> u
> hLen = (\f x -> if x == [] then 0 else 1 + (f (tail x)))
> myLength ls = if ls == [] then 0 else 1 + myLength (tail ls)

1) 1. hLen is not recursive because it just applies a function to the tail of the list without calling itself

   2. hLen is a higher order function because it takes a function as an argument and applies that function

   3. a) hLen sum [4,5,6] = 12
   3. b) hLen head [4,5,6] = 6

   hLen has nothing to do with sum or head

2) hLen myLength [4,5,6] = 3

3) hLen and myLength both iterate through the elements of the list.  myLength only applies itself
   to the list, but hLen applies any function (that takes a list as an arg) to the tail of the list.


C 

> factorial :: Integral a => a -> a
> factorial n = if n == 0 then 1 else n * (factorial (n - 1))

1)

> hFact = (\f n -> if n == 0 then 1 else n * (f (n-1)))

type of Hfact is (Integer -> Integer) -> Integer -> Integer

2)
hFact (^ 2) 4 = 36

3)
hFact factorial 5 = 120
factorial 5 = 120

D

> factorial' = hFact factorial'

1) type of factorial' is Integer -> Integer

> fix f = f(fix f)

2) a) (t -> t) -> t

   b) The difference is that f(fix f) takes one less argument than f fix f because the argument is enclosed
      in the paranthesis for f

3) a) 720
   b) 720
   c) 720
   d) 720







