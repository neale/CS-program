
module HW4 where
---------------------------------
--Part 1 Define Abstract Syntax--
---------------------------------

type Nat     = Int

data Reg   = A | B
  deriving (Eq, Show)

data Expr  = Lit Nat
           | LoadReg Reg
           | ExPlus Expr Expr
           | ExLeq   Expr Expr
           | Not    Expr
           | And    Expr Expr
  deriving (Eq, Show)

data Stmt  = StoreReg Reg Expr
           | If Expr Stmt Stmt
  deriving (Eq, Show)

type Prog  = [Stmt]

type State = (Int, Int)


data Val   = I Int
           | Bl Bool
           | Error
  deriving (Eq, Show)

-- type Val = Maybe (Either Int Bool)


---------------------------------
--Part 2 Encode Example Program--
---------------------------------
p :: Prog

p = [(StoreReg A (Lit 3)), 

        (StoreReg B (ExPlus (LoadReg A) (Lit 2))), 

        If (ExLeq (LoadReg A) (LoadReg B))
            (StoreReg A (ExPlus (LoadReg A) (LoadReg A)))
            (StoreReg B (ExPlus (LoadReg B) (LoadReg B)))
        ,

        StoreReg B (ExPlus (LoadReg A) (LoadReg B))
        ]

------------------------------------
--Part 3 Create Samantic Functions--
------------------------------------

expr :: Expr -> State -> Val
--given an Int, and a state
expr (Lit x) (l, r)      = I x
                                      

--given a register to load from, and a state
expr (LoadReg x) (l, r)  = case x of
                              A -> expr (Lit l) (l, r)
                              B -> expr (Lit r) (l, r)

--given two Ints to add, and a state
expr (ExPlus x y) (l, r) = case (x, y) of
                              (Lit x, Lit y) -> expr (Lit (x + y)) (l, r)
                              _              -> Error

--given two ints to check equality, and a state
expr (ExLeq x y) (l, r)   = case (x, y) of
                              (Lit x, Lit y) -> Bl (x <= y)
                              _              -> Error

--given an bool to negate, and a state
expr (Not b) (l, r)      = case (expr b (l, r)) of
                              Bl x -> Bl (not x)
                              _    -> Error

--given bools to And together, and a state
expr (And bl br) (l, r)  = case (expr bl (l, r), (expr br (l, r))) of
                              (Bl x, Bl y) -> Bl (x && y)
                              _              -> Error
                                        



--
stmt :: Stmt -> State -> Maybe State
stmt (StoreReg x e) (l, r) = case (expr e (l, r)) of
                                I res -> case x of
                                      A -> Just (res, r)
                                      B -> Just (l, res)
                                _       -> Nothing
                                      
--stmt (If e x y) (l, r)     = case (expr e (l, r)) oqf
--                                Bl True  -> case (expr y (l, r)) of
--                                              (expr x (l, r))
--                                Bl False -> (expr y (l, r))
--                                _        -> Nothing


--

prog :: Prog -> State -> Maybe State
prog (s:xs) (l, r) = prog (stmt s (l, r)) (l, r)


--


