#import "../../src/bookly.typ": *
#import "../docutils.typ": *
#import "@preview/mantys:1.0.2": typst
#import "@preview/dtree:0.1.1": dtree

= Book content

This chapter provides a comprehensive overview of the book content, including the structure, elements, and features that can be utilized to create a well-organized and visually appealing book. It covers various aspects such as chapters, sections, figures, tables, and other content elements that contribute to the overall presentation of the book.

#minitoc

#pagebreak()

== File organization

When writing a long document, such as a thesis manuscript, it is preferable to adopt a multi-file organization to avoid having one very long main file. This is especially important during proofreading/correction, as well as in a collaborative writing context. I generally use the following structure:

#context[
  #dtree(
  stroke: 0.75pt + states.colors.get().primary,
  icons: ("typ": typst),
  icon-rules: (
    ("main.typ", (icon: "typ", fill: states.colors.get().primary)),
    ("*.typ", (icon: "typ")),
   ),
```
main.typ
 appendices/
  app1.typ
 bibliography/
  biblio.bib
 chapters/
  chapter1.typ
 images/
  logo.png
 preamble/
  summary.typ
```)
]

Based on the structure defined in the previous section, the main `main.typ` file could look like this:
#code-box[
```typ
// main.typ
#import "@preview/bookly:5.0.0": *

#show: bookly.with(...)

#show: front-matter

#include "preamble/summary.typ"

#show: main-matter

#tableofcontents
#listoffigures
#listoftables

#part[User guide]

#include "chapters/chapter-main.typ"

#bibliography("bibliography/biblio.bib")

#show: appendix

#part[Appendices]
#include "appendices/appendix-main.typ"

#back-cover(...)
```
]

The main file presents the general structure of the document. You can note that the document contains:
- Front matter #cmd-("front-matter"), main matter #cmd-("main-matter"), and appendix #cmd-("appendix") environments.

- A table of contents #cmd-("tableofcontents"), a list of figures #cmd-("listoffigures"), and a list of tables #cmd-("listoftables").

- Parts #cmd-("part").

- Chapters and appendices imported from other files using the #cmd-("include") command.

- A bibliography inserted with the #cmd("bibliography") command.

- A back cover #cmd-("back-cover") containing the summary and abstract of the document.

== Environments

The template provides three environments to structure the thesis content:

1. *front-matter*: environment for preliminary content (cover page, abstract, acknowledgments, etc.). Pages are numbered with Roman numerals and chapters are not numbered. To activate this environment, insert the following command in the main `typ` file at the desired location:
	#code-box[
		```typ
		#show: front-matter
		```
	]

2. *main-matter*: environment for the main content (introduction, tables of contents, chapters, conclusion, bibliography, etc.). Pages and chapters are numbered with Arabic numerals. To activate this environment, insert the following command in the main `typ` file at the desired location:
	#code-box[
	```typ
	#show: main-matter
	```
]

3. *appendix*: environment for the appendices. Pages are numbered with Roman numerals and chapters are numbered with letters. To activate this environment, insert the following command in the main `typ` file at the desired location:
	#code-box[
		```typ
		#show: appendix
		```
	]

== Parts and chapters

To structure the book content, you can define parts using the #cmd("part") function. To insert a new part, use the following command:

#pagebreak()
#code-box[
	```typ
	#part("Part title")
	```
]

Chapters can also be defined using the standard Typst markup language. This template defines a function #cmd("chapter") that helps you to avoid boilerplate code, such as the manual inclusion of standard elements like title, abstract, and minitoc.

#command("chapter",
  (
    title: "",
    abstract: none,
    toc: true,
    numbered: true,
    label: none,
  )
)

#argument("title", type: [#mtype("string") | #mtype("content")])[Chapter title.]

#argument("abstract", default: "none", type: [#mtype("string") | #mtype("content")])[Summary displayed below the chapter title.]

#argument("toc", default: "true", type: mtype("boolean"))[Indicates whether a mini table of contents should be displayed at the beginning of the chapter.]

#argument("numbered", default: "true", type: mtype("boolean"))[Indicates whether the chapter should be numbered.]

#argument("label", default: "none", type: mtype("label"))[Label for the chapter.]

#code-box[
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

#pagebreak()
#info-box[If you use a #sym.ast\.typ file for each chapter, you can type at the top of the file the following code.

	#code-box[
		```typ
		#show: chapter.with("First chapter", abstract: lorem(20), toc: true, label: <ch:1>)

		// Content of the chapter
		== First section
		```
	]
]

For unnumbered chapters, you can simply use the #cmd("chapter-nonum") function. This function assumes that you have a #sym.ast\.typ file per chapter.
#code-box[
	```typ
	#show: chapter-nonum

	// Content of the chapter
	= Chapter title
	```
]

`bookly` also provides the #mtype("label") `<nonum-sec>` to create unnumbered sections. To use it, simply add the label `<nonum-sec>` after the title of the considered section.
#code-box[
```typ
== Section title <nonum-sec>
```
]
#warning-box[The `<nonum-sec>` label only works for sections and not for chapters. When applied to chapters, it breaks the global numbering of the document. For unnumbered chapters, use the #cmd-("chapter-nonum") function. instead]

== Tables of contents

The template defines several commands to facilitate the creation of tables of contents:
- #cmd-("tableofcontents") : Table of contents
- #cmd-("listoffigures") : List of figures
- #cmd-("listoftables") : List of tables

A mini table of contents is automatically generated by using the command #cmd-("minitoc") in a chapter. This function is a wraper of the #cmd-("suboutline") function provided by the `suboutline` package.