module Html.Attributes where


-- GLOBAL ATTRIBUTES

class	Often used with CSS to style elements with common properties.
hidden	Indicates the relevance of an element.
id	Often used with CSS to style a specific element. The value of this attribute must be unique.
style	Defines CSS styles which will override styles previously set.
title	Text to be displayed in a tooltip when hovering over the element.

accesskey	Defines a keyboard shortcut to activate or add focus to the element.
contenteditable	Indicates whether the element's content is editable.
contextmenu	Defines the ID of a <menu> element which will serve as the element's context menu.
dir	Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)
draggable	Defines whether the element can be dragged.
dropzone	Indicates that the element accept the dropping of content on it.
itemprop	 
lang	Defines the language used in the element.
spellcheck	Indicates whether spell checking is allowed for the element.
tabindex	Overrides the browser's default tab order and follows the one specified instead.


-- HEADER STUFF

async	<script>	Indicates that the script should be executed asynchronously.
charset	<meta>, <script>	Declares the character encoding of the page or script.
content	<meta>	A value associated with http-equiv or name depending on the context.
defer	<script>	Indicates that the script should be executed after the page has been parsed.
httpEquiv	<meta>	 
language	<script>	Defines the script language used in the element.
scoped	<style>	 
sizes	<link>	 


-- AUDIO and VIDEO

src	<audio>, <embed>, <iframe>, <img>, <input>, <script>, <source>, <track>, <video>	The URL of the embeddable content.

height	<canvas>, <embed>, <iframe>, <img>, <input>, <object>, <video>	Note: In some instances, such as <div>, this is a legacy attribute, in which case the CSS height property should be used instead. In other cases, such as <canvas>, the height must be specified with this attribute.
width	<canvas>, <embed>, <iframe>, <img>, <input>, <object>, <video>	Note: In some instances, such as <div>, this is a legacy attribute, in which case the CSS width property should be used instead. In other cases, such as <canvas>, the width must be specified with this attribute.

The audio or video should play as soon as possible.
autoplay : Bool -> Attribute

Indicates whether the browser should show playback controls to the user.
controls : Bool -> Attribute

Indicates whether the media should start playing from the start when it's finished.
loop : Bool -> Attribute

Indicates whether the whole resource, parts of it or nothing should be preloaded.
preload : Bool -> Attribute

default	<track>	Indicates that the track should be enabled unless the user's preferences indicate something different.
kind	<track>	Specifies the kind of text track.
label	<track>	Specifies a user-readable title of the text track.
srclang	<track>	 

poster	<video>	A URL indicating a poster frame to show until the user plays or seeks.


-- INPUT

accept	<form>, <input>	List of types the server accepts, typically a file type.
acceptCharset	<form>	List of supported charsets.
action	<form>	The URI of a program that processes the information submitted via the form.
alt	<area>, <img>, <input> Alternative text in case an image can't be displayed.
autocomplete	<form>, <input>	Indicates whether controls in this form can by default have their values automatically completed by the browser.
autofocus	<button>, <input>, <keygen>, <select>, <textarea>	The element should be automatically focused after the page loaded.
autosave	<input>	Previous values should persist dropdowns of selectable values across page loads.
checked	<input>	Indicates whether the element should be checked on page load.
dirname	<input>, <textarea>	 
disabled	<button>, <fieldset>, <input>, <keygen>, <optgroup>, <option>, <select>, <textarea>	Indicates whether the user can interact with the element.
enctype	<form>	Defines the content type of the form date when the method is POST.
formaction	<input>, <button>	Indicates the action of the element, overriding the action defined in the <form>.
list	<input>	Identifies a list of pre-defined options to suggest to the user.
max	<input>, <meter>, <progress>	Indicates the maximum value allowed.
maxlength	<input>, <textarea>	Defines the maximum number of characters allowed in the element.
method	<form>	Defines which HTTP method to use when submitting the form. Can be GET (default) or POST.
min	<input>, <meter>	Indicates the minimum value allowed.
multiple	<input>, <select>	Indicates whether multiple values can be entered in an input of the type email or file.
name	<button>, <form>, <fieldset>, <iframe>, <input>, <keygen>, <object>, <output>, <select>, <textarea>, <map>, <meta>, <param>	Name of the element. For example used by the server to identify the fields in form submits.
novalidate	<form>	This attribute indicates that the form shouldn't be validated when submitted.
pattern	<input>	Defines a regular expression which the element's value will be validated against.
placeholder	<input>, <textarea>	Provides a hint to the user of what can be entered in the field.
readonly	<input>, <textarea>	Indicates whether the element can be edited.
required	<input>, <select>, <textarea>	Indicates whether this element is required to fill out or not.
selected	<option>	Defines a value which will be selected on page load.
size	<input>, <select>	Defines the width of the element (in pixels). If the element's type attribute is text or password then it's the number of characters.
step	<input>	 
type'	<button>, <input>, <embed>, <object>, <script>, <source>, <style>, <menu>	Defines the type of the element.
value	<button>, <option>, <input>, <li>, <meter>, <progress>, <param>	Defines a default value which will be displayed in the element on page load.


