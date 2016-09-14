module Component.Toolbox exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String

import Message exposing (..)
import Component.Element as Cir exposing (..)

type alias Model = Int

init:Model
init = 0

viewToolbox: Model -> Html Msg
viewToolbox model = div[class "art-toolbox"]
    [ i[class "art-resistor", onClick <|Placing (Just Cir.resistor)][text (toString model)]
    ]
