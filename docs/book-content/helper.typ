#import "../../src/bookly.typ": *
#import "../docutils.typ": *

= Helper functions

This chapter provides an overview of the helper functions available in the `bookly` template. These functions are designed to simplify common tasks and enhance the functionality of your book.

#minitoc

#pagebreak()

== Figure captions

The package include the command #cmd("ls-caption") to manage long and short captions for figures and tables. Short caption are displayed in the list of figures or tables, while long captions are used in the main text and in the table of contents.

#v(1em)
#example-box[
```typ
#figure(
  rect(),
  caption: ls-caption("Long caption", "Short caption")
)

See the list of figures for the short caption.
```
][
#figure(
  rect(),
  caption: ls-caption("Long caption", "Short caption")
)

See the list of figures for the short caption.
]

#info-box[The code of the command #cmd("ls-caption") comes from the #link("https://sitandr.github.io/typst-examples-book/book/snippets/chapters/outlines.html?highlight=long#long-and-short-captions-for-the-outline", "Typst book") by Sitandr.]

== Subfigures

In general, figures are inserted into the document using the #cmd-("figure") function from Typst. However, Typst currently does not provide mechanisms for handling subfigures (numbering and referencing). To address this limitation, the template includes a #cmd-("subfigure") function that manages subfigures appropriately. This function wraps the #cmd-("subpar.grid") function from the `subpar` package.

#v(1em)
#example-box[
```typ
#subfigure(
  figure(rect(), caption:[],
  figure(rect(), caption:[]), <b>,
  columns: (1fr, 1fr),
  caption: [Figure title],
  label: <fig:subfig>,
)

Figure @fig:subfig shows an example of subfigures. Figure @b shows the second subfigure.
```
][
#subfigure(
		figure(rect(), caption:[]),
		figure(rect(), caption:[]), <b>,
		columns: 2,
		caption: [Figure title],
		label: <fig:subfig>,
	)
Figure @fig:subfig shows an example of subfigures. Figure @b shows the second subfigure.
]

== Equations

To highlight an important equation, use the #cmd("boxeq") function.

#v(0.5em)
#example-box[
```typ
$
#boxeq[$p(A|B) prop p(B|A) space p(A)$]
$
```
][
$
  #boxeq[$p(A|B) prop p(B|A) space p(A)$]
$
]

To create an equation without numbering,`bookly` also provides the #mtype("label") `<nonum-eq>` to create unnumbered equations. To use it, simply add the label `<nonum-eq>` after the equation.

#v(1.5em)
#example(vspace: -0.5em,
```typ
$
integral_0^1 f(x) dif x = F(1) - F(0)
$ <nonum-eq>
```
)

== Callout boxes

The template provides several types of boxes to highlight different kinds of content:

- #cmd-("info-box"): Used to provide general information or useful advice.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#info-box[This is an information box.]
```
][
#info-box[
This is an information box.
]
]

- #cmd-("tip-box"): Used to provide tips or recommendations.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#tip-box[This is a tip box.]
```
][
#tip-box[
This is a tip box.
]
]

#v(1em)
- #cmd-("warning-box"): Used to warn the reader about a potential danger or important information.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#warning-box[This is a warning box.]
```
][
#warning-box[
This is a warning box.
]
]

#v(1em)
- #cmd-("important-box"): Used to emphasize crucial information or key points.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#important-box[This is an important box.]
```
][
#important-box[
This is an important box.
]
]

#v(1em)
- #cmd-("proof-box"): Used to present proofs or mathematical demonstrations.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#proof-box[This is a proof box.]
```
][
#proof-box[
This is a proof box.
]
]

#v(1em)
- #cmd-("question-box"): Used to ask questions or propose problems to solve.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#question-box[This is a question box.]
```][
#question-box[
This is a question box.
]
]

