import Html exposing (..)
import Html.App exposing (program)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json exposing ((:=))

import Color exposing (..)
import Collage exposing (..)
import Element exposing (..)
import Text
import Time exposing (..)

main : Program (Never)
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


type alias Model =
    { schematic : Maybe Form}


init = ({schematic=Nothing}, Cmd.none)

subscriptions: Model -> Sub Msg
subscriptions = \_ -> Sub.none

view: Model -> Html Msg
view model =
  div [class "art-layout"]
    [ div [class "art-main-row"]
        [ div [id "art-toolbox"]
            [viewToolbox]
        , div [id "art-schematics"]
            [viewSchematic model]
        , div [id "art-explorer"]
            [Html.text "explorer"]
    ]
    , div [id "art-status"]
        [Html.text "status"]
  ]

type Msg
    = Schematic


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    (update' msg model ,Cmd.none)

update' : Msg -> Model -> Model
update' msg model =
  case msg of
    Schematic ->
        {model | schematic = Just drawResistor }


viewToolbox = div[class "art-toolbox"]
    [ i[class "art-resistor",onClick Schematic][]
    ]



schematicModel =
    { conSize=(400,600)
    , schSize=(390,590)
    }

viewSchematic model=
    let
        (conW, conH) = schematicModel.conSize
        (schW, schH) = schematicModel.schSize
    in
        toHtml <|
            container conW conH middle <|
            collage schW schH
                ([ rect schW schH |> filled (rgb 0 0 0 )]++ (drawElement model.schematic))

drawElement elm =
    case elm of
        Nothing ->[]
        Just _ -> [drawResistor]

drawResistor = circle 20 |> filled (rgb 100 100 100)
