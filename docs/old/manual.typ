#import "@preview/mantys:1.0.2": *
#import "@preview/showybox:2.0.4": *
#import "@preview/swank-tex:0.1.0": LaTeX
#import "@preview/cheq:0.2.2": *
#import "../src/bookly.typ": *

#show: checklist.with(fill: eastern.lighten(95%), stroke: eastern, radius: .2em)

#let typst-color = rgb(35,157,173)
#let Typst = text("Typst", fill: typst-color)

#let abstract = [This Typst package is a proposed template for writing thesis dissertations, French habilitations, or scientific books.]

#show: mantys(
  name: "bookly.typ",
  version: "4.1.3",
  authors: ("Mathieu Aucejo",),

  license: "MIT",
  description: "Write beautiful scientific book or thesis with Typst",
  repository: "https://github.com/maucejo/bookly",

  title: "Book Template",
  date: datetime.today(),

  abstract: abstract,
  show-index: false
)


= Usage

== Using `bookly`

To use the #package[bookly] template, you need to include the following line at the beginning of your `typ` file:
#codesnippet[```typ
#import "@preview/bookly:4.1.3": *
```
]

#warning-alert[
In `bookly`, the supplement of the `ref` function is set to "none" by default to avoid unexpected behavior when referencing more than one item. However, you can revert this setting by using the following syntax after the template definition:
#codesnippet[
  ```typ
  #set ref(supplement: auto)
  ```
]]

== Initializing the template

After importing #package[bookly], you have to initialize the template by a show rule with the #cmd[bookly] command. This function takes an optional argument to specify the title of the document.
#codesnippet[```typ
#show: bookly.with(
  ...
)
```
]

#command("bookly", ..args(
	title: "Title",
  author: "Author Name",
	theme: "fancy",
	tufte: false,
	lang: "fr",
	fonts: "default-fonts",
	colors: "default-colors",
	title-page: none,
	config-options: "default-config-options",
	[body]))[
		#argument("title", default: "Title", types: "string")[Title of the book or the thesis.]

		#argument("author", default: "Author Name", types: "string")[Author of the book.]

		#argument("theme", default: "fancy", types: "dict")[Theme of the document. Possible values are:
			- `fancy` (default)
			- `modern`
			- `classic`
			- `orly` (O'Reilly inspired)
			- `pretty`

			Each dictionary contains the following keys:
				- `theme` #dtype(function) -- Show rule defining the theme style.
				- `part` #dtype(function) -- Function defining the style of the part titles.
				- `minitoc` #dtype(content) -- Function defining the style of the mini table of contents.
				- `box` #dtype(function) -- Function defining the style of the information boxes (e.g., info-box, tip-box, etc.).
				- `boxeq` #dtype(function) -- Function defining the style of the equation boxes.
		]

		#argument("tufte", default: false, types: "bool")[If `true`, the layout of the document is inspired by the works of Edward Tufte (wide margins, sidenotes, etc.).
		]

		#argument("lang", default: "en", types: "string")[Language of the document.

		Supported languages:
		- English -- `"en"` (default)
		- Chinese -- `"zh"`
		- French -- `"fr"`
		- German -- `"de"`
		- Italian -- `"it"`
		- Portuguese -- `"pt"`
		- Spanish -- `"es"`
		]

		#argument("fonts", default: "default-fonts", types: "dict")[Fonts used in the document. It contains the following keys:
			- size #dtype(str) -- Font size (default: `"10pt"`)
			- `body` #dtype(str) -- Font used for the body text (default: `"New Computer Modern"`)
			- `math` #dtype(str) -- Font used for mathematical equations (default: `"New Computer Modern Math"`)
			- `raw` #dtype(str) -- Font used for raw text (default: `"DejaVu Sans Mono"`)
		]

		#argument("colors", default: "default-colors", types: "dict")[Colors used in the document. It contains the following keys:
			- `primary` #dtype(color) -- Primary color (default: `rgb("#c1002a")`)
			- `secondary` #dtype(color) -- Secondary color (default: `rgb("#dddddd").darken(15%)`)
			- `boxeq` #dtype(color) -- Color of equation boxes (default: `rgb("#dddddd")`)
			- `header` #dtype(color) -- Color used for adapting the color of the document headers (default: `black`)
		]

		#argument("title-page", default: none, types: "content")[Content of the title page.]

		#argument("config-options", default: "default-config-options", types: "dict")[Configuration options of the document. It allows a more fine-grained control of some aspects of the template. It contains the following keys:
			- `part-numbering` #dtype(str) -- Numbering pattern (default: "1")
			- `open-right` #dtype(bool) -- If `true`, parts start on a right-hand page (default: `true`)
			- `alt-margins` #dtype(bool) -- If `true`, margins are alternated for odd and even pages when `tufte` is enabled (default: `false`)
			- `paper-size` #dtype(str) -- Size of the paper (default: `"a4"`).
			- `par-indent` #dtype(bool) -- If `true`, paragraphs are indented (default: `false`)

			#info-alert[If `part-numbering` is set to #dtype(none), the parts are not numbered. If it is set to `"1"`, the parts are numbered with Arabic numerals. If it is set to `"I"`, the parts are numbered with Roman numerals. Other numbering patterns are possible.]
		]
]

=== Initialization example
#codesnippet[
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

=== Themes gallery <sss:themes>

==== Fancy

#subfigure(
	columns: 2,
	figure(image("manual-images/part-fancy.png", width: 80%), caption: "Part"),
	figure(image("manual-images/chapter-fancy.png", width: 80%), caption: "Chapter"),
	figure(image("manual-images/chapter-nonum-fancy.png", width: 80%), caption: "Unnumbered chapter"),
	figure(image("manual-images/sections-fancy.png", width: 80%), caption: "Section"),
)

==== Modern

#subfigure(
	columns: 2,
	figure(image("manual-images/part-modern.png", width: 80%), caption: "Part"),
	figure(image("manual-images/chapter-modern.png", width: 80%), caption: "Chapter"),
	figure(image("manual-images/chapter-nonum-modern.png", width: 80%), caption: "Unnumbered chapter"),
	figure(image("manual-images/sections-modern.png", width: 80%), caption: "Section"),
)

==== Classic

#subfigure(
	columns: 2,
	figure(image("manual-images/part-classic.png", width: 80%), caption: "Part"),
	figure(image("manual-images/chapter-classic.png", width: 80%), caption: "Chapter"),
	figure(image("manual-images/chapter-nonum-classic.png", width: 80%), caption: "Unnumbered chapter"),
	figure(image("manual-images/sections-classic.png", width: 80%), caption: "Section"),
)

==== Obook

#subfigure(
	columns: 2,
	figure(image("manual-images/part-obook.png", width: 80%), caption: "Part"),
	figure(image("manual-images/chapter-obook.png", width: 80%), caption: "Chapter"),
	figure(image("manual-images/chapter-nonum-obook.png", width: 80%), caption: "Unnumbered chapter"),
	figure(image("manual-images/sections-obook.png", width: 80%), caption: "Section"),
)

==== Orly

#subfigure(
	columns: 2,
	figure(image("manual-images/part-orly.png", width: 80%), caption: "Part"),
	figure(image("manual-images/chapter-orly.png", width: 80%), caption: "Chapter"),
	figure(image("manual-images/chapter-nonum-orly.png", width: 80%), caption: "Unnumbered chapter"),
	figure(image("manual-images/sections-orly.png", width: 80%), caption: "Section"),
)

==== Pretty

#subfigure(
	columns: 2,
	figure(image("manual-images/part-pretty.png", width: 80%), caption: "Part"),
	figure(image("manual-images/chapter-pretty.png", width: 80%), caption: "Chapter"),
	figure(image("manual-images/chapter-nonum-pretty.png", width: 80%), caption: "Unnumbered chapter"),
	figure(image("manual-images/sections-pretty.png", width: 80%), caption: "Section"),
)

=== Layout

The template currently supports two layouts: `standard` and `tufte`.

The `standard` layout is the default layout, with symmetric margins. It is the most common layout for books and theses. Some examples of the standard layout are presented in @sss:themes "Themes gallery".

The `tufte` layout is inspired by the works of Edward Tufte, which emphasizes simplicity and clarity, often using wide margins for notes and figures. It is particularly suitable for books or theses that require extensive annotations or side comments. To implement the `tufte` layout, the template comes with several helper functions, based on the `marginalia` package, implementing side notes, side figures, full width blocks, etc. (see @ss:tufte for details). Some examples of the `tufte` layout are presented below.

#subfigure(
	columns: 3,
	figure(image("manual-images/tufte-figures.png"), caption: [Figures and side figures]),
	figure(image("manual-images/tufte-citations.png"), caption: [Citations]),
	figure(image("manual-images/tufte-wide.png"), caption: [Full width elements]),
)

= Book content

The content of the book should be written in the main `typ` file or in additional files. The template provides a basic structure for writing a book.

In general, the section of the main file corresponding to the book content is structured as follows:
#codesnippet[
	```typ
	#show: front-matter

	#include "front-content.typ"

	#show: main-matter

	#tableofcontents

	#listoffigures

	#listoftables

	#part("Main body")

	#include "chapter.typ"

	#bibliography("bibliography.bib")

	#show: appendix

	#part("Document appendices")

	#include "appendix.typ"
	```
]

The content of the thesis is divided into three main sections: `front-matter`, `main-matter`, and `appendix`. These elements are accompanied by additional functions to facilitate writing.

== Environments

The template provides three environments to structure the thesis content:

1. *front-matter*: environment for preliminary content (cover page, abstract, acknowledgments, etc.). Pages are numbered with Roman numerals and chapters are not numbered. To activate this environment, insert the following command in the main `typ` file at the desired location:
	#codesnippet[
		```typ
		#show: front-matter
		```
	]

2. *main-matter*: environment for the main content (introduction, tables of contents, chapters, conclusion, bibliography, etc.). Pages and chapters are numbered with Arabic numerals. To activate this environment, insert the following command in the main `typ` file at the desired location:
	#codesnippet[
	```typ
	#show: main-matter
	```
]

3. *appendix*: environment for the appendices. Pages are numbered with Roman numerals and chapters are numbered with letters. To activate this environment, insert the following command in the main `typ` file at the desired location:
	#codesnippet[
		```typ
		#show: appendix
		```
	]

== Parts and chapters

To structure the book content, you can define parts using the #cmd("part") function. To insert a new part, use the following command:
#codesnippet[
	```typ
	#part("Part title")
	```
]

Chapters can also be defined using the standard #Typst markup language. This template defines a function #cmd("chapter") that helps you to avoid boilerplate code, such as the manual inclusion of standard elements like title, abstract, and minitoc.

#command("chapter", arg[title],
..args(
	abstract: none,
	toc: true,
	numbered: true,
	label: none,
	[body],
)
)[
	#argument("title", types: "string")[Chapter title.]

	#argument("abstract", default: none, types: "content")[Summary displayed below the chapter title.]

	#argument("toc", default: true, types: "boolean")[Indicates whether a mini table of contents should be displayed at the beginning of the chapter.]

	#argument("numbered", default: true, types: "boolean")[Indicates whether the chapter should be numbered.]

	#argument("label", default: none, types: "label")[Label for the chapter.]
]

#codesnippet[
```typ
	#chapter(
		"First chapter",
		abstract: lorem(20),
		label: <ch:1>
	)[
		// Content of the chapter
	]
