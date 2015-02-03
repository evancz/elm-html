module Html.Events where
{-| 
It is often helpful to create an [Union Type][] so you can have many different kinds
of events as seen in the [TodoMVC][] example.

[Union Type]: http://elm-lang.org/learn/Union-Types.elm
[TodoMVC]: https://github.com/evancz/elm-todomvc/blob/master/Todo.elm

# Focus Helpers
@docs onBlur, onFocus, onSubmit

# Keyboard Helpers
@docs onKeyUp, onKeyDown, onKeyPress

# Mouse Helpers
@docs onClick, onDoubleClick, onMouseMove,
      onMouseDown, onMouseUp,
      onMouseEnter, onMouseLeave,
      onMouseOver, onMouseOut


# All Events
@docs on, targetValue, targetChecked, keyCode
-}

import Html (Attribute)
import Json.Decode as Json
import Json.Decode (..)
import Signal
import VirtualDom


on : String -> Json.Decoder a -> (a -> (Signal.Mailbox b, b)) -> Attribute
on = VirtualDom.on


-- COMMON DECODERS

targetValue : Json.Decoder String
targetValue =
    at ["target", "value"] string


targetChecked : Json.Decoder Bool
targetChecked =
    at ["target", "checked"] bool


keyCode : Json.Decoder Int
keyCode =
    ("keyCode" := int)


-- MouseEvent

messageOn : String -> Signal.Mailbox a -> a -> Attribute
messageOn name mailbox msg =
    on name value (always (mailbox, msg))


onClick : Signal.Mailbox a -> a -> Attribute
onClick =
    messageOn "click"


onDoubleClick : Signal.Mailbox a -> a -> Attribute
onDoubleClick =
    messageOn "dblclick"


onMouseMove : Signal.Mailbox a -> a -> Attribute
onMouseMove =
    messageOn "mousemove"


onMouseDown : Signal.Mailbox a -> a -> Attribute
onMouseDown =
    messageOn "mousedown"


onMouseUp : Signal.Mailbox a -> a -> Attribute
onMouseUp =
    messageOn "mouseup"


onMouseEnter : Signal.Mailbox a -> a -> Attribute
onMouseEnter =
    messageOn "mouseenter"


onMouseLeave : Signal.Mailbox a -> a -> Attribute
onMouseLeave =
    messageOn "mouseleave"


onMouseOver : Signal.Mailbox a -> a -> Attribute
onMouseOver =
    messageOn "mouseover"


onMouseOut : Signal.Mailbox a -> a -> Attribute
onMouseOut =
    messageOn "mouseout"



-- KeyboardEvent

onKey : String -> Signal.Mailbox a -> (Int -> a) -> Attribute
onKey name mailbox handler =
    on name keyCode (\code -> (mailbox, handler code))


onKeyUp : Signal.Mailbox a -> (Int -> a) -> Attribute
onKeyUp =
    onKey "keyup"


onKeyDown : Signal.Mailbox a -> (Int -> a) -> Attribute
onKeyDown =
    onKey "keydown"


onKeyPress : Signal.Mailbox a -> (Int -> a) -> Attribute
onKeyPress =
    onKey "keypress"



-- Simple Events

onBlur : Signal.Mailbox a -> a -> Attribute
onBlur =
    messageOn "blur"


onFocus : Signal.Mailbox a -> a -> Attribute
onFocus =
    messageOn "focus"


onSubmit : Signal.Mailbox a -> a -> Attribute
onSubmit =
    messageOn "submit"