- #cmd-("code-box"): Used to present source code or code snippets.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#code-box[This is a code box.]
```
][
#code-box[
This is a code box.
]
]

The information boxes described above are built using the #cmd("custom-box") function, which allows you to create custom boxes. This generic function takes the following parameters:

#command("custom-box",
  (
    title: none,
    icon: "info",
    color: rgb(29, 144, 208),
  )
)

#argument("title", default: none, type: [#mtype("string") | #mtype("content")])[Name of the box.]

#argument("icon", default: "info", type: mtype("string"))[Name of the icon to display in the box.

Available icons are:
- #box-title(image("../../src/resources/images/icons/alert.svg", width: 1em), [: `"alert"`])
- #box-title(image("../../src/resources/images/icons/info.svg", width: 1em), [: `"info"`])
- #box-title(image("../../src/resources/images/icons/question.svg", width: 1em), [: `"question"`])
- #box-title(image("../../src/resources/images/icons/report.svg", width: 1em), [: `"report"`])
- #box-title(image("../../src/resources/images/icons/stop.svg", width: 1em), [: `"stop"`])
- #box-title(image("../../src/resources/images/icons/tip.svg", width: 1em), [: `"tip"`])
- #box-title(image("../../src/resources/images/icons/code.svg", width: 1em), [: `"code"`])
]

#argument("color", default: [rgb(29, 144, 208)], type: mtype("color"))[Box color.]

== Title pages

The template provides two functions to create title pages: one for a book and one for a thesis :

#command("book-title-page",
  (
    subtitle: "Book subtitle",
    edition: "First edition",
    institution: "Institution",
    series: "Discipline",
    year: "2024",
    cover: none,
    logo: none,
    version-usage: none,
    show-cover-author: true,
  )
)

#argument("subtitle", default: "Book subtitle", type: [#mtype("string") | #mtype("content")])[Subtitle of the book.]

#argument("edition", default: "First edition", type: [#mtype("string") | #mtype("content")])[Edition of the book.]

#argument("institution", default: "Institution", type: [#mtype("string") | #mtype("content")])[Name of the institution.]

#argument("series", default: "Discipline", type: [#mtype("string") | #mtype("content")])[Name of the series.]

#pagebreak()
#argument("year", default: "2024", type: [#mtype("string") | #mtype("content")])[Year of publication.]

#argument("cover", default: "none", type: [#mtype("image") | #mtype("content")])[Cover image of the book.]

#argument("logo", default: "none", type: mtype("image"))[Logo of the book.
  #code-box[
  ```typ
  #show: book.with(
    title-page: book-title-page(
      logo: image("path_to_logo/logo.png"),
      cover: image("path_to_image/book-cover.jpg")
    )
  )
  ```
]]

#argument("version-usage", default: "none", type: [#mtype("string") | #mtype("content")])[Description of the version usage of the book. It can include the version number, the date or any licensing information. It is displayed in the footer of the title page.
]

#argument("show-cover-author", default: "true", type: mtype("bool"))[
  If `true`, the author name is displayed on the cover page.
]

#command("thesis-title-page",
  (
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
  )
)

#pagebreak()
#argument("type", default: "phd", type: mtype("string"))[
		Type of thesis. Two values are possible:
		- `"phd"` for a doctoral thesis
		- `"hablitation"` for a French habilitation
	]

#argument("school", default: "School name", type: [#mtype("string") | #mtype("content")])[Name of the institution where the thesis was prepared.]

#argument("doctoral-school", default: "Name of the doctoral school", type: [#mtype("string") | #mtype("content")])[Name of the doctoral school.]

#argument("supervisor", default: [("Supervisor name",)], type: mtype("array"))[Name of the thesis supervisor(s) or the guarantor of the habilitation.]

#argument("cosupervisor", default: "none", type: mtype("array"))[Name of the thesis co-supervisor(s).]

#argument("laboratory", default: "Laboratory name", type: [#mtype("string") | #mtype("content")])[Name of the research laboratory.]

#argument("defense-date", default: "01 January 1970", type: [#mtype("string") | #mtype("content")])[Date of the thesis defense.]

#argument("discipline", default: "Discipline", type: [#mtype("string") | #mtype("content")])[Name of the discipline.]

  #argument("specialty", default: "Speciality", type: mtype("string"))[Name of the specialty.]

#pagebreak()
#argument("committee", default: "(:)", type: mtype("array"))[

  Name of the thesis committee members. Each element of the array is a #mtype("dictionary") with the following keys:
  - `name`: Name of the committee member.
  - `position`: Position of the committee member (e.g., "Associate Professor", "Professor", etc.).
  - `affiliation`: Affiliation of the committee member (e.g., "University Name").
  - `role`: Role of the committee member (e.g., "Chair", "Member", "Reviewer").

  #code-box(
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

    #show: book.with(
    title-page: thesis-title-page(
      supervisor: ("Supervisor A", "Supervisor B"),
      cosupervisor: ("Co-supervisor A", "Co-supervisor B"),
      committee: committee
    )
    )
    ```
  )

#info-box[
  #set text(size: 0.85em)
  For both title pages, the title of the document and its author are automatically generated based on the information given when initializing the template.]
]

