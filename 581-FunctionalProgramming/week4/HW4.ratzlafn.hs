module HW4 where

import Prelude hiding (Left)

type Nat   = Int

type Macro = String

data Prog  = DefMain Defs Stmt

type Defs  = [Def]

type Stmts = [Stmt]

data Card  = North | South | East | West
    deriving (Eq, Show)

data Dir   = Right | Front | Left | Back
    deriving (Eq, Show)

data Def   = DefMacro Macro Stmt

data Test  = Not Test
           | Facing Card
           | Clear Dir
           | Beeper 
           | Empty
    deriving (Eq, Show)

data Stmt  = Shutdown
           | Move
           | Pickb
           | Putb
           | Turn Dir
           | Call Macro
           | IterateTimes Nat Stmt
           | IfThen Test Stmt Stmt
           | WhileDo Test Stmt
           | BeginEnd Stmts
    deriving (Eq, Show)

--part II: define AST using above syntax
--
--fetch

fetcher =  DefMain [(DefMacro "fetch" (BeginEnd [(WhileDo (Not Beeper) (IfThen (Clear Front) Move Shutdown)),  Pickb]))] (BeginEnd [ Putb, (Call"fetch"), (Turn Back), (Call "fetch"), Putb, Putb, Shutdown])


--part III
mDef    :: Def  -> [Macro]
mDef (DefMacro s _) = [s]
 
mDefs   :: Defs -> [Macro]
mdefs []     = []
mDefs (d:ds) = (mDef d) ++ (mDefs ds)

macros :: Prog -> [Macro]
macros (DefMain d  _) = mDefs d

--im so sorry
--the general flow is, if not facing left then turn until you are
--then move in a square x by y. else move in a square x by y
rectangle :: Int -> Int -> Stmt
rectangle x y = IfThen (Not (Facing East)) (BeginEnd [WhileDo (Not (Facing East)) (Turn Left), (IterateTimes x Move), (Turn Left), (IterateTimes y Move), (Turn Left), (IterateTimes x Move), (Turn Left), (IterateTimes y Move)]) (BeginEnd [(IterateTimes x Move), (Turn Left), (IterateTimes y Move), (Turn Left), (IterateTimes x Move), (Turn Left), (IterateTimes y Move)])
