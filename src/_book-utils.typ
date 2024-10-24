#import "@preview/subpar:0.1.1"
#import "@preview/hydra:0.5.1": hydra
#import "_book-params.typ": *

// Equations
#let boxeq(body) = {
  set align(center)
  box(
    stroke: 1pt + colors.gray,
    radius: 5pt,
    inset: 0.5em,
    fill: colors.gray.lighten(60%),
  )[#body]
}

#let nonumeq(x) = {
   set math.equation(numbering: none)
   x
}

// Subfigure
#let subfigure = subpar.grid.with(
  gap: 1em,
  numbering: n => if states.isappendix.get() {numbering("A.1", counter(heading).get().first(), n)
    } else {
      numbering("1.1", counter(heading).get().first() , n)
    },
  numbering-sub-ref: (m, n) => if states.isappendix.get() {numbering("A.1a", counter(heading).get().first(), m, n)
    } else {
      numbering("1.1a", counter(heading).get().first(), m, n)
    },
  supplement: fig-supplement
)

// Long and short captions for figures or tables
#let ls-caption(long, short) = context if states.in-outline.get() { short } else { long }

// Font exists ?
#let checkfont(font) = context {
  let res = true
  let size = measure(text(font: font, fallback: false)[
      Test
  ])

  if size.width == 0pt {
      res = false
  }

  return res
}


// Page header and footer - add empty page if necessary
#let page-header = context {
  let is-start-chapter = query(heading.where(level:1))
    .map(it => it.location().page())
    .contains(here().page())

  if not state("content.switch", false).get() and not is-start-chapter {
    return
  }

  state("content.pages", (0,)).update(it => {
    it.push(page)
    return it
  })

  if not is-start-chapter { // Use of Hydra for the header
    set text(style: "italic", fill: colors.gray)
    if calc.odd(here().page()) {
      align(right, hydra(2, book: true))
    } else {
      align(left, hydra(1))
    }
  }
}

#let page-footer = context {
  let is-start-chapter = query(heading.where(level:1))
    .map(it => it.location().page())
    .contains(here().page())

  let has-content = state("content.pages", (0,)).get()
    .contains(here().page())

  if has-content or is-start-chapter {
    if states.page-numbering.get() == "i" {
      align(center, counter(page).display(states.page-numbering.get()))
    } else {
      let current-page = counter(page).get().first()
      let total-page = counter(page).final().first() - 2
      align(center, [#current-page / #total-page])
    }
  }
}