```
]
#info-alert[If you use a #sym.ast\.typ file for each chapter, you can type at the top of the file the following code.

	#codesnippet[
		```typ
		#show: chapter.with("First chapter", abstract: lorem(20), toc: true, label: <ch:1>)

		// Content of the chapter
		== First section
		```
	]
]

For unnumbered chapters, you can simply use the #cmd("chapter-nonum") function. This function assumes that you have a #sym.ast\.typ file per chapter.
#codesnippet[
	```typ
	#show: chapter-nonum

	// Content of the chapter
	= Chapter title
	```
]

`bookly` also provides the #dtype("label") `<nonum-sec>` to create unnumbered sections. To use it, simply add the label `<nonum-sec>` after the title of the considered section.
#codesnippet[
```typ
== Section title <nonum-sec>
```
]
#warning-alert[The `<nonum-sec>` label only works for sections and not for chapters. When applied to chapters, it breaks the global numbering of the document. For unnumbered chapters, use the #cmd("chapter-nonum") function. instead]

== Tables of contents

The template defines several commands to facilitate the creation of tables of contents:
- #cmd("tableofcontents") : Table of contents
- #cmd("listoffigures") : List of figures
- #cmd("listoftables") : List of tables

A mini table of contents is automatically generated by using the command #cmd("minitoc") in a chapter. This function is a wraper of the #cmd("suboutline") function provided by the `suboutline` package.

= Helper functions

== Figure captions

The package include the command #cmd("ls-caption") to manage long and short captions for figures and tables. Short caption are displayed in the list of figures or tables, while long captions are used in the main text and in the table of contents.

#codesnippet[
	```typ
	#figure(
  	rect(),
  	caption: ls-caption("Long caption", "Short caption")
	)
	```
]

#info-alert[The code of the command #cmd("ls-caption") comes from the #link("https://sitandr.github.io/typst-examples-book/book/snippets/chapters/outlines.html?highlight=long#long-and-short-captions-for-the-outline", "Typst book") by Sitandr.]

== Subfigures

In general, figures are inserted into the document using the #cmd("figure") function from #Typst. However, #Typst currently does not provide mechanisms for handling subfigures (numbering and referencing). To address this limitation, the template includes a #cmd("subfigure") function that manages subfigures appropriately. This function wraps the #cmd("subpar.grid") function from the `subpar` package.

#codesnippet[
	```typ
	#subfigure(
		figure(image("image1.png"), caption: []),
		figure(image("image2.png"), caption: []), <b>,
		columns: (1fr, 1fr),
		caption: [Figure title],
		label: <fig:subfig>,
	)
	```
]

#info-alert[The example above shows a figure composed of two subfigures. The first subfigure has a caption, while the second has a #dtype("label") but no title. The second subfigure can be referenced in the text using the command #text(`@b`, fill: typst-color.darken(15%)).]

== Equations

To highlight an important equation, use the #cmd("boxeq") function.

#codesnippet[
	```typ
	$
		#boxeq[$p(A|B) prop p(B|A) space p(A)$]
	$
	```
]

// To create an equation without numbering, use the #cmd("nonumeq") function.
// #codesnippet[
// 	```typ
// 	#nonumeq[$integral_0^1 f(x) dif x = F(1) - F(0)$]
// 	```
// ]

