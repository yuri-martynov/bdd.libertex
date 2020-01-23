module Lambda exposing (..)


add x y =
    x + y


five =
    add 2 3


five_ =
    3 |> add 2


multiply x y = x * y

double x = x * 2

get_18 = 
    1
    |> add 2
    |> multiply 3
    |> double

get_18_ = 
    double ( multiply 3 (add 2 1) )


