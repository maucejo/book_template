#import "../src/bookly.typ": *

#let reset-theme(colors: default-colors, it) = {
  // Headings
  show heading.where(level: 1): it => {
    if not states.open-right.get() {
      pagebreak(weak: true)
    }

    // Reset counters
    reset-counters

    set align(right)
    set underline(stroke: none)

    show: show-if(states.tufte.get(), it => {
      show: wideblock.with(side: "both")
      it
    })

    if it.numbering != none {
      it
    } else {
      it
    }
  }

  show heading.where(level: 2): it => {
    text(counter(heading).display() + " " + it.body)
  }

  show heading.where(level: 3): it => {
    text(counter(heading).display() + " " + it.body)
  }

  // Lists
  set list(marker: [#text(fill:black, size: 1em)[#sym.bullet]])
  set enum(numbering: n => text(fill:colors.primary)[#n.])

  // Footnotes
  set footnote.entry(separator: none)
  show footnote.entry: it => box(text(fill: black)[#it])

  // References
  show ref: set text(fill: black)

  // Links
  show link: set text(fill: black)

  // Tables
  show table.cell.where(y: 0): set text(weight: "bold", fill: black)
    set table(
    fill: white,
    stroke: 0.5pt + black,
  )

  // Outline
  set outline.entry(fill: box(width: 1fr, repeat(gap: 0.25em)[.]))
  show outline.entry: it => {
    show linebreak: none
    if it.element.func() == heading {
      let number = it.prefix()
      let section = it.element.body
      let item = none
      if it.level == 1 {
        block(above: 1.25em, below: 0em)
        v(0.5em)
        item = [#text([*#number*], fill: colors.primary) *#it.inner()*]
      } else if it.level == 2{
        block(above: 1em, below: 0em)
        item = [#h(1em) #text([#number], fill: colors.primary) #it.inner()]
      } else {
        block(above: 1em, below: 0em)
        item = [#h(2em) #text([#number], fill: colors.primary) #it.inner()]
      }
      link(it.element.location(), item)
    } else if it.element.func() == figure {
      block(above: 1.25em, below: 0em)
      v(0.25em)
      link(it.element.location(), [#text([#it.prefix().], fill: colors.primary) #h(0.2em) #it.inner()])
    } else {
      it
    }
  }

  set page(
    paper: states.paper-size.get(),
    header: none,
    footer: none
  )

  it
}