To create an equation without numbering,`bookly` also provides the #dtype("label") `<nonum-eq>` to create unnumbered equations. To use it, simply add the label `<nonum-eq>` after the equation.
#codesnippet[
```typ
$
	integral_0^1 f(x) dif x = F(1) - F(0)
$ <nonum-eq>
```
]

== Information boxes

The template provides several types of boxes to highlight different kinds of content:

- #cmd("info-box") for remarks;
- #cmd("tip-box") for tips;
- #cmd("warning-box") for warnings;
- #cmd("important-box") for important information;
- #cmd("proof-box") for proofs;
- #cmd("question-box") for questions.
- #cmd("code-box") for code snippets.

#codesnippet[
	#show math.equation: set text(font: "Lete Sans Math")
	```typ
	#info-box[#lorem(10)]
	#tip-box[#lorem(10)]
	#warning-box[#lorem(10)]
	#important-box[#lorem(10)]
	#proof-box[#lorem(10)]
	#question-box[#lorem(10)]
	#code-box[#lorem(10)]
	```
]

#info-alert[The appearance of the boxes depends on the selected theme (see the "Themes gallery" section).]

The information boxes described above are built using the #cmd("custom-box") function, which allows you to create custom boxes. This generic function takes the following parameters:

#pagebreak()
#command("custom-box",
..args(
	title: none,
	icon: "info",
	color: rgb(29, 144, 208),
	[body],
)
)[
	#argument("title", default: none, types: "string")[Name of the box.]

	#argument("icon", default: "info", types: "string")[Name of the icon to display in the box.

	Available icons are:
	- #box-title(image("../src/resources/images/icons/alert.svg", width: 1em), [: `"alert"`])
	- #box-title(image("../src/resources/images/icons/info.svg", width: 1em), [: `"info"`])
	- #box-title(image("../src/resources/images/icons/question.svg", width: 1em), [: `"question"`])
	- #box-title(image("../src/resources/images/icons/report.svg", width: 1em), [: `"report"`])
	- #box-title(image("../src/resources/images/icons/stop.svg", width: 1em), [: `"stop"`])
	- #box-title(image("../src/resources/images/icons/tip.svg", width: 1em), [: `"tip"`])
	- #box-title(image("../src/resources/images/icons/code.svg", width: 1em), [: `"code"`])
	]

	#argument("color", default: rgb(29, 144, 208), types: "color")[Box color.]
]

