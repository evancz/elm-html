
import Html (Html, toElement, img)
import Html.Attributes (src, style)
import Graphics.Element (Element)
import Signal (Signal, (<~), foldp, map)
import Time (fps)
import Window


-- VIEW

scene : Int -> Element
scene n =
    toElement n n yogi

yogi : Html
yogi =
    img [ src "http://elm-lang.org/yogi.jpg"
        , style
            [ ("width", "100%")
            , ("height", "100%")
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
        |> map (\t -> round (200 + 100 * sin (degrees t / 10)))
