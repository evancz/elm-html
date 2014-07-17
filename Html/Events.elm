module Html.Events where
{-| A way to handle any DOM events. The general approach is to set up an input
as defined in `Graphics.Input` and then have each event handler send messages
to one particular input.

It is often helpful to create an [ADT][] so you can have many different kinds
of events as seen in the [TodoMVC][] example. A possibly ill-advised trick is
to report functions with type `(state -> state)` so you can use a small ADT or
extend it easily. 

[ADT]: http://elm-lang.org/learn/Pattern-Matching.elm
[TodoMVC]: https://github.com/evancz/elm-todomvc/blob/master/Todo.elm

# Mouse Events
@docs MouseEvent,
      onclick, ondblclick, onmousemove,
      onmousedown, onmouseup,
      onmouseenter, onmouseleave,
      onmouseover, onmouseout

# Keyboard Events
@docs KeyboardEvent, onkeyup, onkeydown, onkeypress

# Simple Events
@docs onblur, onfocus, onsubmit

# General Events
@docs on

## Getters
Getters are used to take a raw JavaScript event and safely turn it into an Elm
value. Accessing fields like `event.target.checked` can fail, so getters let
you ask for these fields without risk of runtime errors. If the getter fails,
the event is skipped.

@docs getChecked, getValue, getValueAndSelection, Direction,
      getMouseEvent, getKeyboardEvent, getAnything, when, filterMap
-}


import Graphics.Input (Handle)
import Json
import Native.Html
import Native.Json

data EventListener = EventListener


-- MouseEvent

{-| Determine which button was clicked and with which modifiers.
-}
type MouseEvent =
    { button   : Int
    , altKey   : Bool
    , ctrlKey  : Bool
    , metaKey  : Bool
    , shiftKey : Bool
    }

onMouse : String -> Handle a -> (MouseEvent -> a) -> EventListener
onMouse name =
    Native.Html.on name Native.Html.getMouseEvent

onclick      : Handle a -> (MouseEvent -> a) -> EventListener
onclick      = onMouse "click"

ondblclick   : Handle a -> (MouseEvent -> a) -> EventListener
ondblclick   = onMouse "dblclick"

onmousemove  : Handle a -> (MouseEvent -> a) -> EventListener
onmousemove  = onMouse "mousemove"

onmousedown  : Handle a -> (MouseEvent -> a) -> EventListener
onmousedown  = onMouse "mousedown"

onmouseup    : Handle a -> (MouseEvent -> a) -> EventListener
onmouseup    = onMouse "mouseup"

onmouseenter : Handle a -> (MouseEvent -> a) -> EventListener
onmouseenter = onMouse "mouseenter"

onmouseleave : Handle a -> (MouseEvent -> a) -> EventListener
onmouseleave = onMouse "mouseleave"

onmouseover  : Handle a -> (MouseEvent -> a) -> EventListener
onmouseover  = onMouse "mouseover"

onmouseout   : Handle a -> (MouseEvent -> a) -> EventListener
onmouseout   = onMouse "mouseout"


-- KeyboardEvent

{-| Determine which key was pressed and with which modifiers.
-}
type KeyboardEvent =
    { keyCode  : Int
    , altKey   : Bool
    , ctrlKey  : Bool
    , metaKey  : Bool
    , shiftKey : Bool
    }

onKey : String -> Handle a -> (KeyboardEvent -> a) -> EventListener
onKey name =
    Native.Html.on name Native.Html.getKeyboardEvent

onkeyup    : Handle a -> (KeyboardEvent -> a) -> EventListener
onkeyup    = onKey "keyup"

onkeydown  : Handle a -> (KeyboardEvent -> a) -> EventListener
onkeydown  = onKey "keydown"

onkeypress : Handle a -> (KeyboardEvent -> a) -> EventListener
onkeypress = onKey "keypress"


-- Simple Events

onblur   : Handle a -> a -> EventListener
onblur handle value =
    Native.Html.on "blur" Native.Html.getAnything handle (always value)

onfocus  : Handle a -> a -> EventListener
onfocus handle value =
    Native.Html.on "focus" Native.Html.getAnything handle (always value)

onsubmit : Handle a -> a -> EventListener
onsubmit handle value =
    Native.Html.on "submit" Native.Html.getAnything handle (always value)


-- General Events

data Get a = Get

on : String -> Get value -> Handle a -> (value -> a) -> EventListener
on name coerce handle convert =
    Native.Html.on name coerce handle convert

{-| This lets us create custom getters that require that certain conditions
are met. For example, we can create an event that only triggers if the user
releases the ENTER key:

    onEnter : Handle a -> a -> EventListener
    onEnter handle value =
        on "keyup" (when (\k -> k.keyCode == 13) getKeyboardEvent) handle (always value)

If the condition is not met, the event does not trigger.
-}
when : (a -> Bool) -> Get a -> Get a
when pred getter =
    Native.Html.filterMap (\v -> if pred v then Just v else Nothing) getter

{-| Gives the ability to create new getters from the existing primitives. For
example, if you want only the `keyCode` from a `KeyboardEvent` you can create
a new getter:

    getKeyCode : Get Int
    getKeyCode =
        filterMap (\ke -> Just ke.keyCode) getKeyboardEvent

-}
filterMap : (a -> Maybe b) -> Get a -> Get b
filterMap = Native.Html.filterMap

{-| Attempt to get `event.target.checked`. Only works with checkboxes.
-}
getChecked : Get Bool
getChecked = Native.Html.getChecked

{-| Attempt to get `event.target.value`. Best used with text fields and
text areas.
-}
getValue : Get String
getValue = Native.Html.getValue

{-| Whether a selection goes forward or backward.
-}
data Direction = Forward | Backward

{-| Attempt to get `event.target.value` and selection information held in
`event.target.selectionStart`, `event.target.selectionEnd`, and
`event.target.selectionDirection`. Only works with text fields and text areas.

This is useful when you want your model to fully capture what the user is
typing and highlighting.
-}
getValueAndSelection : Get { value : String
                           , selection : { start:Int, end:Int, direction:Direction }
                           }
getValueAndSelection = Native.Html.getValueAndSelection

{-| Attempt to interpret the event as a `MouseEvent`.
-}
getMouseEvent : Get MouseEvent
getMouseEvent = Native.Html.getMouseEvent

{-| Attempt to interpret the event as a `KeyboardEvent`.
-}
getKeyboardEvent : Get KeyboardEvent
getKeyboardEvent = Native.Html.getKeyboardEvent

{-| Ignore the event entirely. This extraction always succeeds, returning a unit
value. This is useful for things like click events where you just need to know
that the click occured.
-}
getAnything : Get ()
getAnything = Native.Html.getAnything

