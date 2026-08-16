#import "@preview/bookly:5.0.0": *
// #import "../src/bookly.typ": *

#let config-colors = (
  primary: rgb("#1d90d0"),
  secondary: rgb("#dddddd").darken(15%)
)

#show: bookly.with(
  author: "Author Name",
  fonts: (
    body: "Lato",
    math: "Lete Sans Math"
  ),
  // theme: classic,
  // theme: fancy,
  // theme: modern,
  // theme: orly,
  // theme: pretty,
  tufte: true,
  // lang: "fr",
  // colors: config-colors,
  title-page: book-title-page(
    series: "Typst book series",
    institution: "Typst community",
    logo: image("images/typst-logo.svg"),
    cover: image("images/book-cover.jpg", width: 45%)
  ),
  config-options: (
    open-right: false,
    alt-margins: true,
  )
)

#show: front-matter

#include "front_matter_tufte/front_main_tufte.typ"

#show: main-matter

#tableofcontents

#listoffigures

#listoftables

#part("First part")

#include "chapters_tufte/ch_main_tufte.typ"

#part("Second part")

#show: appendix

#include "appendix_tufte/app_main_tufte.typ"

// // #bibliography("bibliography/sample.yml")
#bibliography("bibliography/sample.bib")

#let abstracts-fr-en = (
  (
    title: [#set text(lang: "fr"); Résumé],
    text: [#lorem(100)]
  ),
  (
    title: [#set text(lang: "en", region: "gb"); Abstract],
    text: [#lorem(100)]
  ),
)

#let logos = (
  align(left)[#image("images/typst-logo.svg", width: 50%)],
  align(right)[#image("images/typst-logo.svg", width: 50%)]
)

#back-cover(abstracts: abstracts-fr-en, logo: logos)