== Title pages

The template provides two functions to create title pages: one for a book and one for a thesis :

#command("book-title-page",
..args(
	subtitle: "Book subtitle",
  edition: "First edition",
  institution: "Institution",
  series: "Discipline",
  year: "2024",
  cover: none,
  logo: none,
	version-usage: none,
	show-cover-author: true,
	[body]
)
)[
	#argument("subtitle", default: "Book subtitle", types: "string")[Subtitle of the book.]

	#colbreak()
	#argument("edition", default: "First edition", types: "string")[Edition of the book.]

	#argument("institution", default: "Institution", types: "string")[Name of the institution.]

	#argument("series", default: "Discipline", types: "string")[Name of the series.]

	#argument("year", default: "2024", types: "string")[Year of publication.]

	#argument("cover", default: none, types: "image")[Cover image of the book.]

	#argument("logo", default: none, types: "image")[Logo of the book.
		#codesnippet[
		```typ
		#show: book.with(
			title-page: book-title-page(
				logo: image("path_to_logo/logo.png"),
				cover: image("path_to_image/book-cover.jpg")
			)
		)
		```
	]]

	#argument("version-usage", default: none, types: ("string", content))[Description of the version usage of the book. It can include the version number, the date or any licensing information. It is displayed in the footer of the title page.
	]

	#argument("show-cover-author", default: true, types: "bool")[
		If `true`, the author name is displayed on the cover page.
	]
]

