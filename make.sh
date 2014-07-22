#!/bin/bash

mkdir -p Native
browserify wrapper.js -o Native/Html.js
echo ";" >> Native/Html.js
