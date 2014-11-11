module Html where
{-| This module gives you *raw* bindings to HTML. There are no special tricks
here, just the bare essentials to use HTML.

Use `Html.Tags`, `Html.Attributes`, and `Html.Events` for helper functions like
`div` to make your code more type-safe and a bit nicer to read. If ever you need
to go outside those functions though, this core `Html` module has everything you
need.

In future releases, we plan to break out this module and the core diffing
algorithm so that anyone can build on top of it with a minimal set of
dependencies.

# Create
@docs text, node

# Embed
@docs toElement

# HTML Attributes
@docs attr, toggle, key

# CSS Properties
@docs style, prop

# Events
@docs on

-}

import Color
import Json.Decode as Json
import Graphics.Element (Element)
import Native.Html
import Signal

type Html = Html

{-| Create a DOM node with a tag name, a list of HTML attributes that can
include styles and event listeners, a list of CSS properties like `color`, and
a list of child nodes.

      node "div" [] [ text "Hello!" ]

      node "div"
          [ attr "id" "greeting" ]
          [ text "Hello!" ]
-}
node : String -> [Attribute] -> [Html] -> Html
node = Native.Html.node

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


-- ATTRIBUTES

type Attribute = Attribute

{-| Create a basic HTML attribute.

      node "div"
          [ attr "id" "greeting"
          , attr "className" "message"
          ]
          [ text "Hello!" ]

Check out `Html.Attributes` for helper functions like
`(id : String -> Attribute)` and `(class : String -> Attribute)` that make it
easier to specify attributes.

Notice that we use `className` to set the class of the div. All HTML attributes
and CSS properties must be set using the JavaScript version of their name, so
`class` becomes `className`, `float` becomes `cssFloat`, etc.
-}
attr : String -> String -> Attribute
attr = Native.Html.pair

{-| Some HTML attributes are not associated with a value, they are either there
or not. The `toggle` function lets create this kind of attribute.

      node "input"
          [ toggle "autofocus" True
          , toggle "readonly" False
          ]
          []

See `Html.Attributes` for helper functions like
`(autofocus : Bool -> Attribute)` and `(readonly : Bool -> Attribute)`.
-}
toggle : String -> Bool -> Attribute
toggle = Native.Html.pair


{-| A special attribute that uniquely identifies a node during the diffing
process. If you have a list of 20 items and want to remove the 4th one, adding
keys ensures that you do not end up doing misaligned diffs on the following 15
items.
-}
key : String -> Attribute
key k = Native.Html.pair "key" k


-- STYLES

type CssProperty = CssProperty

{-| This function makes it easier to specify a set of styles.

      node "div"
          [ style
              [ prop "backgroundColor" "red"
              , prop "height" "90px"
              , prop "width" "100%"
              ]
          ]
          [ text "Hello!" ]

There is no `Html.Styles` module because best practices for working with HTML
suggest that this should primarily be specified in CSS files. So the general
recommendation is to use this function lightly.
-}
style : [CssProperty] -> Attribute
style = Native.Html.style


{-| Create a CSS property. -}
prop : String -> String -> CssProperty
prop = Native.Html.pair


-- EVENTS

on : String -> Json.Decoder a -> (a -> Signal.Message) -> Attribute
on = Native.Html.on
