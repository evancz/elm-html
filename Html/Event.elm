module Html.Event where

import Graphics.Input (Handle)
import Json
import Native.Html
import Native.Json

data EventListener = Listener

on : String -> Handle a -> (Json.Value -> a) -> EventListener
on name handle convert =
    Native.Html.on name Native.Json.fromJS handle convert

click : Handle a -> (() -> a) -> EventListener
click = Native.Html.on "click" (always ())

dblclick : Handle a -> (() -> a) -> EventListener
dblclick = Native.Html.on "dblclick" (always ())

blur : Handle a -> (() -> a) -> EventListener
blur = Native.Html.on "blur" (always ())

focus : Handle a -> (() -> a) -> EventListener
focus = Native.Html.on "focus" (always ())

submit : Handle a -> (() -> a) -> EventListener
submit = Native.Html.on "submit" (always ())

change : Handle a -> (String -> a) -> EventListener
change = Native.Html.on "change" (\e -> e.target.value)

input : Handle a -> (String -> a) -> EventListener
input = Native.Html.on "input" (\e -> e.target.value)