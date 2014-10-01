module Html.Tags where
{-| This file is organized roughly in order of popularity. The tags which you'd
expect to use frequently will be closer to the top.

# Headers
Heading elements implement six levels of document headings. `<h1>` is the most
important and `<h6>` is the least. A heading element briefly describes the
topic of the section it introduces.
@docs h1, h2, h3, h4, h5, h6

# Grouping Content
@docs div, p, hr, pre, blockquote

# Text
@docs span, a, code, em, strong, i, b, u, sub, sup, br

# Lists
@docs ol, ul, li, dl, dt, dd

# Emdedded Content
@docs img, iframe, canvas, svg, math

# Inputs
@docs form, input, textarea, button, select, option

# Sections
@docs section, nav, article, aside, header, footer, address, main', body

# Figures
@docs figure, figcaption

# Tables
@docs table, caption, colgroup, col, tbody, thead, tfoot, tr, td, th


# Less Common Elements

## Less Common Inputs
@docs fieldset, legend, label, datalist, optgroup, keygen, output, progress, meter


## Audio and Video
@docs audio, video, source, track

## Embedded Objects
@docs embed, object, param

## Text Edits
@docs ins, del

## Semantic Text
@docs small, cite, dfn, abbr, time, var, samp, kbd, s, q

## Less Common Text Tags
@docs mark, ruby, rt, rp, bdi, bdo, wbr

# Interactive Elements
@docs details, summary, menuitem, menu
-}

import Html (Html, Attribute, node)


-- SECTIONS

{-| Represents the content of an HTML document. There is only one <body>
element in a document.
-}
body : [Attribute] -> [Html] -> Html
body = node "body"

{-| Defines a section in a document.
-}
section : [Attribute] -> [Html] -> Html
section = node "section"

{-| Defines a section that contains only navigation links.
-}
nav : [Attribute] -> [Html] -> Html
nav = node "nav"

{-| Defines self-contained content that could exist independently of the rest
of the content.
-}
article : [Attribute] -> [Html] -> Html
article = node "article"

{-| Defines some content loosely related to the page content. If it is removed,
the remaining content still makes sense.
-}
aside : [Attribute] -> [Html] -> Html
aside = node "aside"

h1 : [Attribute] -> [Html] -> Html
h1 = node "h1"

h2 : [Attribute] -> [Html] -> Html
h2 = node "h2"

h3 : [Attribute] -> [Html] -> Html
h3 = node "h3"

h4 : [Attribute] -> [Html] -> Html
h4 = node "h4"

h5 : [Attribute] -> [Html] -> Html
h5 = node "h5"

h6 : [Attribute] -> [Html] -> Html
h6 = node "h6"

{-| Defines the header of a page or section. It often contains a logo, the
title of the web site, and a navigational table of content.
-}
header : [Attribute] -> [Html] -> Html
header = node "header"

{-| Defines the footer for a page or section. It often contains a copyright
notice, some links to legal information, or addresses to give feedback.
-}
footer : [Attribute] -> [Html] -> Html
footer = node "footer"

{-| Defines a section containing contact information. -}
address : [Attribute] -> [Html] -> Html
address = node "address"

{-| Defines the main or important content in the document. There is only one
`<main>` element in the document.
-}
main' : [Attribute] -> [Html] -> Html
main' = node "main"


-- GROUPING CONTENT

{-| Defines a portion that should be displayed as a paragraph. -}
p : [Attribute] -> [Html] -> Html
p = node "p"

{-| Represents a thematic break between paragraphs of a section or article or
any longer content.
-}
hr : [Attribute] -> [Html] -> Html
hr = node "hr"

{-| Indicates that its content is preformatted and that this format must be
preserved.
-}
pre : [Attribute] -> [Html] -> Html
pre = node "pre"

{-| Represents a content that is quoted from another source. -}
blockquote : [Attribute] -> [Html] -> Html
blockquote = node "blockquote"

