module Tests exposing (..)

import Expect exposing (..)
import Init exposing (..)
import Model exposing (..)
import Msg exposing (..)
import Test exposing (..)
import Update exposing (..)


suite =
    describe "calculator"
        [ test "Starts with 0" <|
            \_ ->
                -- equal 0 (display init)
                init
                    |> display
                    |> equal 0
        , test "When click 5 then 5 is displayed" <|
            \_ ->
                init
                    |> update (DigitClick 5)
                    |> display
                    |> equal 5
        , test "When click 5 and 4, then 54 is displayed" <|
            \_ ->
                init
                    |> update (DigitClick 5)
                    |> update (DigitClick 4)
                    |> display
                    |> equal 54
        , test "When click 5 then click '+' then 5 is displayed" <|
            \_ ->
                init
                    |> update (DigitClick 5)
                    |> update PlusClick
                    |> display
                    |> equal 5
        , test "When click 5 and '+' and 4 then 4 is displayed" <|
            \_ ->
                init
                    |> update (DigitClick 5)
                    |> update PlusClick
                    |> update (DigitClick 4)
                    |> display
                    |> equal 4
        , test "When click 5 and '+' and 4, 7 then 47 is displayed" <|
            \_ ->
                init
                    |> update (DigitClick 5)
                    |> update PlusClick
                    |> update (DigitClick 4)
                    |> update (DigitClick 7)
                    |> display
                    |> equal 47
        , test "When click 5 and '+' and 4  and '+' then 9 is displayed" <|
            \_ ->
                init
                    |> update (DigitClick 5)
                    |> update PlusClick
                    |> update (DigitClick 4)
                    |> update PlusClick
                    |> display
                    |> equal 9
        , test "When click 5 and '+' and '+' then 5 is displayed" <|
            \_ ->
                init
                    |> update (DigitClick 5)
                    |> update PlusClick
                    |> update PlusClick
                    |> display
                    |> equal 5
        , test "When click 5 and '+' and '4' and '=' then 9 is displayed" <|
            \_ ->
                init
                    |> update (DigitClick 5)
                    |> update PlusClick
                    |> update (DigitClick 4)
                    |> update EqualClick
                    |> display
                    |> equal 9
        ]
