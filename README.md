# HTML in Elm

Create composable widgets with the full power of HTML and CSS. This library
lets you:

  * Render [really freakin' fast][bench]
  * Reuse existing CSS
  * Use all the latest standards, such as [flexbox][flexbox]

[flexbox]: (http://css-tricks.com/snippets/css/a-guide-to-flexbox/)

[Embedding Elm widgets](https://github.com/evancz/elm-html-and-js) in existing
applications and [JS interop](http://elm-lang.org/learn/Ports.elm) are both
really easy, so this library takes the next logical step in improving Elm's
interop story.

Check out the [TodoMVC app][todo] for a larger example.

## Reusable Widgets

With this library, you have the full power of Elm to create nice abstractions to
make your view code modular. Creating a list of user profiles is a matter of can
be nicely abstracted with something like this:

```haskell
import Html (..)

profiles : [User] -> Html
profiles users =
    node "div" [] [] (map profile users)

profile : User -> Html
profile user =
    node "div" [] []
    [ node "img" [ "src" := user.picture ] [] []
    , text user.name
    ]
```

Of course you may want to use more complex styles, but those can be abstracted
out and reused too!

```haskell
import Html
import Html (..)

profiles : [User] -> Html
profiles users =
    node "div" [] (font ++ background) (map profile users)

font : [(String,String)]
font =
    [ "font-family" := "futura, sans-serif"
    , "color"       := Html.color charcoal
    , "font-size"   := em 1.2
    ]

background : [(String,String)]
background =
    [ "background-color" := Html.color lightGrey ]
```

With these basic building blocks, it becomes possible to start building stronger
abstractions on top of basic HTML and CSS. For example, it may be possible to
recreate Elm's `Element` abstraction using this framework. But more importantly,
it is possible for anyone to experiment with other ways to make views modular and
pleasant to specify.

## Performance

We have written a [TodoMVC app][todo] with this library and benchmarked it
against other popular entries. [The benchmark][bench] shows that elm-html is
really fast, thanks entirely to the [virtual-dom][] project it is built on
top of.

[todo]: https://github.com/evancz/elm-todomvc
[bench]: http://evancz.github.io/todomvc-perf-comparison/

## Influences

Huge thanks to [React][] and [Om][] which popularized the idea of virtual DOM
and came up with optimizations to make it really fast. Another huge thanks to
Matt Esch and Jake Verbaten who created [virtual-dom][] and [mercury][] which
this library is based on!

[React]: http://facebook.github.io/react/
[Om]: https://github.com/swannodette/om
[virtual-dom]: https://github.com/Matt-Esch/virtual-dom
[mercury]: https://github.com/Raynos/mercury