{-| Defines an ordered list of items. -}
ol : [Attribute] -> [Html] -> Html
ol = node "ol"

{-| Defines an unordered list of items. -}
ul : [Attribute] -> [Html] -> Html
ul = node "ul"

{-| Defines a item of an enumeration list. -}
li : [Attribute] -> [Html] -> Html
li = node "li"

{-| Defines a definition list, that is, a list of terms and their associated
definitions.
-}
dl : [Attribute] -> [Html] -> Html
dl = node "dl"

{-| Represents a term defined by the next `<dd>`. -}
dt : [Attribute] -> [Html] -> Html
dt = node "dt"

{-| Represents the definition of the terms immediately listed before it. -}
dd : [Attribute] -> [Html] -> Html
dd = node "dd"

{-| Represents a figure illustrated as part of the document. -}
figure : [Attribute] -> [Html] -> Html
figure = node "figure"

{-| Represents the legend of a figure. -}
figcaption : [Attribute] -> [Html] -> Html
figcaption = node "figcaption"

{-| Represents a generic container with no special meaning. -}
div : [Attribute] -> [Html] -> Html
div = node "div"


-- TEXT LEVEL SEMANTIC

{-| Represents a hyperlink , linking to another resource. -}
a : [Attribute] -> [Html] -> Html
a = node "a"

{-| Represents emphasized text, like a stress accent. -}
em : [Attribute] -> [Html] -> Html
em = node "em"

{-| Represents especially important text. -}
strong : [Attribute] -> [Html] -> Html
strong = node "strong"

{-| Represents a side comment , that is, text like a disclaimer or a
copyright, which is not essential to the comprehension of the document.
-}
small : [Attribute] -> [Html] -> Html
small = node "small"

{-| Represents content that is no longer accurate or relevant . -}
s : [Attribute] -> [Html] -> Html
s = node "s"

{-| Represents the title of a work. -}
cite : [Attribute] -> [Html] -> Html
cite = node "cite"

{-| Represents an inline quotation. -}
q : [Attribute] -> [Html] -> Html
q = node "q"

{-| Represents a term whose definition is contained in its nearest ancestor
content.
-}
dfn : [Attribute] -> [Html] -> Html
dfn = node "dfn"

{-| Represents an abbreviation or an acronym ; the expansion of the
abbreviation can be represented in the title attribute.
-}
abbr : [Attribute] -> [Html] -> Html
abbr = node "abbr"

{-| Represents a date and time value; the machine-readable equivalent can be
represented in the datetime attribute.
-}
time : [Attribute] -> [Html] -> Html
time = node "time"

{-| Represents computer code . -}
code : [Attribute] -> [Html] -> Html
code = node "code"

{-| Represents a variable. Specific cases where it should be used include an
actual mathematical expression or programming context, an identifier
representing a constant, a symbol identifying a physical quantity, a function
parameter, or a mere placeholder in prose.
-}
var : [Attribute] -> [Html] -> Html
var = node "var"

{-| Represents the output of a program or a computer. -}
samp : [Attribute] -> [Html] -> Html
samp = node "samp"

{-| Represents user input, often from the keyboard, but not necessarily; it
may represent other input, like transcribed voice commands.
-}
kbd : [Attribute] -> [Html] -> Html
kbd = node "kbd"

{-| Represent a subscript. -}
sub : [Attribute] -> [Html] -> Html
sub = node "sub"

{-| Represent a superscript. -}
sup : [Attribute] -> [Html] -> Html
sup = node "sup"

{-| Represents some text in an alternate voice or mood, or at least of
different quality, such as a taxonomic designation, a technical term, an
idiomatic phrase, a thought, or a ship name.
-}
i : [Attribute] -> [Html] -> Html
i = node "i"

{-| Represents a text which to which attention is drawn for utilitarian
purposes. It doesn't convey extra importance and doesn't imply an alternate
voice.
-}
b : [Attribute] -> [Html] -> Html
b = node "b"