cols	<textarea>	Defines the number of columns in a textarea.
rows	<textarea>	Defines the number of rows in a textarea.
wrap	<textarea>	Indicates whether the text should be wrapped.


challenge	<keygen>	A challenge string that is submitted along with the public key.
keytype	<keygen>	Specifies the type of key generated.


align	<caption>, <col>, <colgroup>,  <hr>, <iframe>, <img>, <table>, <tbody>,  <td>,  <tfoot> , <th>, <thead>, <tr>	Specifies the horizontal alignment of the element.
cite	<blockquote>, <del>, <ins>, <q>	Contains a URI which points to the source of the quote or change.
coords	<area>	A set of values specifying the coordinates of the hot-spot region.

data <object> Specifies the URL of the resource.
data-* Global attribute Lets you attach custom attributes to an HTML element.

download	<a>, <area>	Indicates that the hyperlink is to be used for downloading a resource.
href	<a>, <area>, <base>, <link>	 The URL of a linked resource.
hreflang	<a>, <area>, <link>	Specifies the language of the linked resource.
media	<a>, <area>, <link>, <source>, <style>	Specifies a hint of the media for which the linked resource was designed.
ping	<a>, <area>	 
rel	<a>, <area>, <link>	Specifies the relationship of the target object to the link object.
shape	<a>, <area>	 
target	<a>, <area>, <base>, <form>	 


datetime	<del>, <ins>, <time>	Indicates the date and time associated with the element.
pubdate	<time>	Indicates whether this date and time is the date of the nearest <article> ancestor element.

for	<label>, <output>	Describes elements which belongs to this one.
form	<button>, <fieldset>, <input>, <keygen>, <label>, <meter>, <object>, <output>, <progress>, <select>, <textarea>	Indicates the form that is the owner of the element.

high	<meter>	Indicates the lower bound of the upper range.
low	<meter>	Indicates the upper bound of the lower range.
optimum	<meter>	Indicates the optimal numeric value.

reversed	<ol>	Indicates whether the list should be displayed in a descending order instead of a ascending.
start	<ol>	Defines the first number if other than 1.

colspan	<td>, <th>	The colspan attribute defines the number of columns a cell should span.
headers	<td>, <th>	IDs of the <th> elements which applies to this element.
rowspan	<td>, <th>	Defines the number of rows a table cell should span over.
scope	<th>	 
summary	<table>	 

sandbox	<iframe>	 
seamless	<iframe>	 
srcdoc	<iframe>	 

ismap	<img>	Indicatesthat the image is part of a server-side image map.
manifest	<html>	Specifies the URL of the document's cache manifest.
span	<col>, <colgroup>	 
usemap	<img>,  <input>, <object>	 

open	<details>	Indicates whether the details will be shown on page load.
