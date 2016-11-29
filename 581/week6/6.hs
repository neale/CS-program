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


