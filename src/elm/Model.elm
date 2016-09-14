module Model exposing (..)

import Collage exposing (Form)
import Component.Toolbox as Tlb exposing(..)
import Component.Schematic as Sch exposing(..)

type alias Model =
    { schematic: Sch.Model
    , toolbox: Tlb.Model
    }

initModel:Model
initModel =
    { schematic = Sch.init
    , toolbox = Tlb.init
    }