#command("thesis-title-page",
..args(
	type: "phd",
  school: "School name",
  doctoral-school: "Name of the doctoral school",
  supervisor: ("Supervisor name",),
  cosupervisor: none,
  laboratory: "Laboratory name",
  defense-date: "01 January 1970",
  discipline: "Discipline",
  specialty: "Speciality",
  committee: (:),
  logo: none,
	[body]
)
)[
	#argument("type", default: "phd", types: "string")[
		Type of thesis. Two values are possible:
		- `"phd"` for a doctoral thesis
		- `"hablitation"` for a French habilitation
	]

	#argument("school", default: "School name", types: "string")[Name of the institution where the thesis was prepared.]

	#argument("doctoral-school", default: "Name of the doctoral school", types: "string")[Name of the doctoral school.]

	#argument("supervisor", default: ("Supervisor name",), types: "array")[Name of the thesis supervisor(s) or the guarantor of the habilitation.]

	#argument("cosupervisor", default: none, types: "array")[Name of the thesis co-supervisor(s).]

	#argument("laboratory", default: "Laboratory name", types: "string")[Name of the research laboratory.]

	#argument("defense-date", default: "01 January 1970", types: "string")[Date of the thesis defense.]

	#argument("discipline", default: "Discipline", types: "string")[Name of the discipline.]

	#argument("specialty", default: "Speciality", types: "string")[Name of the specialty.]

	#argument("committee", default: (:), types: "array")[

		Name of the thesis committee members. Each element of the array is a #dtype(dictionary) with the following keys:
		- `name`: Name of the committee member.
		- `position`: Position of the committee member (e.g., "Associate Professor", "Professor", etc.).
		- `affiliation`: Affiliation of the committee member (e.g., "University Name").
		- `role`: Role of the committee member (e.g., "Chair", "Member", "Reviewer").

	]

	#argument("logo", default: none, types: "image")[Logo of the institution.]
]

