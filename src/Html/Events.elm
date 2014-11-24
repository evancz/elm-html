module Html.Events where
{-| 
It is often helpful to create an [ADT][] so you can have many different kinds
of events as seen in the [TodoMVC][] example.

[ADT]: http://elm-lang.org/learn/Pattern-Matching.elm
[TodoMVC]: https://github.com/evancz/elm-todomvc/blob/master/Todo.elm

# All Events
@docs on, targetValue, targetChecked, keyCode

# Focus Helpers
@docs onBlur, onFocus, onSubmit

# Keyboard Helpers
@docs onKeyUp, onKeyDown, onKeyPress

# Mouse Helpers
@docs onClick, onDoubleClick, onMouseMove,
      onMouseDown, onMouseUp,
      onMouseEnter, onMouseLeave,
      onMouseOver, onMouseOut
-}

import Html (Attribute)
import Json.Decode as Json
import Json.Decode (..)
import Signal
import VirtualDom


on : String -> Json.Decoder a -> (a -> Signal.Message) -> Attribute
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

messageOn : String -> Signal.Message -> Attribute
messageOn name msg =
    on name value (always msg)

onClick : Signal.Message -> Attribute
onClick = messageOn "click"

onDoubleClick : Signal.Message -> Attribute
onDoubleClick = messageOn "dblclick"

onMouseMove : Signal.Message -> Attribute
onMouseMove = messageOn "mousemove"

onMouseDown : Signal.Message -> Attribute
onMouseDown = messageOn "mousedown"

onMouseUp : Signal.Message -> Attribute
onMouseUp = messageOn "mouseup"

onMouseEnter : Signal.Message -> Attribute
onMouseEnter = messageOn "mouseenter"

onMouseLeave : Signal.Message -> Attribute
onMouseLeave = messageOn "mouseleave"

onMouseOver : Signal.Message -> Attribute
onMouseOver = messageOn "mouseover"

onMouseOut : Signal.Message -> Attribute
onMouseOut = messageOn "mouseout"


-- KeyboardEvent

onKey : String -> (Int -> Signal.Message) -> Attribute
onKey name =
    on name keyCode

onKeyUp : (Int -> Signal.Message) -> Attribute
onKeyUp = onKey "keyup"

onKeyDown : (Int -> Signal.Message) -> Attribute
onKeyDown = onKey "keydown"

onKeyPress : (Int -> Signal.Message) -> Attribute
onKeyPress = onKey "keypress"


-- Simple Events

onBlur : Signal.Message -> Attribute
onBlur =
    messageOn "blur"

onFocus : Signal.Message -> Attribute
onFocus =
    messageOn "focus"

onSubmit : Signal.Message -> Attribute
onSubmit =
    messageOn "submit"


