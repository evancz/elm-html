module Html.Events where
{-| A way to handle any DOM events. The general approach is to set up an input
as defined in `Graphics.Input` and then have each event handler send messages
to one particular input.

It is often helpful to create an [ADT][] so you can have many different kinds
of events as seen in the [TodoMVC][] example.

If you need to create an event listener that is not covered here, use the
`Html.on` function which can create any kind of event listener.

[ADT]: http://elm-lang.org/learn/Pattern-Matching.elm
[TodoMVC]: https://github.com/evancz/elm-todomvc/blob/master/Todo.elm

# All Events
@docs on, value, checked

# Focus Helpers
@docs onblur, onfocus, onsubmit

# Keyboard Helpers
@docs onkeyup, onkeydown, onkeypress

# Mouse Helpers
@docs onclick, ondblclick, onmousemove,
      onmousedown, onmouseup,
      onmouseenter, onmouseleave,
      onmouseover, onmouseout
-}

import Html
import Html (Attribute)
import Json.Decode as Json
import Json.Decode (..)
import Signal


on : String -> Json.Decoder a -> (a -> Signal.Message) -> Attribute
on = Html.on


-- COMMON DECODERS

value : Json.Decoder String
value =
    at ["target", "value"] string


checked : Json.Decoder Bool
checked =
    at ["target", "checked"] bool


-- MouseEvent

onMouse : String -> Signal.Message -> Attribute
onMouse name value =
    on name raw (always value)

onclick : Signal.Message -> Attribute
onclick = onMouse "click"

ondblclick : Signal.Message -> Attribute
ondblclick = onMouse "dblclick"

onmousemove : Signal.Message -> Attribute
onmousemove = onMouse "mousemove"

onmousedown : Signal.Message -> Attribute
onmousedown = onMouse "mousedown"

onmouseup : Signal.Message -> Attribute
onmouseup = onMouse "mouseup"

onmouseenter : Signal.Message -> Attribute
onmouseenter = onMouse "mouseenter"

onmouseleave : Signal.Message -> Attribute
onmouseleave = onMouse "mouseleave"

onmouseover : Signal.Message -> Attribute
onmouseover = onMouse "mouseover"

onmouseout : Signal.Message -> Attribute
onmouseout = onMouse "mouseout"


-- KeyboardEvent

onKey : String -> (Int -> Signal.Message) -> Attribute
onKey name =
    on name ("keyCode" := int)

onkeyup : (Int -> Signal.Message) -> Attribute
onkeyup = onKey "keyup"

onkeydown : (Int -> Signal.Message) -> Attribute
onkeydown = onKey "keydown"

onkeypress : (Int -> Signal.Message) -> Attribute
onkeypress = onKey "keypress"


-- Simple Events

onblur : Signal.Message -> Attribute
onblur message =
    on "blur" raw (always message)

onfocus : Signal.Message -> Attribute
onfocus message =
    on "focus" raw (always message)

onsubmit : Signal.Message -> Attribute
onsubmit message =
    on "submit" raw (always message)


