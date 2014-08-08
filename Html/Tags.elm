module Html.Tag where
{-|

# Headers

Heading elements implement six levels of document headings. `<h1>` is the most
important and `<h6>` is the least. A heading element briefly describes the
topic of the section it introduces.

@docs h1, h2, h3, h4, h5, h6

# Sections

@docs section, nav, article, aside, header, footer, address, main', body
-}
import Native.Html


-- SECTIONS

{-| Represents the content of an HTML document. There is only one <body>
element in a document.
-}
body : [Attribute] -> [Html] -> Html

{-| Defines a section in a document.
-}
section : [Attribute] -> [Html] -> Html

{-| Defines a section that contains only navigation links.
-}
nav : [Attribute] -> [Html] -> Html

{-| Defines self-contained content that could exist independently of the rest
of the content.
-}
article : [Attribute] -> [Html] -> Html

{-| Defines some content loosely related to the page content. If it is removed,
the remaining content still makes sense.
-}
aside : [Attribute] -> [Html] -> Html

h1 : [Attribute] -> [Html] -> Html
h2 : [Attribute] -> [Html] -> Html
h3 : [Attribute] -> [Html] -> Html
h4 : [Attribute] -> [Html] -> Html
h5 : [Attribute] -> [Html] -> Html
h6 : [Attribute] -> [Html] -> Html

{-| Defines the header of a page or section. It often contains a logo, the
title of the web site, and a navigational table of content.
-}
header : [Attribute] -> [Html] -> Html

{-| Defines the footer for a page or section. It often contains a copyright
notice, some links to legal information, or addresses to give feedback.
-}
footer : [Attribute] -> [Html] -> Html

{-| Defines a section containing contact information. -}
address : [Attribute] -> [Html] -> Html

{-| Defines the main or important content in the document. There is only one
`<main>` element in the document.
-}
main' : [Attribute] -> [Html] -> Html


-- GROUPING CONTENT

{-| Defines a portion that should be displayed as a paragraph. -}
p : [Attribute] -> [Html] -> Html

{-| Represents a thematic break between paragraphs of a section or article or
any longer content.
-}
hr : [Attribute] -> [Html] -> Html

{-| Indicates that its content is preformatted and that this format must be
preserved.
-}
pre : [Attribute] -> [Html] -> Html

{-| Represents a content that is quoted from another source. -}
blockquote : [Attribute] -> [Html] -> Html

{-| Defines an ordered list of items. -}
ol : [Attribute] -> [Html] -> Html

{-| Defines an unordered list of items. -}
ul : [Attribute] -> [Html] -> Html

{-| Defines a item of an enumeration list. -}
li : [Attribute] -> [Html] -> Html

{-| Defines a definition list, that is, a list of terms and their associated
definitions.
-}
dl : [Attribute] -> [Html] -> Html

{-| Represents a term defined by the next `<dd>`. -}
dt : [Attribute] -> [Html] -> Html

{-| Represents the definition of the terms immediately listed before it. -}
dd : [Attribute] -> [Html] -> Html

{-| Represents a figure illustrated as part of the document. -}
figure : [Attribute] -> [Html] -> Html

{-| Represents the legend of a figure. -}
figcaption : [Attribute] -> [Html] -> Html

{-| Represents a generic container with no special meaning. -}
div : [Attribute] -> [Html] -> Html


-- TEXT LEVEL SEMANTIC

{-| Represents a hyperlink , linking to another resource. -}
a : [Attribute] -> [Html] -> Html

{-| Represents emphasized text, like a stress accent. -}
em : [Attribute] -> [Html] -> Html

{-| Represents especially important text. -}
strong : [Attribute] -> [Html] -> Html

{-| Represents a side comment , that is, text like a disclaimer or a
copyright, which is not essential to the comprehension of the document.
-}
small : [Attribute] -> [Html] -> Html

{-| Represents content that is no longer accurate or relevant . -}
s : [Attribute] -> [Html] -> Html

{-| Represents the title of a work. -}
cite : [Attribute] -> [Html] -> Html

{-| Represents an inline quotation. -}
q : [Attribute] -> [Html] -> Html

