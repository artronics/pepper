module Component.Element exposing (..)

import Collage exposing (..)
import Color exposing (..)

type alias CircuitElement = Form


resistor:CircuitElement
resistor =
        circle 20 |> filled (rgb 100 100 100)
