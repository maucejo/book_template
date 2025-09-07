#import "@preview/drafting:0.2.2": *
#import "book-defaults.typ": *
#import "book-helper.typ": *

#let notecounter = counter("notecounter")
#let sidenote(dy: -1.5em, numbered: true, content) = {
  if numbered {
    notecounter.step()
    [ #super(context notecounter.display())]
  }
  text(size: 0.85em, margin-note(
    if numbered {
    [#super(context notecounter.display()) #content]
  } else {
    content
  }, dy: dy)
  )
}

#let notecite(dy:-1.5em,supplement:none,key) = context {
  let elems = query(bibliography)
  if elems.len() > 0 {
    cite(key, supplement:supplement)
    sidenote(
      cite(key,form: "full"),
      dy:dy, numbered:false
    )
  }
}

#let sidefig(content, caption: none, dy: - 1.5em) = sidenote(
 context {
  show figure.caption: it => context [
    #set align(left)
    #let kind = none
    #if it.supplement.text.contains("Fig") {
      kind = image
    } else if it.supplement.text.contains("Tab") {
      kind = table
    }
    #it.supplement #counter(figure.where(kind: kind)).display()#it.separator #it.body
  ]
  set figure.caption(position: bottom)
  figure(
    content,
    caption: caption
  )
  }, dy: dy, numbered: false
)

#let fullfig(content, caption: none) = fullwidth({
  set figure.caption(position: bottom)
  show figure.caption: it => context move(dx: 37.6%)[
    #set text(0.85em)
    #set align(left)
    #let kind = none
    #if it.supplement.text.contains("Fig") {
      kind = image
    } else if it.supplement.text.contains("Tab") {
      kind = table
    }
    #block(width: 4.25cm)[
      #it.supplement #counter(figure.where(kind: kind)).display()#it.separator #it.body
    ]
  ]
  set figure.caption(position: bottom)
  figure(
    content,
    caption: caption,
  )
  }
)