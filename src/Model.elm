module Model exposing (..)


type Model 
    = Empty
    | Number Float
    | Add Model Model
    | Result Model



