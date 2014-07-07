# HTML in Elm

Create composable widgets with the full power of HTML and CSS. This library
lets you:

  * Render really freakin' fast 
  * Reuse existing CSS
  * Use all the latest standards, such as [flexbox][]

[flexbox]: (http://css-tricks.com/snippets/css/a-guide-to-flexbox/)

[Embedding Elm widgets](https://github.com/evancz/elm-html-and-js) in existing
applications and [JS interop](http://elm-lang.org/learn/Ports.elm) are both
really easy, so this library takes the next logical step in improving Elm's
interop story.

## Reusable Widgets

With this library, you have the full power of Elm to create nice abstractions to
make your view code modular. Creating a list of user profiles is a matter of can
be nicely abstracted with something like this:

```haskell
import Html (..)

listing : [User] -> Html
listing users =
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

listing : [User] -> Html
listing users =
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

Fill in as soon as I get TodoMVC working.

## Influences

[React](http://facebook.github.io/react/),
[Om](https://github.com/swannodette/om),
[virtual-dom](https://github.com/Matt-Esch/virtual-dom),
[mercury](https://github.com/Raynos/mercury)
