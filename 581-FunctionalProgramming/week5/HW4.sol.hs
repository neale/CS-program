module HW4 where

import Prelude hiding (Either(..))

import Data.List


-- ** 1. Abstract syntax

type Nat   = Int
type Macro = String

type Prog = (Defs,Stmt)

type Defs  = [Def]
type Stmts = [Stmt]

data Card = North | South | East  | West  deriving (Eq,Show)
data Dir  = Front | Back  | Right | Left  deriving (Eq,Show)

type Def  = (Macro,Stmt)

data Test = Not    Test
          | Facing Card
          | Clear  Dir
          | Beeper
          | Empty
  deriving (Eq,Show)

data Stmt = Shutdown
          | Move
          | Pick
          | Put
          | Turn    Dir
          | Call    Macro
          | Iterate Nat  Stmt
          | If      Test Stmt Stmt
          | While   Test Stmt
          | Block   Stmts
  deriving (Eq,Show)


-- ** 2. Example program

fetcher :: Prog
fetcher = ([("fetch",fetch)], main)
  where
    fetch = Block
      [ While (Not Beeper) 
          (If (Clear Front) Move Shutdown)
      , Pick ]
    main = Block
      [ Put
      , Call "fetch"
      , Turn Back
      , Call "fetch"
      , Put
      , Put
      , Shutdown ]


-- ** 3. Get macro definitions

-- | Get all macro names from a program.
macros :: Prog -> [Macro]
macros (defs,_) = map fst defs


-- ** 4. Draw rectangle

-- | Generate a program that draws a rectangle of the given width and height,
--   starting from the lower-left corner.
rectangle :: Int -> Int -> Stmt
rectangle w h = Block
  [ While (Not (Facing North)) (Turn Right)
  , Iterate h Move
  , Turn Right
  , Iterate w Move
  , Turn Right
  , Iterate h Move
  , Turn Right
  , Iterate w Move
  , Turn Right ]


-- ** 5. Pretty printing

-- | Pretty print a program.
pretty :: Prog -> String
pretty (ds,s) = unlines (map prettyDef (ds ++ [("main",s)]))

-- | Pretty print a definition.
prettyDef :: Def -> String
prettyDef (m,s) = "define " ++ m ++ " as\n" ++ prettyStmt 0 s

-- | Pretty print a cardinal direction.
prettyCard :: Card -> String
prettyCard North = "north"
prettyCard South = "south"
prettyCard East  = "east"
prettyCard West  = "west"

-- | Pretty print a relative direction.
prettyDir :: Dir -> String
prettyDir Front = "front"
prettyDir Back  = "back"
prettyDir Right = "right"
prettyDir Left  = "left"

-- | Pretty print a test.
prettyTest :: Test -> String
prettyTest (Not t)    = "not " ++ prettyTest t
prettyTest (Facing c) = "facing " ++ prettyCard c ++ "?"
prettyTest (Clear d)  = "clear " ++ prettyDir d ++ "?"
prettyTest Beeper     = "beeper?"
prettyTest Empty      = "empty?"

-- | Pretty print a statement at the given indent level.
prettyStmt :: Int -> Stmt -> String
prettyStmt n s = indent ++
    case s of
      Shutdown    -> "shutdown"
      Move        -> "move"
      Pick        -> "pick beeper"
      Put         -> "put beeper"
      Turn d      -> "turn " ++ prettyDir d
      Call m      -> "call " ++ m
      Iterate n s -> "iterate " ++ show n ++ " times\n" ++ prettyStmt (n+1) s
      If c t e    -> "if " ++ prettyTest c ++ " then\n" ++ prettyStmt (n+1) t
                     ++ "\n" ++ indent ++ "else\n" ++ prettyStmt (n+1) e
      While c s   -> "while " ++ prettyTest c ++ " do\n"
                     ++ prettyStmt (n+1) s
      Block ss    -> "begin\n" ++ intercalate ";\n" (map (prettyStmt (n+1)) ss)
                     ++ ";\n" ++ indent ++ "end"
  where
    indent  = replicate (2*n) ' '
