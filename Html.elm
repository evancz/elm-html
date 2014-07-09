module Html where
{-| This library gives you raw bindings to HTML, allowing you to reuse existing
CSS with Elm. It uses the same diffing technique for rendering as seen in Facebook
s React library and in Elm's core rendering system.

There currently is **no support for handling DOM events**. We are working on it,
this will come in a future release!

# Create
@docs text, node

# Embed
@docs toElement

# Helpers
@docs (:=), px, em, pct, bool, color

-}

import Color
import Native.Html
import String (show, append)
import Html.Event (EventListener)

data Html = Html

{-| Create an arbitrary DOM node with a tag name, a list of HTML attributes
like `className` and `id`, a list of CSS properties like `color`, and a list
of child nodes.

    node "div"
         [ "className" := "intro" ]
         [ "border" := "1px solid red" ]
         [ text "hello" ]

Notice we use the `(:=)` infix operator to make things look a bit more familiar.
-}
node : String -> [(String,String)] -> [(String,String)] -> [Html] -> Html
node = Native.Html.node

eventNode : String -> [(String,String)] -> [(String,String)] -> [EventListener] -> [Html] -> Html
eventNode = Native.Html.eventNode

{-| Just put plain text in the DOM. It will escape the string so that it appears
exactly as you specify.

    text "Hello World!"
-}
text : String -> Html
text = Native.Html.text

{-| Embed an `Html` value in Elm's rendering system. Like any other `Element`,
this requires a known width and height, so it is not yet clear if this can be
made more convenient in the future.
-}
toElement : Int -> Int -> Html -> Element
toElement = Native.Html.toElement


-- Utilities

{-| An infix operator to make creating tuples more pleasant. The following
expressions are equivalent:

    "color" := "red"
    ("color", "red")

This is a trick to make HTML attributes and CSS properties look more familiar.
-}
(:=) : String -> String -> (String, String)
(:=) = (,)

{-| Turn a float into a properly formatted CSS pixel value:

    px 100 == "100px"
    px 240 == "240px"
-}
px : Float -> String
px n = append (show n) "px"

{-| Turn a float into a properly formatted CSS em value:

    em 1.5 == "1.5em"
    em 2   == "2em"
-}
em : Float -> String
em n = append (show n) "em"

{-| Turn a float between 0 and 1 into a properly formatted CSS percentage:

    pct 1   == "100%"
    pct 0.5 == "50%"
-}
pct : Float -> String
pct n = append (show (100 * n)) "%"

{-| Turn a boolean into the CSS equivalent:

    bool True == "true"
    bool False == "false"
-}
bool : Bool -> String
bool b = if b then "true" else "false"

{-| Turn an Elm color into the equivalent CSS value:

    color red  == "rgb(204, 0, 0)"
    color blue == "rgb(52, 101, 164)"
-}
color : Color -> String
color clr = 
    let c = Color.toRgb clr
        rgb = show c.red ++ ", " ++ show c.green ++ ", " ++ show c.blue
    in
        if c.alpha == 1
        then "rgb(" ++ rgb ++ ")"
        else "rgba(" ++ rgb ++ ", " ++ show c.alpha ++ ")"
