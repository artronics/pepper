import Html exposing (Html,div, button, text)
import Html.App exposing (program)
import Html.Events exposing (onClick)

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
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ]
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
