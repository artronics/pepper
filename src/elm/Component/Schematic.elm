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

import Utils exposing (..)
import Message exposing (..)

type alias Model=
    { canvasSize:(Int,Int)
    , placing: Maybe Form
    }


init: Model
init =
    { canvasSize = (842,595)
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
        (canvasW, canvasH) = model.canvasSize
    in
        toHtml <|
            container (canvasW+50) (canvasH+50) middle <|
            collage canvasW canvasH
                ([schematicRect canvasW canvasH] ++ (drawPlacingElm model.placing))
--                ([schematicRect schW schH])


schematicRect w h =
     rect|> toFloat2 w h |> filled (rgb 0 0 0)

drawPlacingElm: Maybe Form -> List Form
drawPlacingElm elm=
    case elm of
        Nothing -> []
        Just form -> [form]

--Things related to canvas size and paper size
type Paper
    =A4
type Dpi
    = Low
