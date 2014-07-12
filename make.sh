#!/bin/bash

mkdir -p Native
browserify wrapper.js -o Native/Html.js
echo ";" >> Native/Html.js
elm --make --bundle-runtime --only-js examples/todo/Todo.elm
mv build/examples/todo/Todo.js examples/todo/todo.js
rm -rf build
