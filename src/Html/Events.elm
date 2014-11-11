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

# Simple Events
@docs onblur, onfocus, onsubmit

# Keyboard Events
The `KeyboardEvent` type is defined in the `Html` module.
@docs onkeyup, onkeydown, onkeypress

# Mouse Events
@docs onclick, ondblclick, onmousemove,
      onmousedown, onmouseup,
      onmouseenter, onmouseleave,
      onmouseover, onmouseout
-}

import Html (Attribute, KeyboardEvent, on, getKeyboardEvent, getAnything)
import Signal


-- MouseEvent

onMouse : String -> Signal.Message -> Attribute
onMouse name value =
    on name getAnything (always value)

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

onKey : String -> (KeyboardEvent -> Signal.Message) -> Attribute
onKey name =
    on name getKeyboardEvent

onkeyup : (KeyboardEvent -> Signal.Message) -> Attribute
onkeyup = onKey "keyup"

onkeydown : (KeyboardEvent -> Signal.Message) -> Attribute
onkeydown = onKey "keydown"

onkeypress : (KeyboardEvent -> Signal.Message) -> Attribute
onkeypress = onKey "keypress"


-- Simple Events

onblur : Signal.Message -> Attribute
onblur handle value =
    on "blur" getAnything handle (always value)

onfocus : Signal.Message -> Attribute
onfocus handle value =
    on "focus" getAnything handle (always value)

onsubmit : Signal.Message -> Attribute
onsubmit handle value =
    on "submit" getAnything handle (always value)