{-| Represents a non-textual annoatation for which the conventional
presentation is underlining, such labeling the text as being misspelt or
labeling a proper name in Chinese text.
-}
u : [Attribute] -> [Html] -> Html
u = node "u"

{-| Represents text highlighted for reference purposes, that is for its
relevance in another context.
-}
mark : [Attribute] -> [Html] -> Html
mark = node "mark"

{-| Represents content to be marked with ruby annotations, short runs of text
presented alongside the text. This is often used in conjunction with East Asian
language where the annotations act as a guide for pronunciation, like the
Japanese furigana.
-}
ruby : [Attribute] -> [Html] -> Html
ruby = node "ruby"

{-| Represents the text of a ruby annotation . -}
rt : [Attribute] -> [Html] -> Html
rt = node "rt"

{-| Represents parenthesis around a ruby annotation, used to display the
annotation in an alternate way by browsers not supporting the standard display
for annotations.
-}
rp : [Attribute] -> [Html] -> Html
rp = node "rp"

{-| Represents text that must be isolated from its surrounding for
bidirectional text formatting. It allows embedding a span of text with a
different, or unknown, directionality.
-}
bdi : [Attribute] -> [Html] -> Html
bdi = node "bdi"

{-| Represents the directionality of its children, in order to explicitly
override the Unicode bidirectional algorithm.
-}
bdo : [Attribute] -> [Html] -> Html
bdo = node "bdo"

{-| Represents text with no specific meaning. This has to be used when no other
text-semantic element conveys an adequate meaning, which, in this case, is
often brought by global attributes like class, lang, or dir.
-}
span : [Attribute] -> [Html] -> Html
span = node "span"

{-| Represents a line break . -}
br : [Attribute] -> [Html] -> Html
br = node "br"

{-| Represents a line break opportunity , that is a suggested point for
wrapping text in order to improve readability of text split on several lines.
-}
wbr : [Attribute] -> [Html] -> Html
wbr = node "wbr"


-- EDITS

{-| Defines an addition to the document. -}
ins : [Attribute] -> [Html] -> Html
ins = node "ins"

{-| Defines a removal from the document. -}
del : [Attribute] -> [Html] -> Html
del = node "del"



-- EMBEDDED CONTENT

{-| Represents an image. -}
img : [Attribute] -> [Html] -> Html
img = node "img"

{-| Embedded an HTML document. -}
iframe : [Attribute] -> [Html] -> Html
iframe = node "iframe"

{-| Represents a integration point for an external, often non-HTML,
application or interactive content.
-}
embed : [Attribute] -> [Html] -> Html
embed = node "embed"

{-| Represents an external resource , which is treated as an image, an HTML
sub-document, or an external resource to be processed by a plug-in.
-}
object : [Attribute] -> [Html] -> Html
object = node "object"

{-| Defines parameters for use by plug-ins invoked by <object> elements. -}
param : [Attribute] -> [Html] -> Html
param = node "param"

{-| Represents a video, the associated audio and captions, and controls. -}
video : [Attribute] -> [Html] -> Html
video = node "video"

{-| Represents a sound or audio stream. -}
audio : [Attribute] -> [Html] -> Html
audio = node "audio"

{-| Allows authors to specify alternative media resources for media elements
like <video> or <audio>.
-}
source : [Attribute] -> [Html] -> Html
source = node "source"

{-| Allows authors to specify timed text track for media elements like <video>
or <audio>.
-}
track : [Attribute] -> [Html] -> Html
track = node "track"

{-| Represents a bitmap area for graphics rendering. -}
canvas : [Attribute] -> [Html] -> Html
canvas = node "canvas"

{-- TODO: get a better way to disambiguate imports
          then expose these functions
{-| In conjunction with <area>, defines an image map. -}
map : [Attribute] -> [Html] -> Html
map = node "map"

{-| In conjunction with <map>, defines an image map. -}
area : [Attribute] -> [Html] -> Html
area = node "area"
--}

