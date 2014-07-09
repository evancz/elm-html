module Html.Event ( click, dblclick, mousemove
                  , mousedown, mouseup
                  , mouseenter, mouseleave
                  , mouseover, mouseout
                  , keyup, keydown, keypress
                  , blur, focus, submit
                  , on
                  , checked
                  , value, valueAndSelection
                  , mouseEvent, keyboardEvent
                  , ignore
                  ) where
{-|

# Mouse Events
@docs MouseEvent,
      click, dblclick, mousemove,
      mousedown, mouseup,
      mouseenter, mouseleave,
      mouseover, mouseout

# Keyboard Events
@docs KeyboardEvent, keyup, keydown, keypress

# Simple Events
@docs blur, focus, submit

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

click      : Handle a -> (MouseEvent -> a) -> EventListener
click      = onMouse "click"

dblclick   : Handle a -> (MouseEvent -> a) -> EventListener
dblclick   = onMouse "dblclick"

mousemove  : Handle a -> (MouseEvent -> a) -> EventListener
mousemove  = onMouse "mousemove"

mousedown  : Handle a -> (MouseEvent -> a) -> EventListener
mousedown  = onMouse "mousedown"

mouseup    : Handle a -> (MouseEvent -> a) -> EventListener
mouseup    = onMouse "mouseup"

mouseenter : Handle a -> (MouseEvent -> a) -> EventListener
mouseenter = onMouse "mouseenter"

mouseleave : Handle a -> (MouseEvent -> a) -> EventListener
mouseleave = onMouse "mouseleave"

mouseover  : Handle a -> (MouseEvent -> a) -> EventListener
mouseover  = onMouse "mouseover"

mouseout   : Handle a -> (MouseEvent -> a) -> EventListener
mouseout   = onMouse "mouseout"


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

keyup    : Handle a -> (KeyboardEvent -> a) -> EventListener
keyup    = onKey "keyup"

keydown  : Handle a -> (KeyboardEvent -> a) -> EventListener
keydown  = onKey "keydown"

keypress : Handle a -> (KeyboardEvent -> a) -> EventListener
keypress = onKey "keypress"


-- Simple Events

blur : Handle a -> a -> EventListener
blur handle value =
    Native.Html.on "blur" id handle (always value)

focus : Handle a -> a -> EventListener
focus handle value =
    Native.Html.on "focus" id handle (always value)

submit : Handle a -> a -> EventListener
submit handle value =
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

{-| Ignore the value. This extraction always succeeds.
-}
ignore : Extract ()
ignore = Native.Html.getIgnore

