module Component.Schematic exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Mouse exposing (Position)

import Color exposing (..)
import Collage exposing (..)
import Element exposing (..)
import Text
import Time exposing (..)

import Message exposing (..)

type alias Model=
    { conSize:(Int,Int)
    , schSize:(Int,Int)
    , placing: Maybe Form
    }


init: Model
init =
    { conSize = (600,400)
    , schSize = (590,390)
    , placing = Nothing
    }

viewSchematic: Model -> Html Msg
viewSchematic model=
    div [class "art-shc-container" ]
        [ createCanvas model
        ]

createCanvas: Model -> Html Msg
createCanvas model=
    let
        (conW, conH) = model.conSize
        (schW, schH) = model.schSize
    in
        toHtml <|
            container conW conH middle <|
            collage schW schH
                ([schematicRect (schW-10) (schH-10)] ++ (drawPlacingElm model.placing))
--                ([schematicRect schW schH])


schematicRect w h =
    let
        w' = toFloat w
        h' = toFloat h
    in
        rect w' h' |> filled (rgb 0 0 0)

drawPlacingElm: Maybe Form -> List Form
drawPlacingElm elm=
    case elm of
        Nothing -> []
        Just form -> [form]

drawResistor =
        circle 20 |> filled (rgb 100 100 100)
