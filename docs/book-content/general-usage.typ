#import "../../src/bookly.typ": *
#import "../docutils.typ": *

= General Usage

This chapter provides an overview of the general usage of the Bookly template. It covers the basic structure, configuration options, and how to customize your book's appearance and layout.

#minitoc

#pagebreak()

== Using `bookly`

To use the `bookly` template, you need to include the following line at the beginning of your `typ` file:
#code-box[```typ
#import "@preview/bookly:5.1.0": *
```
]

#warning-box[
In `bookly`, the supplement of the `ref` function is set to "none" by default to avoid unexpected behavior when referencing more than one item. However, you can revert this setting by using the following syntax after the template definition:
#code-box[
  ```typ
  #set ref(supplement: auto)
  ```
]]

== Initializing the template

After importing the template, you have to initialize the template by a show rule with the #cmd("bookly") command. This function takes an optional argument to specify the title of the document.
#code-box[```typ
#show: bookly.with(...)
```
]

#command("bookly",
  (
    title: "Title",
    author: "Author Name",
    theme: [fancy],
    tufte: [false],
    lang: "en",
    fonts: [default-fonts],
    colors: [default-colors],
    title-page: [default-title-page],
    config-options: [default-config-options]
  )
)

#argument("title", default: ["Title"], type: [#mtype("string") | #mtype("content")])[
  Title of the book.
]

#pagebreak()
#argument("author", default: ["Author Name"], type: [#mtype("string") | #mtype("content")])[Author of the book.]

#argument("theme", default: "fancy", type: mtype("dictionary"))[Theme of the document. Possible values are:
  - `fancy` (default)
  - `modern`
  - `classic`
  - `orly` (O'Reilly inspired)
  - `pretty`

  Each dictionary contains the following keys:
    - `theme` #mtype("function") -- Show rule defining the theme style.
    - `part` #mtype("function") -- Function defining the style of the part titles.
    - `minitoc` #mtype("content") -- Function defining the style of the mini table of contents.
    - `box` #mtype("function") -- Function defining the style of the information boxes (e.g., info-box, tip-box, etc.).
    - `boxeq` #mtype("function") -- Function defining the style of the equation boxes.
]

#argument("tufte", default: "false", type: mtype("bool"))[If `true`, the layout of the document is inspired by the works of Edward Tufte (wide margins, sidenotes, etc.).
]

#argument("lang", default: "en", type: mtype("string"))[Language of the document.

Supported languages:
- English -- `"en"` (default)
- Chinese -- `"zh"`
- French -- `"fr"`
- German -- `"de"`
- Italian -- `"it"`
- Portuguese -- `"pt"`
- Spanish -- `"es"`
]

#argument("fonts", default: "default-fonts", type: mtype("dictionary"))[Fonts used in the document. It contains the following keys:
  - size #mtype("string") -- Font size (default: `"10pt"`)
  - `body` #mtype("string") -- Font used for the body text (default: `"New Computer Modern"`)
  - `math` #mtype("string") -- Font used for mathematical equations (default: `"New Computer Modern Math"`)
  - `raw` #mtype("string") -- Font used for raw text (default: `"DejaVu Sans Mono"`)
]

#argument("colors", default: "default-colors", type: mtype("dictionary"))[Colors used in the document. It contains the following keys:
  - `primary` #mtype("color") -- Primary color (default: `rgb("#c1002a")`)
  - `secondary` #mtype("color") -- Secondary color (default: `rgb("#dddddd").darken(15%)`)
  - `boxeq` #mtype("color") -- Color of equation boxes (default: `rgb("#dddddd")`)
  - `header` #mtype("color") -- Color used for adapting the color of the document headers (default: `black`)
]

#argument("title-page", default: "default-title-page", type: mtype("content"))[Content of the title page.]

#argument("config-options", default: "default-config-options", type: mtype("dictionary"))[Configuration options of the document. It allows a more fine-grained control of some aspects of the template. It contains the following keys:
	- `alt-margins` #mtype("bool") -- If `true`, margins are alternated for odd and even pages when `tufte` is enabled (default: `false`)
	- `justify-headings` #mtype("bool") -- If `true`, headings are justified (default: `true`)
	- `open-right` #mtype("bool") -- If `true`, parts start on a right-hand page (default: `true`)
	- `paper-size` #mtype("string") -- Size of the paper (default: `"a4"`)
	- `par-indent` #mtype("bool") -- If `true`, paragraphs are indented (default: `false`)
	- `part-numbering` #mtype("string") -- Numbering pattern (default: "1")

    #info-box[If `part-numbering` is set to #mtype("none"), the parts are not numbered. If it is set to `"1"`, the parts are numbered with Arabic numerals. If it is set to `"I"`, the parts are numbered with Roman numerals. Other numbering patterns are possible.]
]

#pagebreak()
*Initialization example*
#code-box[
```typ
#show: bookly.with(
	author: "Author Name",
	fonts: (
		body: "Lato",
		math: "Lete Sans Math"
	),
	theme: modern,
	lang: "en",
	logo: image("path_to_image/image.png")
)
```
]

== Layout

The template currently supports two layouts: `standard` and `tufte`.

The `standard` layout is the default layout, with symmetric margins. It is the most common layout for books and theses. Some examples of the standard layout are presented in section @sss:themes "Themes gallery".

The `tufte` layout is inspired by the works of Edward Tufte, which emphasizes simplicity and clarity, often using wide margins for notes and figures. It is particularly suitable for books or theses that require extensive annotations or side comments. To implement the `tufte` layout, the template comes with several helper functions, based on the `marginalia` package, implementing side notes, side figures, full width blocks, etc. //(see @ss:tufte for details). Some examples of the `tufte` layout are presented below.

#subfigure(
	columns: 3,
	figure(image("../manual-images/tufte-figures.png"), caption: [Figures and side figures]),
	figure(image("../manual-images/tufte-citations.png"), caption: [Citations]),
	figure(image("../manual-images/tufte-wide.png"), caption: [Full width elements]),
	caption: [Examples of the `tufte` layout]
)

== Themes gallery <sss:themes>

=== Fancy

#subfigure(
	columns: 2,
	figure(image("../manual-images/part-fancy.png", width: 80%), caption: "Part"),
	figure(image("../manual-images/chapter-fancy.png", width: 80%), caption: "Chapter"),
	figure(image("../manual-images/chapter-nonum-fancy.png", width: 80%), caption: "Unnumbered chapter"),
	figure(image("../manual-images/sections-fancy.png", width: 80%), caption: "Section"),
	caption: [Examples of the `fancy` theme]
)

=== Modern

#subfigure(
	columns: 2,
	figure(image("../manual-images/part-modern.png", width: 80%), caption: "Part"),
	figure(image("../manual-images/chapter-modern.png", width: 80%), caption: "Chapter"),
	figure(image("../manual-images/chapter-nonum-modern.png", width: 80%), caption: "Unnumbered chapter"),
	figure(image("../manual-images/sections-modern.png", width: 80%), caption: "Section"),
	caption: [Examples of the `modern` theme]
)

=== Classic

#subfigure(
	columns: 2,
	figure(image("../manual-images/part-classic.png", width: 80%), caption: "Part"),
	figure(image("../manual-images/chapter-classic.png", width: 80%), caption: "Chapter"),
	figure(image("../manual-images/chapter-nonum-classic.png", width: 80%), caption: "Unnumbered chapter"),
	figure(image("../manual-images/sections-classic.png", width: 80%), caption: "Section"),
	caption: [Examples of the `classic` theme]
)

=== Obook

#subfigure(
	columns: 2,
	figure(image("../manual-images/part-obook.png", width: 80%), caption: "Part"),
	figure(image("../manual-images/chapter-obook.png", width: 80%), caption: "Chapter"),
	figure(image("../manual-images/chapter-nonum-obook.png", width: 80%), caption: "Unnumbered chapter"),
	figure(image("../manual-images/sections-obook.png", width: 80%), caption: "Section"),
	caption: [Examples of the `obook` theme]
)

=== Orly

#subfigure(
	columns: 2,
	figure(image("../manual-images/part-orly.png", width: 80%), caption: "Part"),
	figure(image("../manual-images/chapter-orly.png", width: 80%), caption: "Chapter"),
	figure(image("../manual-images/chapter-nonum-orly.png", width: 80%), caption: "Unnumbered chapter"),
	figure(image("../manual-images/sections-orly.png", width: 80%), caption: "Section"),
	caption: [Examples of the `orly` theme]
)

=== Pretty

#subfigure(
	columns: 2,
	figure(image("../manual-images/part-pretty.png", width: 80%), caption: "Part"),
	figure(image("../manual-images/chapter-pretty.png", width: 80%), caption: "Chapter"),
	figure(image("../manual-images/chapter-nonum-pretty.png", width: 80%), caption: "Unnumbered chapter"),
	figure(image("../manual-images/sections-pretty.png", width: 80%), caption: "Section"),
	caption: [Examples of the `pretty` theme]
)

#pagebreak()
== Dependencies

The `bookly` template relies on several Typst packages to provide additional functionalities:
#v(0.5em)
- `marginalia:0.3.1`: for tufte layout.
- `hydra:0.6.3` : for bibliography management.
- `equate:0.3.3` : for advanced equation numbering.
- `showybox:2.0.4` : for custom boxes.
- `suboutline:0.3.0` : for mini tables of contents in chapters.
- `subpar:0.2.2` : for subfigures.