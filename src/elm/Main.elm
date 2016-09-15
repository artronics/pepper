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

import Model exposing (..)
import Message exposing (..)

import Component.Toolbox exposing (viewToolbox)
import Component.Schematic exposing (viewSchematic)


main : Program (Never)
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


model:Model
model = model

init:(Model,Cmd a)
init = (initModel,Cmd.none)

subscriptions: Model -> Sub Msg
subscriptions = \_ -> Sub.none

view: Model -> Html Msg
view model =
  div [class "art-layout"]
    [ div [class "art-main-row"]
        [ div [id "art-toolbox"]
            [viewToolbox model.toolbox]
        , div [id "art-schematics"]
            [viewSchematic model.schematic]
        , div [id "art-explorer"]
            [Html.text "explorer"]
    ]
    , div [id "art-status"]
        [Html.text "status"]
  ]



update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
   (update' msg model, Cmd.none)

update' : Msg -> Model -> Model
update' msg model =
  case msg of
    NoOp -> model
    Placing Nothing  toolboxIndex-> {model | toolbox = toolboxIndex}
    Placing (Just form) toolboxIndex->
        let
            schematic = model.schematic
        in
            {model | schematic = {schematic | placing = Just form},toolbox = toolboxIndex}

