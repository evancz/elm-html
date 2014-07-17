module Html where
{-| This library gives you raw bindings to HTML, allowing you to reuse existing
CSS with Elm. It uses the same diffing technique for rendering as seen in
Facebook's React library and in Elm's core rendering system.

# Create
@docs text, node, eventNode

# Embed
@docs toElement

# HTML Attributes and CSS Properties
We start with two type aliases that allow us to share some useful functions:
@docs Attribute, CssProperty

With the common `Fact` type, it is possible to use the same convenience
functions for both attributes and properties.
@docs (:=), bool

### Fact Helpers
@docs px, em, pct, color

-}

import Color
import Native.Html
import String (show, append)
import Html.Events (EventListener)

data Html = Html

{-| Create a DOM node with a tag name, a list of HTML attributes like
`className` and `id`, a list of CSS properties like `color`, and a list of
child nodes.

      node "div"
          [ "className" := "message"
          , "id" := "greeting"
          ]
          [ "border" := "1px solid red"
          , "width"  := "100px"
          , "height" := "100px"
          ]
          [ text "hello"
          ]

Notice that we use `className` to set the class of the div. All HTML attributes
and CSS properties must be set using the JavaScript version of their name, so
`class` becomes `className`, `float` becomes `cssFloat`, etc.
-}
node : String -> [Attribute] -> [CssProperty] -> [Html] -> Html
node = Native.Html.node

{-| Create a DOM node, just like with the `node` function, but you can add event
listeners. See the `Html.Events` library for more details.

      eventNode "button"
          [ "className" := "clear-completed" ]
          []
          [ onclick actions.handle (\mouseEvent -> mouseEvent.button) ]
          [ text "Clear Completed Tasks" ]
-}
eventNode : String -> [Attribute] -> [CssProperty] -> [EventListener] -> [Html] -> Html
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

data Fact = Fact
type Attribute = Fact
type CssProperty = Fact

{-| Create a basic HTML attribute or CSS property. Best used with helper
functions that make string generation easier:

    "visibility" := "hidden"

    "width" := "40px"
    "width" := px 40

    "color" := "rgb(204, 0, 0)"
    "color" := color red
-}
(:=) : String -> String -> Fact 
(:=) = Native.Html.pair

infixr 0 :=

{-| Create a basic HTML attribute or CSS property that has a boolean value.
This is needed for HTML attributes such as `hidden` and `allowfullscreen` which
are not associated with any value:

    bool "allowfullscreen" True

    bool "hidden" (isMinimized || isComplete)
-}
bool : String -> Bool -> Fact
bool = Native.Html.pair

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
