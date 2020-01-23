module Update exposing (..)

import Model exposing (..)
import Msg exposing (..)


update msg model =
    case ( msg, model ) of
        ( DigitClick d, Empty ) ->
            Number (toFloat d)

        ( DigitClick d, Number n ) ->
            Number (n * 10 + toFloat d)

        ( PlusClick, _ ) ->
            Add model Empty

        ( EqualClick, _ ) ->
            Result model

        ( _, Add a b) ->
            Add a (update msg b)

        _ -> model



display model =
    case model of
        Add a Empty ->
            calc a

        Add _ b ->
            calc b

        _ ->
            calc model

calc model =
    case model of
        Empty ->
            0
        Number n ->
            n
        Add a b ->
            calc a + calc b
        Result a ->
            calc a








        
