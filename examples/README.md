# Examples

There are a bunch of examples here, and [the TodoMVC example][todo] is a great
way to see a slightly more complicated app.

[todo]: https://github.com/evancz/elm-todomvc

### Run an Example

Let's say you want to see the results of `Counter.elm`. You would run the
following two commands:

```bash
elm-get install
elm --make Counter.elm
```

Then open the resulting `build/Counter.html` file in your browser!

You only need to run `elm-get install` once. That will grab the latest released
version of the `elm-html` library.
