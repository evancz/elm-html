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

import Html exposing (Attribute)
import JavaScript.Decode as JS exposing (..)
import Mailbox
import VirtualDom


on : String -> JS.Decoder a -> (a -> Mailbox.Message) -> Attribute
on =
    VirtualDom.on


-- COMMON DECODERS

targetValue : JS.Decoder String
targetValue =
    at ["target", "value"] string


targetChecked : JS.Decoder Bool
targetChecked =
    at ["target", "checked"] bool


keyCode : JS.Decoder Int
keyCode =
    ("keyCode" := int)


-- MouseEvent

messageOn : String -> Mailbox.Message -> Attribute
messageOn name msg =
    on name value (always msg)


onClick : Mailbox.Message -> Attribute
onClick =
    messageOn "click"


onDoubleClick : Mailbox.Message -> Attribute
onDoubleClick =
    messageOn "dblclick"


onMouseMove : Mailbox.Message -> Attribute
onMouseMove =
    messageOn "mousemove"


onMouseDown : Mailbox.Message -> Attribute
onMouseDown =
    messageOn "mousedown"


onMouseUp : Mailbox.Message -> Attribute
onMouseUp =
    messageOn "mouseup"


onMouseEnter : Mailbox.Message -> Attribute
onMouseEnter =
    messageOn "mouseenter"


onMouseLeave : Mailbox.Message -> Attribute
onMouseLeave =
    messageOn "mouseleave"


onMouseOver : Mailbox.Message -> Attribute
onMouseOver =
    messageOn "mouseover"


onMouseOut : Mailbox.Message -> Attribute
onMouseOut =
    messageOn "mouseout"



-- KeyboardEvent

onKey : String -> (Int -> Mailbox.Message) -> Attribute
onKey name =
    on name keyCode


onKeyUp : (Int -> Mailbox.Message) -> Attribute
onKeyUp =
    onKey "keyup"


onKeyDown : (Int -> Mailbox.Message) -> Attribute
onKeyDown =
    onKey "keydown"


onKeyPress : (Int -> Mailbox.Message) -> Attribute
onKeyPress =
    onKey "keypress"


-- Simple Events

onBlur : Mailbox.Message -> Attribute
onBlur =
    messageOn "blur"


onFocus : Mailbox.Message -> Attribute
onFocus =
    messageOn "focus"


onSubmit : Mailbox.Message -> Attribute
onSubmit =
    messageOn "submit"
