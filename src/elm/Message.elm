module Message exposing (..)

import Component.Element exposing (..)

type alias ToolboxIndex = Int
type Msg
    = NoOp
    | Placing (Maybe CircuitElement) ToolboxIndex