#codesnippet(
```typ
#let committee = (
	(
		name: "Hari Seldon",
		position: "Full Professor",
		affiliation: "Streeling university",
		role: "President",
	),
	(
		name: "Gal Dornick",
		position: "Associate Professor",
		affiliation: "Synnax University",
		role: "Reviewer"
	),
)
```
)

#pagebreak()
#codesnippet(
```typ
#show: book.with(
	title-page: thesis-title-page(
		supervisor: ("Supervisor A", "Supervisor B"),
		cosupervisor: ("Co-supervisor A", "Co-supervisor B"),
		committee: committee
	)
)
```
)

#info-alert[For both title pages, the title of the document and its author are automatically generated based on the information given when initializing the template.]

== Back cover

A back cover of the document is automatically generated using the #cmd("back-cover") function, which displays information about the thesis (title and author), as well as a summary.

#command("back-cover", ..args(
	resume: none,
	abstract: none,
	abstracts: (),
	logo: none
))[
	#argument("abstracts", types: "dictionary")[Title and summary of the document.
		#codesnippet[
			```typ
			#let abstracts-en-fr-de = (
				(
					title: [#set text(lang: "en", region: "gb"); Abstract:],
					text: [#set text(lang: "en", region: "gb")
						This paper presents the objectives, methodology, and main results of the work.
					]
				),
				(
					title: [#set text(lang: "fr"); Résumé :],
					text: [#set text(lang: "fr")
						Cet article présente les objectifs, la méthodologie et les principaux résultats du travail.
					]
				),
			```]

			#colbreak()
			#codesnippet[
				```typ
				(
					title: [#set text(lang: "de"); Zusammenfassung],
					text: [#set text(lang: "de")
						Diese Arbeit beschreibt die Ziele, die Methodik und die wichtigsten Ergebnisse.
					]
				)
			)

			#back-cover(abstracts: abstracts-en-fr-de, logo: box[logo])
			```
		]
	]

	#argument("logo", types: array)[Logo of the back cover.
		#codesnippet[
			```typ
			#let logos = (
				align(left)[#image("images/devise_cnam.svg", width: 45%)],
				align(right)[#image("images/logo_cnam.png", width: 50%)]
			)

			#back-cover(resume: lorem(10), abstract: lorem(10), logo: logos)
			```
		]
	]
]

#pagebreak()
== Tufte layout <ss:tufte>

When the `tufte` layout is selected, several customizations are applied to adapt the appearance of various elements (figures, tables, equations, etc.) to the Tufte style.

#command("note", ..args(
	"..note-args",
	[body]
	)
)[
	#argument("..note-args",  types: "arguments")[Arguments of the #cmd("note") function provided by the `marginalia` package.

	#info-alert[`bookly` introduces some customization of the `marginalia` #cmd("note") as follows:

	#codesnippet[
			```typ
			#let note = note.with(
				counter: ...,
				numbering: ...,
				keep-order: true
			)
 			```
 		]
	]
	]
]

#command("notefigure", ..args(
	"..notefigure-args",
	[body]
))[
	#argument("..notefigure-args", types: "arguments")[Arguments of the #cmd("notefigure") function provided by the `marginalia` package.

	#info-alert[`bookly` introduces a slight customization of the `marginalia` #cmd("notefigure") as follows:
		#codesnippet[
				```typ
				#let notefigure = notefigure.with(keep-order: true)
				```
		]
	]
	]
]

