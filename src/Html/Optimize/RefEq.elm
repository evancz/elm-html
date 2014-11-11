module Html.Optimize.RefEq where
{-| Since all Elm functions are pure we have a guarantee that the same input
will always result in the same output. This module gives us tools to be lazy
about building Html that utilize this fact.

Rather than immediately applying functions to their arguments, the `lazy`
functions just bundle the function and arguments up for later. When diffing
the old and new virtual DOM, it checks to see if all the arguments are
**referentially** equal. If so, it skips calling the function!

This is a really cheap test and often makes things a lot faster, but definitely
benchmark to be sure!

@docs lazy, lazy2, lazy3
-}

import Html (Html)
import Native.Html

lazy : (a -> Html) -> a -> Html
lazy = Native.Html.lazyRef

lazy2 : (a -> b -> Html) -> a -> b -> Html
lazy2 = Native.Html.lazyRef2

lazy3 : (a -> b -> c -> Html) -> a -> b -> c -> Html
lazy3 = Native.Html.lazyRef3

