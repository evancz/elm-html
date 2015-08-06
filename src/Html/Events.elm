module Html.Events
    ( onBlur, onFocus, onSubmit
    , onKeyUp, onKeyDown, onKeyPress
    , onClick, onDoubleClick
    , onMouseMove
    , onMouseDown, onMouseUp
    , onMouseEnter, onMouseLeave
    , onMouseOver, onMouseOut
    , on, onWithOptions, Options, defaultOptions
    , targetValue, targetChecked, keyCode
    ) where
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

# Custom Event Handlers
@docs on, targetValue, targetChecked, keyCode,
    onWithOptions, Options, defaultOptions
-}

import Html exposing (Attribute)
import Json.Decode as Json exposing (..)
import VirtualDom


{-| Create a custom event listener.

    import Json.Decode as Json

    onClick : Signal.Address a -> Attribute
    onClick address =
        on "click" Json.value (\_ -> Signal.message address ())

You first specify the name of the event in the same format as with
JavaScript’s `addEventListener`. Next you give a JSON decoder, which lets
you pull information out of the event object. If that decoder is successful,
the resulting value is given to a function that creates a `Signal.Message`.
So in our example, we will send `()` to the given `address`.
-}
on : String -> Json.Decoder a -> (a -> Signal.Message) -> Attribute
on =
  VirtualDom.on


{-| Same as `on` but you can set a few options.
-}
onWithOptions : String -> Options -> Json.Decoder a -> (a -> Signal.Message) -> Attribute
onWithOptions =
  VirtualDom.onWithOptions


{-| Options for an event listener. If `stopPropagation` is true, it means the
event stops traveling through the DOM so it will not trigger any other event
listeners. If `preventDefault` is true, any built-in browser behavior related
to the event is prevented. For example, this is used with touch events when you
want to treat them as gestures of your own, not as scrolls.
-}
type alias Options =
    { stopPropagation : Bool
    , preventDefault : Bool
    }


{-| Everything is `False` by default.

    defaultOptions =
        { stopPropagation = False
        , preventDefault = False
        }
-}
defaultOptions : Options
defaultOptions =
  VirtualDom.defaultOptions


-- COMMON DECODERS

{-| A `Json.Decoder` for grabbing `event.target.value` from the triggered
event. This is often useful for input event on text fields.

    onInput : Signal.Address a -> (String -> a) -> Attribute
    onInput address contentToValue =
        on "input" targetValue (\str -> Signal.message address (contentToValue str))
-}
targetValue : Json.Decoder String
targetValue =
  at ["target", "value"] string


{-| A `Json.Decoder` for grabbing `event.target.checked` from the triggered
event. This is useful for input event on checkboxes.

    onInput : Signal.Address a -> (Bool -> a) -> Attribute
    onInput address contentToValue =
        on "input" targetChecked (\bool -> Signal.message address (contentToValue bool))
-}
targetChecked : Json.Decoder Bool
targetChecked =
  at ["target", "checked"] bool


{-| A `Json.Decoder` for grabbing `event.keyCode` from the triggered event.
This is useful for key events today, though it looks like the spec is moving
towards the `event.key` field for this someday.

    onKeyUp : Signal.Address a -> (Int -> a) -> Attribute
    onKeyUp address handler =
        on "keyup" keyCode (\code -> Signal.message address (handler code))
-}
keyCode : Json.Decoder Int
keyCode =
  ("keyCode" := int)


-- MouseEvent

messageOn : String -> Signal.Address a -> a -> Attribute
messageOn name addr msg =
  on name value (\_ -> Signal.message addr msg)


{-|-}
onClick : Signal.Address a -> a -> Attribute
onClick =
  messageOn "click"


{-|-}
onDoubleClick : Signal.Address a -> a -> Attribute
onDoubleClick =
  messageOn "dblclick"


{-|-}
onMouseMove : Signal.Address a -> a -> Attribute
onMouseMove =
  messageOn "mousemove"


{-|-}
onMouseDown : Signal.Address a -> a -> Attribute
onMouseDown =
  messageOn "mousedown"


{-|-}
onMouseUp : Signal.Address a -> a -> Attribute
onMouseUp =
  messageOn "mouseup"


{-|-}
onMouseEnter : Signal.Address a -> a -> Attribute
onMouseEnter =
  messageOn "mouseenter"


{-|-}
onMouseLeave : Signal.Address a -> a -> Attribute
onMouseLeave =
  messageOn "mouseleave"


{-|-}
onMouseOver : Signal.Address a -> a -> Attribute
onMouseOver =
  messageOn "mouseover"


{-|-}
onMouseOut : Signal.Address a -> a -> Attribute
onMouseOut =
  messageOn "mouseout"



-- KeyboardEvent

onKey : String -> Signal.Address a -> (Int -> a) -> Attribute
onKey name addr handler =
  on name keyCode (\code -> Signal.message addr (handler code))


{-|-}
onKeyUp : Signal.Address a -> (Int -> a) -> Attribute
onKeyUp =
  onKey "keyup"


{-|-}
onKeyDown : Signal.Address a -> (Int -> a) -> Attribute
onKeyDown =
  onKey "keydown"


{-|-}
onKeyPress : Signal.Address a -> (Int -> a) -> Attribute
onKeyPress =
  onKey "keypress"


-- Simple Events

{-|-}
onBlur : Signal.Address a -> a -> Attribute
onBlur =
  messageOn "blur"


{-|-}
onFocus : Signal.Address a -> a -> Attribute
onFocus =
  messageOn "focus"


{-|-}
onSubmit : Signal.Address a -> a -> Attribute
onSubmit =
  messageOn "submit"
