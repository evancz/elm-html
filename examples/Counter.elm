
import Html (..)
import Html.Tags (..)
import Window

counter : Int -> Html
counter count =
    let px = show (count + 100) ++ "px" in
    div [ style
            [ prop "textAlign"     "center"
            , prop "verticalAlign" "center"
            , prop "lineHeight"    px
            , prop "border"        "1px solid red"
            , prop "width"         px
            , prop "height"        px
            ]
        ]
        [ text (show count) ]

scene : Int -> (Int,Int) -> Element
scene count (w,h) =
    toElement w h (counter count)

main = scene <~ count (every second) ~ Window.dimensions