#command("notecite", ..args(
	"key",
	dy: -1.5em,
	alignment: "baseline",
	supplement: none,
))[
	#argument("key", types: "label")[Key of the reference to cite.]

	#argument("dy", default: -1.5em, types: "length")[Vertical adjustment of the notecite position.]

	#colbreak()
	#argument("alignment", default: "baseline", types: "string")[Alignment of the notecite. Possible values are:
	- `"top"`: Align the top of the notecite with the reference.
	- `"caption-top"`: Align the top of the notecite with the main text baseline.
	- `"bottom"`: Align the bottom of the notecite with the reference.
	- `"baseline"` (default): Align the baseline of the notecite with the main text baseline.
	]

	#argument("supplement", default: none, types: "string")[Supplementary text to add before the citation (e.g., "see", "e.g.", etc.).]
]

#command("wideblock", ..args(
	"side",
	[body]
))[
	#argument("side", types: (auto, str))[
		Side of the wide block. Possible values are:
		- `auto`: Same as `"outer"`
		- `"outer"`: The wide block is displayed on the outer side of the page.
		- `"inner"`: The wide block is displayed on the inner side of the page.
		- `"left"`: The wide block is displayed on the left side of the page.
		- `"right"`: The wide block is displayed on the right side of the page
	]
]

#info-alert[To define a full-width figure in the `tufte` layout, you can use the `wideblock` function with the `side` argument set to `auto` or `outer`. For example:

	#codesnippet[
		```typ
		#wideblock[
			#figure(image("path_to_image/figure.png"), caption: [Full width figure])
		]
		```
	]
]

== Miscellaneous

`bookly` provides several other helper functions to facilitate the writing of a book or a thesis and the creation of custom templates.

#command("reset-counters", ..args())[
	#argument(none)[Reset the counters for equations, figures, tables, sidenotes, and footnotes.
	]
]

#pagebreak()
#command("row-img", ..args(
	"logo",
))[
	#argument("logo", types: "array")[
		Array of images to display in a row.
		#codesnippet[
			```typ
			#row-img(
				image("path_to_image/logo1.png", width: 20%),
				image("path_to_image/logo2.png", width: 20%),
				image("path_to_image/logo3.png", width: 20%)
			)
			```
		]
	]
]

#command("noindent", ..args())[
	#argument(none)[Disables the indentation of a given paragraph.
		#codesnippet[
			```typ
			#noindent This paragraph will not be indented.
			```
		]
	]
]

#command("partial-outline", ..args())[
	#argument(none)[
		Displays a partial outline of the document, showing only the current chapters and sections between the current part and the next one. This function is useful for creating a mini table of contents for a specific part of the document (see `obook` theme).
	]
]

= Theming

The theming system is designed to be flexible and customizable, allowing users to define their own themes.

== Custom theme definition

To implement a custom theme, you have to define a function that includes the `show` and `set` rules defining the style of the document (headings, footnotes, references, #sym.dots). Basically, a theme should be structured as follows:
#codesnippet[
```typ
// my-theme.typ
#import "@preview/bookly:4.1.3": *

#let my-theme(colors: default-colors, it) = {
	// Update the theme state
	states.theme.update("custom")

	// Heading Level 1 style
	show heading.where(level: 1): it => {
		// Page break before each part
		if not states.open-right.get() {pagebreak(weak: true)}
		...
	}

  // Heading Level 2 style
	show heading.where(level: 2): it => {...}

	// Heading Level 3 style
	show heading.where(level: 3): it => {...

	// Outline entry style
	show outline.entry: it => {...}

	// Other show and set rules
	...

	it
}

// Custom part function
#let my-part(title) = {...}

// Custom minitoc function
#let my-minitoc = {...}

// Custom box style
#let my-box(title: none, icon: "info", color: rgb(29, 144, 208), body) = {...}

// Template dictionary
#let custom-theme = (theme: my-theme, part: my-part, minitoc: my-minitoc, box: my-box)
```
]

#info-alert[Examples of theming are available in the #link("https://github.com/maucejo/bookly")[Github repository] of the template.]

Then, you can initialize the template with your custom theme as follows:
#codesnippet[
	```typ
	#import "path_to_file/my-theme.typ": custom-theme

	#show: bookly.with(
		theme: custom-theme,
		...
	)
	```
]

