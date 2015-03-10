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
import VirtualDom


on : String -> JS.Decoder a -> (a -> Stream.Message) -> Attribute
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

messageOn : String -> Stream.Message -> Attribute
messageOn name msg =
    on name value (always msg)


onClick : Stream.Message -> Attribute
onClick =
    messageOn "click"


onDoubleClick : Stream.Message -> Attribute
onDoubleClick =
    messageOn "dblclick"


onMouseMove : Stream.Message -> Attribute
onMouseMove =
    messageOn "mousemove"


onMouseDown : Stream.Message -> Attribute
onMouseDown =
    messageOn "mousedown"


onMouseUp : Stream.Message -> Attribute
onMouseUp =
    messageOn "mouseup"


onMouseEnter : Stream.Message -> Attribute
onMouseEnter =
    messageOn "mouseenter"


onMouseLeave : Stream.Message -> Attribute
onMouseLeave =
    messageOn "mouseleave"


onMouseOver : Stream.Message -> Attribute
onMouseOver =
    messageOn "mouseover"


onMouseOut : Stream.Message -> Attribute
onMouseOut =
    messageOn "mouseout"



-- KeyboardEvent

onKey : String -> (Int -> Stream.Message) -> Attribute
onKey name =
    on name keyCode


onKeyUp : (Int -> Stream.Message) -> Attribute
onKeyUp =
    onKey "keyup"


onKeyDown : (Int -> Stream.Message) -> Attribute
onKeyDown =
    onKey "keydown"


onKeyPress : (Int -> Stream.Message) -> Attribute
onKeyPress =
    onKey "keypress"


-- Simple Events

onBlur : Stream.Message -> Attribute
onBlur =
    messageOn "blur"


onFocus : Stream.Message -> Attribute
onFocus =
    messageOn "focus"


onSubmit : Stream.Message -> Attribute
onSubmit =
    messageOn "submit"
