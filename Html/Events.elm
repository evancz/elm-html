module Html.Events
    ( EventListener
--    , MouseEvent
--    , KeyboardEvent
    , onclick, ondblclick, onmousemove
    , onmousedown, onmouseup
    , onmouseenter, onmouseleave
    , onmouseover, onmouseout
    , onkeyup, onkeydown, onkeypress
    , onblur, onfocus, onsubmit
    , on
    , checked
    , value, valueAndSelection
    , mouseEvent, keyboardEvent, keyboardEventIf
    , ignore
    ) where
{-|

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

## Extractors
@docs checked, value, valueAndSelection, Direction, mouseEvent, keyboardEvent, ignore
-}


import Graphics.Input (Handle)
import Json
import Native.Html
import Native.Json

data EventListener = Listener


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

onblur : Handle a -> a -> EventListener
onblur handle value =
    Native.Html.on "blur" id handle (always value)

onfocus : Handle a -> a -> EventListener
onfocus handle value =
    Native.Html.on "focus" id handle (always value)

onsubmit : Handle a -> a -> EventListener
onsubmit handle value =
    Native.Html.on "submit" id handle (always value)


-- General Events

data Extract a = Extract

on : String -> Extract value -> Handle a -> (value -> a) -> EventListener
on name coerce handle convert =
    Native.Html.on name coerce handle convert

{-| Attempt to access `event.target.checked`. Only works with checkboxes.
-}
checked : Extract Bool
checked = Native.Html.getChecked

{-| Attempt to access `event.target.value`. Best used with text fields and
text areas.
-}
value : Extract String
value = Native.Html.getValue

{-| Whether a selection goes forward or backward.
-}
data Direction = Forward | Backward

{-| Attempt to access `event.target.value` and selection information held in
`event.target.selectionStart`, `event.target.selectionEnd`, and
`event.target.selectionDirection`. Only works with text fields and text areas.

This is useful when you want your model to fully capture what the user is
typing and highlighting.
-}
valueAndSelection : Extract { value : String
                            , selection : { start:Int, end:Int, direction:Direction }
                            }
valueAndSelection = Native.Html.getValueAndSelection

{-| Attempt to interpret the event as a `MouseEvent`.
-}
mouseEvent : Extract MouseEvent
mouseEvent = Native.Html.getMouseEvent

{-| Attempt to interpret the event as a `KeyboardEvent`.
-}
keyboardEvent : Extract KeyboardEvent
keyboardEvent = Native.Html.getKeyboardEvent

keyboardEventIf : (KeyboardEvent -> Bool) -> Extract KeyboardEvent
keyboardEventIf = Native.Html.getKeyboardEventIf

{-| Ignore the value. This extraction always succeeds.
-}
ignore : Extract ()
ignore = Native.Html.getIgnore

