module Html where
{-| This module gives you *raw* bindings to HTML. There are no special tricks
here, just the bare essentials to use HTML.

Use `Html.Tags`, `Html.Attributes`, and `Html.Events` for helper functions like
`div` to make your code more type-safe and a bit nicer to read. If ever you need
to go outside those functions though, this core `Html` module has everything you
need.

In future releases, we plan to break out this module and the core diffing
algorithm so that anyone can build on top of it with a minimal set of
dependencies.

# Create
@docs text, node

# Embed
@docs toElement

# HTML Attributes
@docs attr, toggle

# CSS Properties
@docs style, prop

# Events
@docs on, getChecked, getValue, getValueAndSelection, Direction,
      getMouseEvent, MouseEvent, getKeyboardEvent, KeyboardEvent,
      getAnything, when, filterMap

-}

import Color
import Graphics.Input (Handle)
import Native.Html
import String (show, append)

data Html = Html

{-| Create a DOM node with a tag name, a list of HTML attributes that can
include styles and event listeners, a list of CSS properties like `color`, and
a list of child nodes.

      node "div" [] [ text "Hello!" ]

      node "div"
          [ attr "id" "greeting" ]
          [ text "Hello!" ]
-}
node : String -> [Attribute] -> [Html] -> Html
node = Native.Html.node

{-| Just put plain text in the DOM. It will escape the string so that it appears
exactly as you specify.

      text "Hello World!"
-}
text : String -> Html
text = Native.Html.text

{-| Embed an `Html` value in Elm's rendering system. Like any other `Element`,
this requires a known width and height, so it is not yet clear if this can be
made more convenient in the future.
-}
toElement : Int -> Int -> Html -> Element
toElement = Native.Html.toElement


-- ATTRIBUTES

data Attribute = Attribute

{-| Create a basic HTML attribute.

      node "div"
          [ attr "id" "greeting"
          , attr "className" "message"
          ]
          [ text "Hello!" ]

Check out `Html.Attributes` for helper functions like
`(id : String -> Attribute)` and `(class : String -> Attribute)` that make it
easier to specify attributes.

Notice that we use `className` to set the class of the div. All HTML attributes
and CSS properties must be set using the JavaScript version of their name, so
`class` becomes `className`, `float` becomes `cssFloat`, etc.
-}
attr : String -> String -> Attribute
attr = Native.Html.pair

{-| Some HTML attributes are not associated with a value, they are either there
or not. The `toggle` function lets create this kind of attribute.

      node "input"
          [ toggle "autofocus" True
          , toggle "readonly" False
          ]
          []

See `Html.Attributes` for helper functions like
`(autofocus : Bool -> Attribute)` and `(readonly : Bool -> Attribute)`.
-}
toggle : String -> Bool -> Attribute
toggle = Native.Html.pair


-- STYLES

data CssProperty = CssProperty

{-| This function makes it easier to specify a set of styles.

      node "div"
          [ style
              [ prop "backgroundColor" "red"
              , prop "height" "90px"
              , prop "width" "100%"
              ]
          ]
          [ text "Hello!" ]

There is no `Html.Styles` module because best practices for working with HTML
suggest that this should primarily be specified in CSS files. So the general
recommendation is to use this function lightly.
-}
style : [CssProperty] -> Attribute
style = Native.Html.style

{-| Create a CSS property. -}
prop : String -> String -> CssProperty
prop = Native.Html.pair


-- EVENTS

data Get a = Get

{-| This is the most general way to handle events. Check out `Html.Events` for
a gentler introduction to event handlers.

The `on` function takes four arguments:

      on "click" getMouseEvent actions.handle (\mc -> mc.button)

The first is an event name like "mousemove" or "click". These names match the
standard HTML names for events.

Second is a "getter". Getters are used to take a raw JavaScript event and safely
turn it into an Elm value. Accessing fields like `event.target.checked` can
fail, so getters let you ask for these fields without risk of runtime errors.
If the getter fails, the event is skipped.

Third is an input handle. Handles are defined in `Graphics.Input` and are a
general purpose way to route events to particular signals. So this argument
lets us declare who we are going to tell about a particular event.

Fourth we have a function to augment the event value with extra information.
Say you have forty check boxes reporting to the same signal. You need to add
an ID to these events so that you can distinguish between them.

Again, take a look at `Html.Events` for a much easier introduction to these
ideas.
-}
on : String -> Get value -> Handle a -> (value -> a) -> Attribute
on = Native.Html.on

{-| This lets us create custom getters that require that certain conditions
are met. For example, we can create an event that only triggers if the user
releases the ENTER key:

    onEnter : Handle a -> a -> Attribute
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

{-| Determine which button was clicked and with which modifiers.
-}
type MouseEvent =
    { button   : Int
    , altKey   : Bool
    , ctrlKey  : Bool
    , metaKey  : Bool
    , shiftKey : Bool
    }

{-| Attempt to interpret the event as a `KeyboardEvent`.
-}
getKeyboardEvent : Get KeyboardEvent
getKeyboardEvent = Native.Html.getKeyboardEvent

{-| Determine which key was pressed and with which modifiers.
-}
type KeyboardEvent =
    { keyCode  : Int
    , altKey   : Bool
    , ctrlKey  : Bool
    , metaKey  : Bool
    , shiftKey : Bool
    }

{-| Ignore the event entirely. This extraction always succeeds, returning a unit
value. This is useful for things like click events where you just need to know
that the click occured.
-}
getAnything : Get ()
getAnything = Native.Html.getAnything

