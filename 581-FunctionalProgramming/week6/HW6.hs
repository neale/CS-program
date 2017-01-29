module HW6 where

import Prelude hiding (and,or,not,pred,succ,fst,snd,either)

import Data.Maybe
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

setFst :: Exp
setFst = abs2 ( app2 pair (Ref 0) (App snd (Ref 1)) )

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
setSnd :: Exp 
setSnd = abs2 ( app2 pair (App fst (Ref 1)) (Ref 0) )

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
encodeFoo :: Foo -> Exp
encodeFoo (N n)     = Abs (app2 mult (num n) three)
-- or     (N n)     = num n
encodeFoo (B True)  = one
encodeFoo (B False) = zero
encodeFoo (P n b)   = abs2 ( app2 add (num n) (app3 if_ (bExp' (b == True)) one zero) )
-- or     (P n b)   = app2 pair (num n) (bExp' b)

-- | 4. Implement the bar function as a lambda calculus term.
bExp :: Foo -> Maybe Exp
bExp (B True)  = Just true
bExp (B False) = Just false
_              = Nothing 

nExp :: Foo -> Maybe Exp
nExp (N n) = Just (num n)
_          = Nothing

pExp :: Foo -> Exp
pExp (P n b) = app2 pair (num n) (bExp' b)

bExp' :: Bool -> Exp
bExp' True  = true
bExp' False = false

toFoo :: Exp -> Foo
toFoo false = (B False)
toFoo true  = (B True)
toFoo one   = (N 1)
toFoo zero  = (N 0)
_           = (N 4)



--buildInt :: Exp -> Int

-- test (N 4) doesnt work
-- I assumed that Ref 0 in line 104 would be an Exp number
-- Then we multiply it by 3. But I dont know why its not returning true
-- I shouldnt need to convert to a foo, just operate right on the Exp
-- Could be an error in the line above
--
barExp :: Exp
barExp = Abs ( 
              app3 if_ (bExp' (isJust (bExp (toFoo (Ref 0))))) 
              ( app3 if_ (bExp' ((fromJust (bExp (toFoo (Ref 0)))) == true)) 
                  one 
                  zero
              ) 
              ( app3 if_ (bExp' (isJust (nExp (toFoo (Ref 0)))))
                  ( app2 mult (Ref 0) three ) 
                  ( app2 add (App fst (pExp (toFoo (Ref 0)))) 
                      (app3 if_ (bExp' ((App snd (fromJust (bExp (toFoo (Ref 0))))) == true)) 
                        one 
                        zero
                      )   
                  )
              )
          )

-- | Run your lambda-encoded bar function on a lambda-encoded Foo.
runBar :: Foo -> Exp
runBar x = eval (App barExp (encodeFoo x))

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
test :: Foo -> Bool
test x = num (bar x) == eval (App barExp (encodeFoo x))
