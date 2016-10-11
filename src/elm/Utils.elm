module Utils exposing (..)

toFloat2 i1 i2 f =
    let
        w = toFloat i1
        h = toFloat i2
    in
        f w h
