module BaseStuff exposing (..)
import Time exposing (Time)
import Random exposing (Seed, initialSeed)
import Collage exposing (Form)
import Background exposing (background)

-- The actual types

type alias InitFlags =
    { width : Int
    , height : Int
    , seed : Int
    }

type alias GameData =
    { width : Int
    , height : Int
    , flWidth : Float
    , flHeight : Float
    , paused : Bool
    , gameWinY : Float
    , characterPosX : Float
    , characterPosY : Float
    , time : Time
    , platforms : List (Float, Float)
    , worldSeed : Int
    , background : Form
    }

type GameMsg = NothingHappened | MouseMove (Float, Float) | Tick Time | PauseToogle

-- Base functions

initGameData : InitFlags -> (GameData, Cmd GameMsg)
initGameData { width, height, seed } =
    (
        { width = width
        , height = height
        , flWidth = toFloat width
        , flHeight = toFloat height
        , paused = True
        , gameWinY = 0
        , characterPosX = 0
        , characterPosY = 0
        , time = 0
        , platforms = []
        , worldSeed = seed
        , background = background (toFloat width) (toFloat height)
        }
    , Cmd.none
    )
