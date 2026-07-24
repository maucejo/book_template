#import "../../src/bookly.typ": *
#import "../docutils.typ": *

= Theming

This chapter provides an overview of the theming capabilities in `bookly`. The theming system is designed to be flexible and customizable, allowing users to define their own themes.

#minitoc

#pagebreak()

== Custom theme definition

To implement a custom theme, you have to define a function that includes the `show` and `set` rules defining the style of the document (headings, footnotes, references, #sym.dots). Basically, a theme should be structured as follows:
#code-box[
```typ
// my-theme.typ
#import "@preview/bookly:4.1.4": *

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

#info-box[Examples of theming are available in the #link("https://github.com/maucejo/bookly")[Github repository] of the template.]

Then, you can initialize the template with your custom theme as follows:
#code-box[
	```typ
	#import "path_to_file/my-theme.typ": custom-theme

	#show: bookly.with(
		theme: custom-theme,
		...
	)
	```
]

If you want to reuse and combine elements of the existing themes, you can simply use it in the definition of your custom theme #mtype("dictionary").

#code-box[```typ
#let custom = (theme: pretty-theme, part: obook-part, minitoc: modern-minitoc, box: orly-custom-box, boxeq: pretty-boxeq)
```]

#info-box[The naming convention for the theming elements is as follows: `theme-name-part`, `theme-name-minitoc`, `theme-name-box`, `theme-name-boxeq`. For example, the part function of the `obook` theme is called `obook-part`.]

== Template states

`bookly` provides some states that can be useful when designing a custom theme. The states are used to store information about the current state of the document. They are collected in a #mtype("dictionary"). The following states are available:

#v(1em)
- `states.alt-margins` -- #mtype("bool"): Indicates whether the margins are alternated for odd and even pages when `tufte` layout is enabled.

- `states.author` -- #mtype("string"): Author of the document.

- `states.colors` -- #mtype("dictionary"): Color scheme for the document.

- `states.counter-part` -- #mtype("string"): Counter for parts.

- `states.in-outline` -- #mtype("bool"): Indicates whether the current section is in the outline.

- `states.isappendix` -- #mtype("bool"): Indicates whether the current section is an appendix.

- `states.isfrontmatter` -- #mtype("bool"): Indicates whether the current section is front matter.

- `states.localization` -- #mtype("dictionary"): Dictionary of terms used in the document (e.g., "chapter", etc.) in the selected language.

#pagebreak()
#info-box[To use a language that is not supported by default, you can modify the `states.localization` dictionary when initializing the template. For instance, to add support for Dutch, you can do the following `#states.localization.update(json("path_to_file/dutch.json"))`. For the english version, the JSON  file is as follows:
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

- `states.num-heading` -- #mtype("string"): Numbering pattern for headings.

- `states.num-pattern` -- #mtype("string"): Numbering pattern for sections.

- `states.num-pattern-eq` -- #mtype("string"): Numbering pattern for equations.

- `states.num-pattern-fig` -- #mtype("string"): Numbering pattern for figures.

- `states.num-pattern-subfig` -- #mtype("string"): Numbering pattern for subfigures.

- `states.open-right` -- #mtype("bool"): Indicates whether parts and chapters start on a right-hand page.

- `states.page-numbering` -- #mtype("string"): Numbering pattern for pages.

- `states.paper-size` -- #mtype("string"): Size of the paper.

- `states.par-indent` -- #mtype("bool"): Indentation of paragraphs.

- `states.part-numbering` -- #mtype("string"): Numbering pattern for parts.

- `states.sidenotecounter` -- #mtype("int"): Counter for sidenotes.

- `states.theme` -- #mtype("dictionary"): Current theme of the document.

- `states.title` -- #mtype("string"): Title of the document.

- `states.tufte` -- #mtype("bool"): Indicates whether the current layout is Tufte style.