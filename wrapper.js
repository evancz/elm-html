
var VNode = require('vtree/vnode');
var VText = require('vtree/vtext');
var diff = require('virtual-dom/diff');
var patch = require('virtual-dom/patch');
var createElement = require('virtual-dom/create-element');

Elm.Native.Html = {};
Elm.Native.Html.make = function(elm) {
    elm.Native = elm.Native || {};
    elm.Native.Html = elm.Native.Html || {};
    if (elm.Native.Html.values) return elm.Native.Html.values;
    if ('values' in Elm.Native.Html)
        return elm.Native.Html.values = Elm.Native.Html.values;

    var newElement = Elm.Graphics.Element.make(elm).newElement;
    var toArray = Elm.Native.List.make(elm).toArray;

    function node(name, attributes, properties, contents) {
        var attrs = {};
        while (attributes.ctor !== '[]') {
            var attribute = attributes._0;
            attrs[attribute._0] = attribute._1;
            attributes = attributes._1;
        }
        var props = {};
        while (properties.ctor !== '[]') {
            var property = properties._0;
            props[property._0] = property._1;
            properties = properties._1;
        }
        attrs.style = props;
        return new VNode(name, attrs, toArray(contents));
    }

    function text(string) {
        return new VText(string);
    }

    function toElement(width, height, html) {
        return A3(newElement, width, height,
                  { ctor: 'Custom'
                  , type: 'evancz/elm-html html'
                  , render: createElement
                  , update: update
                  , model: html
                  });
    }

    function update(node, oldModel, newModel) {
        var patches = diff(oldModel, newModel);
        node = patch(node, patches);
    }

    return Elm.Native.Html.values = {
        node: F4(node),
        text: text,
        toElement: F3(toElement)
    };
};
