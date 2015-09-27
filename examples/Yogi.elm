
import Html exposing (Html, img)
import Html.Attributes exposing (src, style)
import Time exposing (fps)
import Window


-- VIEW

view : Int -> Html
view n =
  img
    [ src "http://elm-lang.org/imgs/yogi.jpg"
    , style
        [ ("width", toString n ++ "px")
        , ("height", toString n ++ "px")
        ]
    ]
    []


-- SIGNALS

main : Signal Html
main =
  Signal.map view size


size : Signal Int
size =
  fps 30
    |> Signal.foldp (+) 0
    |> Signal.map (\t -> round (200 + 100 * sin (degrees t / 10)))
