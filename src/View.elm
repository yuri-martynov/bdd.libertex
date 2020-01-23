module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import List
import Model exposing (..)
import Update exposing (display)
import Msg exposing (..)


btn msg label =
    button
        [ onClick msg, class "button" ]
        [ text label ]

buttons =
    [ btn PlusClick "+"
    , btn Msg.EqualClick "="
    ]

digit d =
    btn (DigitClick d) (String.fromInt d)

digits =
    List.range 0 9
        |> List.map digit


view model =
    css
        :: screen model
        :: buttons
        ++ digits
        |> div [ class "calc-body" ]
        |> List.singleton
        |> div [ class "container" ]


screen model =
    [ typed model
    ]
        |> div [ class "calc-screen" ]


typed model =
    [ model |> display |> String.fromFloat |> text
    , "_" |> text |> List.singleton |> span [ class "blink-me" ]
    ]
        |> div [ class "calc-typed" ]










css =
    node "link" [ rel "stylesheet", href "style.css" ] []



-- operation model =
--     model
--         |> String.fromFloat
--         |> text
--         |> List.singleton
--         |> div [ class "calc-operation" ]