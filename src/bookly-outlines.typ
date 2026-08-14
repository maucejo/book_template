#import "bookly-deps.typ": *
#import "bookly-helper.typ": *

#let toc-wideblock(side: "both", it) = {
  let inner-extend = margin-notes-config.inner.width + margin-notes-config.inner.sep
  let outer-extend = margin-notes-config.outer.width + margin-notes-config.outer.sep

  let pad-left = if side in ("both", "left") { -inner-extend } else { 0pt }
  let pad-right = if side in ("both", "right") { -outer-extend } else { 0pt }
  pad(left: pad-left, right: pad-right, it)
}

#let outline-entry(it) = {
  set par(first-line-indent: 0em) if states.par-indent.get()

  if states.tufte.get() {
    toc-wideblock(side: "both")[#it]
  } else {
    it
  }
}

// Table of contents
#let tableofcontents = context {
  show outline.entry: outline-entry

  outline(title: states.localization.get().toc, indent: 1em)
}

// List of figures
#let listoffigures = context {
  show metadata.where(label: <bookly-title>): it => it.value.short
  show outline.entry: outline-entry

  outline(title: states.localization.get().lof, target: figure.where(kind: image))
}

// List of tables
#let listoftables = context {
  show metadata.where(label: <bookly-title>): it => it.value.short
  show outline.entry: outline-entry

  outline(title: states.localization.get().lot, target: figure.where(kind: table))
}