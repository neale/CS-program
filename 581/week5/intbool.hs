-- | A simple expression language with two types.
module IntBool where


-- | 1. Define the abstract syntax
--
--   int  ::= (any integer)
--   bool ::= `true` | `false`
--   expr ::= int
--         |  bool
--         |  –expr
--         |  expr + expr
--         |  expr = expr
--         |  `if` expr `then` expr `else` expr
--
data Expr = LitI Int             -- a literal integer
          | LitB Bool            -- a literal boolean
          | Add  Expr Expr       -- integer addition
          | Neg  Expr            -- integer or boolean negation
          | Equ  Expr Expr       -- check whether two values are equal
          | If   Expr Expr Expr  -- check whether two values are equal
  deriving (Eq,Show)


-- 2. Identify/define the semantic domain for this language

data Value = I Int
           | B Bool
           | Error
  deriving (Eq,Show)

-- type Value = Maybe (Either Int Bool)


-- 3. Define the valuation function

eval :: Expr -> Value
eval (LitI i)   = I i
eval (LitB b)   = B b
eval (Add l r)  = case (eval l, eval r) of
                    (I i, I j) -> I (i+j)
                    _          -> Error
eval (Neg e)    = case eval e of
                    I i -> I (negate i)
                    B b -> B (not b)
                    _   -> Error
eval (Equ l r)  = case (eval l, eval r) of
                    (I i, I j) -> B (i == j)
                    (B b, B c) -> B (b == c)
                    _          -> Error
eval (If c t e) = case eval c of
                    B True  -> eval t
                    B False -> eval e
                    _       -> Error
