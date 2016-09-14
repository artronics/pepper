import Html exposing (..)
import Html.App exposing (program)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Component.Toolbox exposing (..)

main : Program (Never)
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


type alias Model = Int

init = (0, Cmd.none)

subscriptions: Model -> Sub Msg
subscriptions = \_ -> Sub.none

view: Model -> Html Msg
view model =
  div [class "art-layout"]
    [ div [class "art-main-row"]
        [ div [id "art-toolbox"]
            [toolbox]
        , div [id "art-schematics"]
            [text "schematics"]
        , div [id "art-explorer"]
            [text "explorer"]
    ]
    , div [id "art-status"]
        [text "status"]
  ]

type Msg = Increment | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    (update' msg model ,Cmd.none)

update' : Msg -> Model -> Model
update' msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1