#argument("logo", default: "none", type: mtype("image"))[Logo of the institution.]

== Back cover

A back cover of the document is automatically generated using the #cmd("back-cover") function, which displays information about the thesis (title and author), as well as a summary.

#command("back-cover",
  (
    resume: none,
    abstract: none,
    abstracts: (),
    logo: none,
), body: false)

#argument("abstracts", type: mtype("dictionary"))[Title and summary of the document.
  #code-box[
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

#argument("logo", type: mtype("array"))[Logo of the back cover.
  #code-box[
    ```typ
    #let logos = (
      align(left)[#image("images/devise_cnam.svg", width: 45%)],
      align(right)[#image("images/logo_cnam.png", width: 50%)]
    )

    #back-cover(resume: lorem(10), abstract: lorem(10), logo: logos)
    ```
  ]
]

== Tufte layout <ss:tufte>

When the `tufte` layout is selected, several customizations are applied to adapt the appearance of various elements (figures, tables, equations, etc.) to the Tufte style.

#command("note",
  (
	  "..note-args": "",
	)
)

#argument("..note-args",  type: mtype("arguments"))[Arguments of the #cmd("note") function provided by the `marginalia` package.

  #info-box[`bookly` introduces some customization of the `marginalia` #cmd("note") as follows:

  #code-box[
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

#command("notefigure",
  (
	  "..notefigure-args": "",
	)
)

#argument("..notefigure-args", type: mtype("arguments"))[Arguments of the #cmd("notefigure") function provided by the `marginalia` package.

	#info-box[`bookly` introduces a slight customization of the `marginalia` #cmd("notefigure") as follows:
		#code-box[
				```typ
				#let notefigure = notefigure.with(keep-order: true)
				```
		]
	]
]

#command("notecite",
  (
    key: "",
    dy: -1.5em,
    alignment: "baseline",
    supplement: none,
  )
)

#argument("key", type: mtype("label"))[Key of the reference to cite.]

#argument("dy", default: "-1.5em", type: mtype("length"))[Vertical adjustment of the notecite position.]

#argument("alignment", default: "baseline", type: mtype("string"))[Alignment of the notecite. Possible values are:
	- `"top"`: Align the top of the notecite with the reference.
	- `"caption-top"`: Align the top of the notecite with the main text baseline.
	- `"bottom"`: Align the bottom of the notecite with the reference.
	- `"baseline"` (default): Align the baseline of the notecite with the main text baseline.
]

#argument("supplement", default: none, type: [#mtype("string") | #mtype("content")])[Supplementary text to add before the citation (e.g., "see", "e.g.", etc.).]

#command("wideblock",
  (
    side: "",
  )
)
#argument("side", type: [#mtype("string") | #mtype("content")])[
  Side of the wide block. Possible values are:
  - `auto`: Same as `"outer"`
  - `"outer"`: The wide block is displayed on the outer side of the page.
  - `"inner"`: The wide block is displayed on the inner side of the page.
  - `"left"`: The wide block is displayed on the left side of the page.
  - `"right"`: The wide block is displayed on the right side of the page

  #info-box[To define a full-width figure in the `tufte` layout, you can use the `wideblock` function with the `side` argument set to `auto` or `outer`. For example:

    #code-box[
      ```typ
      #wideblock[
        #figure(image("path_to_image/figure.png"), caption: [Full width figure])
      ]
      ```
    ]
  ]
]

== Miscellaneous

`bookly` provides several other helper functions to facilitate the writing of a book or a thesis and the creation of custom templates.

#pagebreak()
#cmd-("reset-counters")
#argument-[Reset the counters for equations, figures, tables, sidenotes, and footnotes.
]

#command("row-img",
  (
    logo: "",
  )
)

#argument("logo", type: mtype("array"))[
  Array of images to display in a row.
  #code-box[
    ```typ
    #row-img(
      image("path_to_image/logo1.png", width: 20%),
      image("path_to_image/logo2.png", width: 20%),
      image("path_to_image/logo3.png", width: 20%)
    )
    ```
  ]
]

#cmd-("nonindent")

#argument-[
  Disables the indentation of a given paragraph.
  #code-box[
    ```typ
    #noindent This paragraph will not be indented.
    ```
  ]
]

#cmd-("partial-outline")

#argument-[
  Displays a partial outline of the document, showing only the current chapters and sections between the current part and the next one. This function is useful for creating a mini table of contents for a specific part of the document (see `obook` theme).
]