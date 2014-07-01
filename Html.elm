module Html where

import Native.Html
import String (show, append)

data Html = Html

node : String -> [(String,String)] -> [(String,String)] -> [Html] -> Html
node = Native.Html.node

text : String -> Html
text = Native.Html.text

toElement : Int -> Int -> Html -> Element
toElement = Native.Html.toElement


(:=) : String -> String -> (String,String)
(:=) = (,)

px : Float -> String
px n = append (show n) "px"

em : Float -> String
em n = append (show n) "em"

pct : Float -> String
pct n = append (show n) "%"

bool : Bool -> String
bool b = if b then "true" else "false"