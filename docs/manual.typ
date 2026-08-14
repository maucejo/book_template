#import "../src/bookly.typ": *
#import "reset-theme.typ": *

#show: bookly.with(
  author: "Mathieu AUCEJO",
  title: "Bookly",
  fonts: (
    body: "Lato",
    math: "Lete Sans Math",
    raw: "Cascadia Code"
  ),
  lang: "en",
  title-page: book-title-page(
    subtitle: "User's guide",
    edition: "Version 5.0.0",
    series: " Typst book series",
    institution: "Typst community",
    logo: image("manual-images/typst-logo.svg"),
    cover: image("manual-images/bookly-logo.png", width: 45%),
  ),
  config-options: (
    open-right: false,
    par-indent: false,
  )
)

#show: front-matter

#include "book-content/foreword.typ"

#show: main-matter

#tableofcontents
#listoffigures
#listoftables

#part[User's manual]

#include "book-content/general-usage.typ"
#include "book-content/book-content.typ"
#include "book-content/helper.typ"
#include "book-content/theming.typ"

#show: appendix
#part[Themes in action!]

// #[
// #context[
// #states.tufte.update(true)
// #set figure.caption(position: top) if states.tufte.get()
// #show: show-if(states.tufte.get(), it => {
//   show figure.caption.where(position: top): note.with(
//     alignment: "top",
//     counter: none,
//     shift: "avoid",
//     keep-order: true,
//   )
//   it
// })

// #let m-config = (
//   inner: (far: 1.25cm, width: 0cm, sep: 0cm),
//   outer: (far: 1.25cm, width: 5cm, sep: 0.5cm),
//   book: false
//   )

// #show: marginalia.setup.with(..m-config)
// #include "book-content/tufte.typ"
// #set page(margin: auto)
// #states.tufte.update(false)
// ]
// ]

#include "book-content/fancy.typ"

#context[
  #show: reset-theme.with()
  #states.theme.update(classic)
  #show: classic.theme
  #include "book-content/classic.typ"

  #show: reset-theme.with()
  #states.theme.update(modern)
  #show: modern.theme
  #include "book-content/modern.typ"

  #show: reset-theme.with()
  #states.theme.update(orly)
  #show: orly.theme
  #include "book-content/orly.typ"

  #show: reset-theme.with()
  #states.theme.update(obook)
  #show: obook.theme
  #include "book-content/obook.typ"

  #show: reset-theme.with()
  #states.theme.update(pretty)
  #show: pretty.theme
  #include "book-content/pretty.typ"

  #bibliography("book-content/sample.bib")
]