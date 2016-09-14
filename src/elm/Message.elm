module Message exposing (..)

import Component.Element exposing (..)

type Msg
    = NoOp
    | Placing (Maybe CircuitElement)

