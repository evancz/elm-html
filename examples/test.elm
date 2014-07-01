
import Html
import Html (..)
import Window

counter : Float -> Html
counter count =
    node "div" []
        [ "textAlign"     := "center"
        , "verticalAlign" := "center"
        , "lineHeight"    := px (100 + count)
        , "border"        := "1px solid red"
        , "width"         := px (100 + count)
        , "height"        := px (100 + count)
        ]
        [ text (show count) ]

scene : Int -> (Int,Int) -> Element
scene count (w,h) =
    Html.toElement w h (counter (toFloat count))

main = scene <~ count (every second) ~ Window.dimensions