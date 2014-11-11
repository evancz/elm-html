#!/bin/bash

browserify src/wrapper.js -o src/Native/Html.js
echo ";" >> src/Native/Html.js
