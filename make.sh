#!/bin/bash

mkdir -p Native
browserify wrapper.js -o Native/Html.js
echo ";" >> Native/Html.js
elm --make examples/todo/Todo.elm
mv build/examples/todo/Todo.html examples/todo/index.html
rm -rf build
