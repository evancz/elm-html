module TextReverser where

import Graphics.Input as Input
import Html (Html, CssProperty, style, prop, text, on, getValue, toElement)
import Html.Tags (div, input)
import Html.Attributes (..)
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
    div [ style myStyle ] [ text (String.reverse string) ]


stringInput : String -> Html
stringInput string =
    input
        [ placeholder "Text to reverse"
        , value string
        , on "input" getValue actions.handle identity
        , style myStyle
        ]
        []


myStyle : [CssProperty]
myStyle =
    [ prop "width" "100%"
    , prop "height" "40px"
    , prop "padding" "10px 0"
    , prop "font-size" "2em"
    , prop "text-align" "center"
    ]


-- SIGNALS

main : Signal Element
main =
    scene <~ actions.signal

actions : Input.Input String
actions =
    Input.input ""
