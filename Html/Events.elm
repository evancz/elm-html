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
The `MouseEvent` type is defined in the `Html` module.
@docs onclick, ondblclick, onmousemove,
      onmousedown, onmouseup,
      onmouseenter, onmouseleave,
      onmouseover, onmouseout
-}

import Graphics.Input (Handle)
import Html (Attribute, MouseEvent, KeyboardEvent, on, getMouseEvent, getKeyboardEvent, getAnything)


-- MouseEvent

onMouse : String -> Handle a -> (MouseEvent -> a) -> Attribute
onMouse name =
    on name getMouseEvent

onclick      : Handle a -> (MouseEvent -> a) -> Attribute
onclick      = onMouse "click"

ondblclick   : Handle a -> (MouseEvent -> a) -> Attribute
ondblclick   = onMouse "dblclick"

onmousemove  : Handle a -> (MouseEvent -> a) -> Attribute
onmousemove  = onMouse "mousemove"

onmousedown  : Handle a -> (MouseEvent -> a) -> Attribute
onmousedown  = onMouse "mousedown"

onmouseup    : Handle a -> (MouseEvent -> a) -> Attribute
onmouseup    = onMouse "mouseup"

onmouseenter : Handle a -> (MouseEvent -> a) -> Attribute
onmouseenter = onMouse "mouseenter"

onmouseleave : Handle a -> (MouseEvent -> a) -> Attribute
onmouseleave = onMouse "mouseleave"

onmouseover  : Handle a -> (MouseEvent -> a) -> Attribute
onmouseover  = onMouse "mouseover"

onmouseout   : Handle a -> (MouseEvent -> a) -> Attribute
onmouseout   = onMouse "mouseout"


-- KeyboardEvent

onKey : String -> Handle a -> (KeyboardEvent -> a) -> Attribute
onKey name =
    on name getKeyboardEvent

onkeyup    : Handle a -> (KeyboardEvent -> a) -> Attribute
onkeyup    = onKey "keyup"

onkeydown  : Handle a -> (KeyboardEvent -> a) -> Attribute
onkeydown  = onKey "keydown"

onkeypress : Handle a -> (KeyboardEvent -> a) -> Attribute
onkeypress = onKey "keypress"


-- Simple Events

onblur   : Handle a -> a -> Attribute
onblur handle value =
    on "blur" getAnything handle (always value)

onfocus  : Handle a -> a -> Attribute
onfocus handle value =
    on "focus" getAnything handle (always value)

onsubmit : Handle a -> a -> Attribute
onsubmit handle value =
    on "submit" getAnything handle (always value)


