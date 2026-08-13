#import "bookly-deps.typ": *
#import "bookly-helper.typ": *

// Table of contents
#let tableofcontents = context {
  show outline.entry: it => {
    set par(first-line-indent: 0em) if states.par-indent.get()
    if states.tufte.get() {
      wideblock(side: "both")[#it]
    } else {
      it
    }
  }

  outline(title: states.localization.get().toc, indent: 1em)
}

// List of figures
#let listoffigures = context {
  show metadata.where(label: <bookly-title>): it => it.value.short
  show outline.entry: it => {
    set par(first-line-indent: 0em) if states.par-indent.get()

    if states.tufte.get() {
      wideblock(side: "both")[#it]
    } else {
      it
    }
  }
  outline(title: states.localization.get().lof, target: figure.where(kind: image))
}

// List of tables
#let listoftables = context {
  show metadata.where(label: <bookly-title>): it => it.value.short
  show outline.entry: it => {
    set par(first-line-indent: 0em) if states.par-indent.get()
    if states.tufte.get() {
      wideblock(side: "both")[#it]
    } else {
      it
    }
  }
  outline(title: states.localization.get().lot, target: figure.where(kind: table))
}