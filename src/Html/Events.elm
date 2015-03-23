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
import Port
import VirtualDom


on : String -> JS.Decoder a -> (a -> Port.Message) -> Attribute
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

messageOn : String -> Port.Message -> Attribute
messageOn name msg =
    on name value (always msg)


onClick : Port.Message -> Attribute
onClick =
    messageOn "click"


onDoubleClick : Port.Message -> Attribute
onDoubleClick =
    messageOn "dblclick"


onMouseMove : Port.Message -> Attribute
onMouseMove =
    messageOn "mousemove"


onMouseDown : Port.Message -> Attribute
onMouseDown =
    messageOn "mousedown"


onMouseUp : Port.Message -> Attribute
onMouseUp =
    messageOn "mouseup"


onMouseEnter : Port.Message -> Attribute
onMouseEnter =
    messageOn "mouseenter"


onMouseLeave : Port.Message -> Attribute
onMouseLeave =
    messageOn "mouseleave"


onMouseOver : Port.Message -> Attribute
onMouseOver =
    messageOn "mouseover"


onMouseOut : Port.Message -> Attribute
onMouseOut =
    messageOn "mouseout"



-- KeyboardEvent

onKey : String -> (Int -> Port.Message) -> Attribute
onKey name =
    on name keyCode


onKeyUp : (Int -> Port.Message) -> Attribute
onKeyUp =
    onKey "keyup"


onKeyDown : (Int -> Port.Message) -> Attribute
onKeyDown =
    onKey "keydown"


onKeyPress : (Int -> Port.Message) -> Attribute
onKeyPress =
    onKey "keypress"


-- Simple Events

onBlur : Port.Message -> Attribute
onBlur =
    messageOn "blur"


onFocus : Port.Message -> Attribute
onFocus =
    messageOn "focus"


onSubmit : Port.Message -> Attribute
onSubmit =
    messageOn "submit"