{-| Represents a term whose definition is contained in its nearest ancestor
content.
-}
dfn : [Attribute] -> [Html] -> Html

{-| Represents an abbreviation or an acronym ; the expansion of the
abbreviation can be represented in the title attribute.
-}
abbr : [Attribute] -> [Html] -> Html

{-| Represents a date and time value; the machine-readable equivalent can be represented in the datetime attribute. -}
time : [Attribute] -> [Html] -> Html

{-| Represents computer code . -}
code : [Attribute] -> [Html] -> Html

{-| Represents a variable, that is, an actual mathematical expression or programming context, an identifier representing a constant, a symbol identifying a physical quantity, a function parameter, or a mere placeholder in prose. -}
var : [Attribute] -> [Html] -> Html

{-| Represents the output of a program or a computer. -}
samp : [Attribute] -> [Html] -> Html

{-| Represents user input , often from the keyboard, but not necessarily; it may represent other input, like transcribed voice commands. -}
kbd : [Attribute] -> [Html] -> Html

{-| Represent a subscript , or a superscript. -}
sub>,<sup : [Attribute] -> [Html] -> Html

{-| Represents some text in an alternate voice or mood, or at least of different quality, such as a taxonomic designation, a technical term, an idiomatic phrase, a thought, or a ship name. -}
i : [Attribute] -> [Html] -> Html

{-| Represents a text which to which attention is drawn for utilitarian purposes . It doesn't convey extra importance and doesn't imply an alternate voice. -}
b : [Attribute] -> [Html] -> Html

{-| Represents a non-textual annoatation for which the conventional presentation is underlining, such labeling the text as being misspelt or labeling a proper name in Chinese text. -}
u : [Attribute] -> [Html] -> Html

{-| Represents text highlighted for reference purposes, that is for its relevance in another context. -}
mark : [Attribute] -> [Html] -> Html

{-| Represents content to be marked with ruby annotations , short runs of text presented alongside the text. This is often used in conjunction with East Asian language where the annotations act as a guide for pronunciation, like the Japanese furigana . -}
ruby : [Attribute] -> [Html] -> Html

{-| Represents the text of a ruby annotation . -}
rt : [Attribute] -> [Html] -> Html

{-| Represents parenthesis around a ruby annotation, used to display the annotation in an alternate way by browsers not supporting the standard display for annotations. -}
rp : [Attribute] -> [Html] -> Html

{-| Represents text that must be isolated from its surrounding for bidirectional text formatting. It allows embedding a span of text with a different, or unknown, directionality. -}
bdi : [Attribute] -> [Html] -> Html

{-| Represents the directionality of its children, in order to explicitly override the Unicode bidirectional algorithm. -}
bdo : [Attribute] -> [Html] -> Html

{-| Represents text with no specific meaning. This has to be used when no other text-semantic element conveys an adequate meaning, which, in this case, is often brought by global attributes like class, lang, or dir. -}
span : [Attribute] -> [Html] -> Html

{-| Represents a line break . -}
br : [Attribute] -> [Html] -> Html

{-| Represents a line break opportunity , that is a suggested point for wrapping text in order to improve readability of text split on several lines. -}
wbr : [Attribute] -> [Html] -> Html


-- EDITS

{-| Defines an addition to the document. -}
ins : [Attribute] -> [Html] -> Html

{-| Defines a removal from the document. -}
del : [Attribute] -> [Html] -> Html



-- EMBEDDED CONTENT

{-| Represents an image. -}
img : [Attribute] -> [Html] -> Html

{-| Represents a nested browsing context , that is an embedded HTML document. -}
iframe : [Attribute] -> [Html] -> Html

{-| Represents a integration point for an external, often non-HTML, application or interactive content. -}
embed : [Attribute] -> [Html] -> Html

{-| Represents an external resource , which is treated as an image, an HTML sub-document, or an external resource to be processed by a plug-in. -}
object : [Attribute] -> [Html] -> Html

{-| Defines parameters for use by plug-ins invoked by <object> elements. -}
param : [Attribute] -> [Html] -> Html

