module StackLang where


import Prelude hiding (Num)


--
-- * Syntax of StackLang
--

-- Grammar for StackLang:
-- 
--    num ::= (any number)
--   bool ::= `true`  |  `false`
--   prog ::= cmd*
--    cmd ::= num                    push a number on the stack
--         |  bool                   push a boolean on the stack
--         |  `add`                  add the top two numbers the stack
--         |  `eq`                   check whether the top two elements are equal
--         |  `if` prog `else` prog  if the value on the top is true
--                                   then run the first program, else run the second


-- 1. Encode the above grammar as a set of Haskell data types
--

type Num = Int

type Prog = [Cmd]

data Cmd = PushN Num
         | PushB Bool
         | Add
         | Equ
         | IfElse Prog Prog
  deriving (Eq,Show)


-- 2. Write the following StackLang program as a Haskell value:
--
--   3 4 add 5 eq
--
ex1 :: Prog
ex1 = [PushN 3, PushN 4, Add, PushN 5, Equ]


-- 3. Write a StackLang program that:
--     * checks whether 3 and 4 are equal
--     * if so, returns the result of adding 5 and 6
--     * if not, returns the value false
--    First write it in concrete syntax, then in abstract syntax as a Haskell value.
--
--    3 4 eq if 5 6 add else false
--
ex2 :: Prog
ex2 = [PushN 3, PushN 4, Equ, IfElse [PushN 5, PushN 6, Add] [PushB False]]


-- 4. Write a Haskell function that takes two arguments x and y
--    and generates a StackLang program that adds both x and y to
--    the number on the top of the stack
genAdd2 :: Num -> Num -> Prog
genAdd2 x y = [PushN x, PushN y, Add, Add]


-- 5. Write a Haskell function that takes a list of numbers and
--    generates a StackLang program that computes the sum of all the numbers.
genSum :: [Num] -> Prog
genSum []     = [PushN 0]
genSum (x:xs) = genSum xs ++ [PushN x, Add]
-- genSum (x:xs) = [PushN x] ++ genSum xs ++ [Add]

genSum' :: [Num] -> Prog
genSum' = foldr (\x p -> p ++ [PushN x, Add]) [PushN 0]



--
-- * Semantics of StackLang (later)
--


-- 6. Identify/define a semantics domain for Cmd and
--    for Prog.


-- 7. Define the semantics of a StackLang command (ignore If at first).
cmd = undefined

-- 8. Define the semantics of a StackLang program.
prog = undefined

-- | Run a program on an initially empty stack.
--
--   >>> run ex2
--   Just [Right False]
--
--   >>> run (genSum [1..10])
--   Just [Left 55]
--
--   >>> run [PushN 3, Add, PushN 4]
--   Nothing
--
-- run :: Prog -> Maybe Stack
run p = prog p []









type nat = Int
data dir = N|S|E|W
data Step = go dir nat
data Move = [step]


move = [(go N 3), (go E 4)]


--semantic domain : pos -> pos

--denotational semantics of Step
type pos = (Int, Int)

-- meaning of step is a function from pos -> pos
step :: Step -> pos -> pos
step (go d n) (x, y) = case d of
                        N -> (x, y+n)
                        S -> (x, y-n)
                        E -> (x+n, y)
                        W -> (x-n, y)


move :: Move -> pos -> pos
move []            = id 
move (s:m) = \p -> move m (step s p)
-- move (s:m) = move m . step s

ex :: Move
ex = [Go N 3, Go E 4]
