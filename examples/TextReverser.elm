module TextReverser where

import Html exposing (Html, Attribute, text, div, input)
import Html.Attributes exposing (..)
import Html.Events exposing (on, targetValue)
import String


-- VIEW

view : String -> Html
view string =
  div []
    [ stringInput string
    , reversedString string
    ]


reversedString : String -> Html
reversedString string =
  div [ myStyle ] [ text (String.reverse string) ]


stringInput : String -> Html
stringInput string =
  input
    [ placeholder "Text to reverse"
    , value string
    , on "input" targetValue (Signal.message actions.address)
    , myStyle
    ]
    []


myStyle : Attribute
myStyle =
  style
    [ ("width", "100%")
    , ("height", "40px")
    , ("padding", "10px 0")
    , ("font-size", "2em")
    , ("text-align", "center")
    ]


-- SIGNALS

main : Signal Html
main =
  Signal.map view actions.signal

actions : Signal.Mailbox String
actions =
  Signal.mailbox ""