{-| Defines an embedded vectorial image. -}
svg : [Attribute] -> [Html] -> Html
svg = node "svg"

{-| Defines a mathematical formula. -}
math : [Attribute] -> [Html] -> Html
math = node "math"


-- TABULAR DATA

{-| Represents data with more than one dimension. -}
table : [Attribute] -> [Html] -> Html
table = node "table"

{-| Represents the title of a table. -}
caption : [Attribute] -> [Html] -> Html
caption = node "caption"

{-| Represents a set of one or more columns of a table. -}
colgroup : [Attribute] -> [Html] -> Html
colgroup = node "colgroup"

{-| Represents a column of a table. -}
col : [Attribute] -> [Html] -> Html
col = node "col"

{-| Represents the block of rows that describes the concrete data of a table.
-}
tbody : [Attribute] -> [Html] -> Html
tbody = node "tbody"

{-| Represents the block of rows that describes the column labels of a table.
-}
thead : [Attribute] -> [Html] -> Html
thead = node "thead"

{-| Represents the block of rows that describes the column summaries of a table.
-}
tfoot : [Attribute] -> [Html] -> Html
tfoot = node "tfoot"

{-| Represents a row of cells in a table. -}
tr : [Attribute] -> [Html] -> Html
tr = node "tr"

{-| Represents a data cell in a table. -}
td : [Attribute] -> [Html] -> Html
td = node "td"

{-| Represents a header cell in a table. -}
th : [Attribute] -> [Html] -> Html
th = node "th"


-- FORMS

{-| Represents a form , consisting of controls, that can be submitted to a
server for processing.
-}
form : [Attribute] -> [Html] -> Html
form = node "form"

{-| Represents a set of controls. -}
fieldset : [Attribute] -> [Html] -> Html
fieldset = node "fieldset"

{-| Represents the caption for a <fieldset>. -}
legend : [Attribute] -> [Html] -> Html
legend = node "legend"

{-| Represents the caption of a form control. -}
label : [Attribute] -> [Html] -> Html
label = node "label"

{-| Represents a typed data field allowing the user to edit the data. -}
input : [Attribute] -> [Html] -> Html
input = node "input"

{-| Represents a button. -}
button : [Attribute] -> [Html] -> Html
button = node "button"

{-| Represents a control allowing selection among a set of options. -}
select : [Attribute] -> [Html] -> Html
select = node "select"

{-| Represents a set of predefined options for other controls. -}
datalist : [Attribute] -> [Html] -> Html
datalist = node "datalist"

{-| Represents a set of options , logically grouped. -}
optgroup : [Attribute] -> [Html] -> Html
optgroup = node "optgroup"

{-| Represents an option in a <select> element or a suggestion of a <datalist>
element.
-}
option : [Attribute] -> [Html] -> Html
option = node "option"

{-| Represents a multiline text edit control. -}
textarea : [Attribute] -> [Html] -> Html
textarea = node "textarea"

{-| Represents a key-pair generator control. -}
keygen : [Attribute] -> [Html] -> Html
keygen = node "keygen"

{-| Represents the result of a calculation. -}
output : [Attribute] -> [Html] -> Html
output = node "output"

{-| Represents the completion progress of a task. -}
progress : [Attribute] -> [Html] -> Html
progress = node "progress"

{-| Represents a scalar measurement (or a fractional value), within a known
range.
-}
meter : [Attribute] -> [Html] -> Html
meter = node "meter"


-- INTERACTIVE ELEMENTS

{-| Represents a widget from which the user can obtain additional information
or controls.
-}
details : [Attribute] -> [Html] -> Html
details = node "details"

{-| Represents a summary , caption , or legend for a given <details>. -}
summary : [Attribute] -> [Html] -> Html
summary = node "summary"

{-| Represents a command that the user can invoke. -}
menuitem : [Attribute] -> [Html] -> Html
menuitem = node "menuitem"

{-| Represents a list of commands. -}
menu : [Attribute] -> [Html] -> Html
menu = node "menu"
