module Main where

class Duck x where
  quack :: x -> String
  dance :: x-> String

class EatDuck x where
  eat :: (Duck d) => x -> d -> String

data Mallard = Mallard

instance Duck Mallard where
  quack _ = "quack quack"
  dance _ = " _/¯ "

data Wolf = Wolf

instance Duck Wolf where
  quack _ = "QUACK QUACK WHOO"
  dance _ = " ¯\\_()_/¯ "

instance EatDuck Wolf where
  eat _ _ = " 😈 "

twoDucksAlone :: (Duck x1, Duck x) => x -> x1 -> IO ()
twoDucksAlone duck wolf = do
  putStrLn (quack duck)
  putStrLn (quack wolf)
  putStrLn (dance duck)
  putStrLn (dance wolf)

main :: IO ()
main = do
  let wolf = Wolf
  let duck = Mallard
  twoDucksAlone duck wolf
  putStrLn (wolf `eat` duck)
