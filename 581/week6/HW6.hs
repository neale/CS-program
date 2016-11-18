module HW6 where

import Prelude hiding (and,or,not,pred,succ,fst,snd,either)

import DeBruijn
import Church


--
-- * Part 1: Church pair update functions
--

-- | 1. A lambda calculus function that replaces the first element in a
--   Church-encoded pair. The first argument to the function is the original
--   pair, the second is the new first element.
--
--   >>> :{
--     eval (app2 pair true (num 3)) ==
--     eval (app2 setFst (app2 pair (num 2) (num 3)) true)
--   :}
--   True

setFst :: (Exp -> Exp)
setFst = app2 pair fst
--setFst a b = case (eval a) b of
--                   (num x) -> app3 pair (fst a)) b
--                   _     -> setFst a b

-- | 2. A lambda calculus function that replaces the second element in a
--   Church-encoded pair. The first argument to the function is the original
--   pair, the second is the new second element.
--
--   >>> :{
--     eval (app2 pair (num 2) true) ==
--     eval (app2 setSnd (app2 pair (num 2) (num 3)) true)
--   :}
--   True
--
setSnd :: Exp -> Exp -> Exp
setSnd a b = eval (app2 pair b a)

--
-- * Part 2: Church encoding a Haskell program
--

-- | Pretend Haskell's Int is restricted to Nats.
type Nat = Int

-- | A simple data type with three cases.
data Foo = N Nat | B Bool | P Nat Bool
  deriving (Eq,Show)

-- | Compute a numeric value from a Foo.
--   (This is just an arbitrary function.)
bar :: Foo -> Nat
bar (N n)     = n * 3
bar (B True)  = 1
bar (B False) = 0
bar (P n b)   = n + if b then 1 else 0

-- | 3. Write a Haskell function that converts a Foo into a
--   lambda calculus term.
--encodeFoo :: Foo -> Exp
--encodeFoo = undefined

-- | 4. Implement the bar function as a lambda calculus term.
--barExp :: Exp
--barExp = undefined

-- | Run your lambda-encoded bar function on a lambda-encoded Foo.
--runBar :: Foo -> Exp
--runBar x = eval (App barExp (encodeFoo x))

-- | A function for testing encodeFoo and barExp. Checks to see if the lambda
--   calculus encoding returns the same number as the given value function.
--
--   >>> test (N 4)
--   True
--
--   >>> test (B True)
--   True
--
--   >>> test (B False)
--   True
--
--   >>> test (P 5 True)
--   True
--
--   >>> test (P 5 False)
--   True
--
--test :: Foo -> Bool
--test x = num (bar x) == eval (App barExp (encodeFoo x))