#info-alert[If you use a multiple files structure with a #sym.ast\.typ file for each chapter, you can type at the top of each file the following code to access the functions like #cmd("part") or #cmd("minitoc") defined in the theme file.

	#codesnippet[
		```typ
		#import "path_to_file/my-theme.typ": *
		```
	]
]

== Template states

`bookly` provides some states that can be useful when designing a custom theme. The states are used to store information about the current state of the document. They are collected in a #dtype(dictionary). The following states are available:

#v(1em)
- `states.alt-margins` -- #dtype(bool): Indicates whether the margins are alternated for odd and even pages when `tufte` layout is enabled.

- `states.author` -- #dtype(str): Author of the document.

- `states.colors` -- #dtype(dictionary): Color scheme for the document.

- `states.counter-part` -- #dtype(str): Counter for parts.

- `states.in-outline` -- #dtype(bool): Indicates whether the current section is in the outline.

- `states.isappendix` -- #dtype(bool): Indicates whether the current section is an appendix.

- `states.isfrontmatter` -- #dtype(bool): Indicates whether the current section is front matter.

- `states.localization` -- #dtype(dictionary): Dictionary of terms used in the document (e.g., "chapter", etc.) in the selected language.

#info-alert[To use a language that is not supported by default, you can modify the `states.localization` dictionary when initializing the template. For instance, to add support for Dutch, you can do the following `#states.localization.update(json("path_to_file/dutch.json"))`. For the english version, the JSON  file is as follows:
```json
{
    "and": " and ",
    "appendix": "Appendix",
    "authored": "authored by",
    "chapter": "Chapter",
    "committee": "Defense committee",
    "cosupervisor": "Co-supervisor:",
    "cosupervisors": "Co-supervisors:",
    "defended": "defended on",
    "discipline": "Discipline:",
    "doctoral-school": "DOCTORAL SCHOOL",
    "habilitation": "French Habilitation to supervise research",
    "lof": "List of figures",
    "lot": "List of tables",
    "minitoc": "Content",
    "note": "Note",
    "part": "Part",
    "phd": "Doctoral thesis",
    "proof": "Proof",
    "specialty": "Specialty:",
    "sponsor": "Sponsor:",
    "sponsors": "Sponsors:",
    "supervisor": "Supervisor:",
    "supervisors": "Supervisors:",
    "tip": "Tip",
    "toc": "Table of contents",
    "version-usage": "This version can be viewed and downloaded free of charge for personal use only. It must not be redistributed, sold, or used in derivative works.",
    "warning": "Warning"
}
```
]

- `states.num-heading` -- #dtype(str): Numbering pattern for headings.

- `states.num-pattern` -- #dtype(str): Numbering pattern for sections.

- `states.num-pattern-eq` -- #dtype(str): Numbering pattern for equations.

- `states.num-pattern-fig` -- #dtype(str): Numbering pattern for figures.

- `states.num-pattern-subfig` -- #dtype(str): Numbering pattern for subfigures.

- `states.open-right` -- #dtype(bool): Indicates whether parts and chapters start on a right-hand page.

- `states.page-numbering` -- #dtype(str): Numbering pattern for pages.

- `states.paper-size` -- #dtype(str): Size of the paper.

- `states.par-indent` -- #dtype(bool): Indentation of paragraphs.

- `states.part-numbering` -- #dtype(str): Numbering pattern for parts.

- `states.sidenotecounter` -- #dtype(int): Counter for sidenotes.

- `states.theme` -- #dtype(dictionary): Current theme of the document.

- `states.title` -- #dtype(str): Title of the document.

- `states.tufte` -- #dtype(bool): Indicates whether the current layout is Tufte style.

= Dependencies

The `bookly` template relies on several #Typst packages to provide additional functionalities:
#v(0.5em)
- `marginalia:0.3.1`: for tufte layout.
- `hydra:0.6.3` : for bibliography management.
- `equate:0.3.3` : for advanced equation numbering.
- `showybox:2.0.4` : for custom boxes.
- `suboutline:0.3.0` : for mini tables of contents in chapters.
- `subpar:0.2.2` : for subfigures.