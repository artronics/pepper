module Model exposing (..)

import Collage exposing (Form)
import Component.Toolbox as Tlb exposing(..)
import Component.Schematic as Sch exposing(..)
import Mouse exposing (Position)

type alias Model =
    { position: Position
    , schematic: Sch.Model
    , toolbox: Tlb.Model
    }

initModel:Model
initModel =
    { position = {x=0, y=0}
    , schematic = Sch.init
    , toolbox = Tlb.init
    }


