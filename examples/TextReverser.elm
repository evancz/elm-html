module TextReverser where

import Graphics.Input as Input
import Html (Html, Attribute, text, toElement, div, input)
import Html.Attributes (..)
import Html.Events (on, targetValue)
import Graphics.Element (Element)
import Signal
import String


-- VIEW

scene : String -> Element
scene string =
    toElement 400 200 (stringReverser string)


stringReverser : String -> Html
stringReverser string =
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
        , on "input" targetValue (Signal.send updates << identity)
        , myStyle
        ]
        []


myStyle : Attribute
myStyle = style
    [ ("width", "100%")
    , ("height", "40px")
    , ("padding", "10px 0")
    , ("font-size", "2em")
    , ("text-align", "center")
    ]


-- SIGNALS

main : Signal Element
main =
    Signal.subscribe updates |> Signal.map scene

updates : Signal.Channel String
updates =
    Signal.channel ""
