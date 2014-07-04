
module Html.Optimize.RefEq where

import Html (Html)
import Native.Html

lazy : (a -> Html) -> a -> Html
lazy = Native.Html.lazyRef

lazy2 : (a -> b -> Html) -> a -> b -> Html
lazy2 = Native.Html.lazyRef2

lazy3 : (a -> b -> c -> Html) -> a -> b -> c -> Html
lazy3 = Native.Html.lazyRef3

