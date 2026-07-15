#import "../src/bookly.typ": *

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
    edition: "Version 4.1.3",
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
