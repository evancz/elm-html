module Html.Events where
{-| 
It is often helpful to create an [ADT][] so you can have many different kinds
of events as seen in the [TodoMVC][] example.

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

import Html (Attribute)
import Json.Decode as Json
import Json.Decode (..)
import Signal
import VirtualDom


on : String -> Json.Decoder a -> (a -> Signal.Message) -> Attribute
on = VirtualDom.on


-- COMMON DECODERS

value : Json.Decoder String
value =
    at ["target", "value"] string


checked : Json.Decoder Bool
checked =
    at ["target", "checked"] bool


-- MouseEvent

messageOn : String -> Signal.Message -> Attribute
messageOn name value =
    on name raw (always value)

onclick : Signal.Message -> Attribute
onclick = messageOn "click"

ondblclick : Signal.Message -> Attribute
ondblclick = messageOn "dblclick"

onmousemove : Signal.Message -> Attribute
onmousemove = messageOn "mousemove"

onmousedown : Signal.Message -> Attribute
onmousedown = messageOn "mousedown"

onmouseup : Signal.Message -> Attribute
onmouseup = messageOn "mouseup"

onmouseenter : Signal.Message -> Attribute
onmouseenter = messageOn "mouseenter"

onmouseleave : Signal.Message -> Attribute
onmouseleave = messageOn "mouseleave"

onmouseover : Signal.Message -> Attribute
onmouseover = messageOn "mouseover"

onmouseout : Signal.Message -> Attribute
onmouseout = messageOn "mouseout"


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
    messageOn "blur"

onfocus : Signal.Message -> Attribute
onfocus message =
    messageOn "focus"

onsubmit : Signal.Message -> Attribute
onsubmit message =
    messageOn "submit"