{-| Represents a video , and its associated audio files and captions, with the necessary interface to play it. -}
video : [Attribute] -> [Html] -> Html

{-| Represents a sound , or an audio stream. -}
audio : [Attribute] -> [Html] -> Html

{-| Allows authors to specify alternative media resources for media elements like <video> or <audio>. -}
source : [Attribute] -> [Html] -> Html

{-| Allows authors to specify timed text track for media elements like <video> or <audio>. -}
track : [Attribute] -> [Html] -> Html

{-| Represents a bitmap area that scripts can be used to render graphics, like graphs, game graphics, or any visual images on the fly. -}
canvas : [Attribute] -> [Html] -> Html

{-| In conjunction with <area>, defines an image map. -}
map : [Attribute] -> [Html] -> Html

{-| In conjunction with <map>, defines an image map. -}
area : [Attribute] -> [Html] -> Html

{-| Defines an embedded vectorial image. -}
svg : [Attribute] -> [Html] -> Html

{-| Defines a mathematical formula. -}
math : [Attribute] -> [Html] -> Html


-- TABULAR DATA

{-| Represents data with more than one dimension. -}
table : [Attribute] -> [Html] -> Html

{-| Represents the title of a table. -}
caption : [Attribute] -> [Html] -> Html

{-| Represents a set of one or more columns of a table. -}
colgroup : [Attribute] -> [Html] -> Html

{-| Represents a column of a table. -}
col : [Attribute] -> [Html] -> Html

{-| Represents the block of rows that describes the concrete data of a table. -}
tbody : [Attribute] -> [Html] -> Html

{-| Represents the block of rows that describes the column labels of a table. -}
thead : [Attribute] -> [Html] -> Html

{-| Represents the block of rows that describes the column summaries of a table. -}
tfoot : [Attribute] -> [Html] -> Html

{-| Represents a row of cells in a table. -}
tr : [Attribute] -> [Html] -> Html

{-| Represents a data cell in a table. -}
td : [Attribute] -> [Html] -> Html

{-| Represents a header cell in a table. -}
th : [Attribute] -> [Html] -> Html


-- FORMS

{-| Represents a form , consisting of controls, that can be submitted to a server for processing. -}
form : [Attribute] -> [Html] -> Html

{-| Represents a set of controls. -}
fieldset : [Attribute] -> [Html] -> Html

{-| Represents the caption for a <fieldset>. -}
legend : [Attribute] -> [Html] -> Html

{-| Represents the caption of a form control. -}
label : [Attribute] -> [Html] -> Html

{-| Represents a typed data field allowing the user to edit the data. -}
input : [Attribute] -> [Html] -> Html

{-| Represents a button. -}
button : [Attribute] -> [Html] -> Html

{-| Represents a control allowing selection among a set of options. -}
select : [Attribute] -> [Html] -> Html

{-| Represents a set of predefined options for other controls. -}
datalist : [Attribute] -> [Html] -> Html

{-| Represents a set of options , logically grouped. -}
optgroup : [Attribute] -> [Html] -> Html

{-| Represents an option in a <select> element, or a suggestion of a <datalist> element. -}
option : [Attribute] -> [Html] -> Html

{-| Represents a multiline text edit control. -}
textarea : [Attribute] -> [Html] -> Html

{-| Represents a key-pair generator control. -}
keygen : [Attribute] -> [Html] -> Html

{-| Represents the result of a calculation. -}
output : [Attribute] -> [Html] -> Html

{-| Represents the completion progress of a task. -}
progress : [Attribute] -> [Html] -> Html

{-| Represents a scalar measurement (or a fractional value), within a known range. -}
meter : [Attribute] -> [Html] -> Html


-- INTERACTIVE ELEMENTS

{-| Represents a widget from which the user can obtain additional information or controls. -}
details : [Attribute] -> [Html] -> Html

{-| Represents a summary , caption , or legend for a given <details>. -}
summary : [Attribute] -> [Html] -> Html

{-| Represents a command that the user can invoke. -}
menuitem : [Attribute] -> [Html] -> Html

{-| Represents a list of commands. -}
menu : [Attribute] -> [Html] -> Html
