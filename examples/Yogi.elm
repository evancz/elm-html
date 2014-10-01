
import Html (Html, toElement, style, prop)
import Html.Tags (img)
import Html.Attributes (src)
import Window


-- VIEW

scene : Int -> Element
scene n =
    toElement n n yogi

yogi : Html
yogi =
    img [ src "http://elm-lang.org/yogi.jpg"
        , style
            [ prop "width" "100%"
            , prop "height" "100%"
            ]
        ]
        []


-- SIGNALS

main : Signal Element
main =
    scene <~ size

size : Signal Int
size =
    fps 30
        |> foldp (+) 0
        |> lift (\t -> round (200 + 100 * sin (degrees t / 10)))
