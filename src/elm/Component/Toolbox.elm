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
viewToolbox model = ul[class "art-toolbox"] (createIcons model)

handleOnClick = 0

createIcons activeIndex =
    List.indexedMap (\index icon->
            let
                (key,css,form) = icon
            in
                li[][i[classList [(css,True),("active",activeIndex == index)], onClick <| Placing form index][]]
        ) icons

icons =
    [ ("selection","art-selection",Nothing)
    , ("resistor","art-resistor", Just Cir.resistor)
    ]
