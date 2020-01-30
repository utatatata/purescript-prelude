{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "prelude"
, dependencies = [] : List Text
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
