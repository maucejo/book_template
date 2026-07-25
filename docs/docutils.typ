#import "@preview/showybox:2.0.4": *
#import "@preview/zebraw:0.7.0": *
#import "@preview/codly-languages:0.1.10": *

#let default-type-color = rgb("#eff0f3")
#let function-name-color = rgb("#4b69c6")
#let rainbow-map = ((rgb("#7cd5ff"), 0%), (rgb("#a6fbca"), 33%),(rgb("#fff37c"), 66%), (rgb("#ffa49d"), 100%))
#let gradient-for-color-types = gradient.linear(angle: 7deg, ..rainbow-map)
#let gradient-for-tiling = gradient.linear(angle: -45deg, rgb("#ffd2ec"), rgb("#c6feff")).sharp(2).repeat(5)

#let colors = (
  "default": default-type-color,
  "default-param": rgb("b50256"),
  "content": rgb("#a6ebe6"),
  "string": rgb("#d1ffe2"),
  "str": rgb("#d1ffe2"),
  "label": rgb("#a7eaff"),
  "none": rgb("#ffcbc4"),
  "auto": rgb("#ffcbc4"),
  "bool": rgb("#ffedc1"),
  "boolean": rgb("#ffedc1"),
  "integer": rgb("#e7d9ff"),
  "int": rgb("#e7d9ff"),
  "float": rgb("#e7d9ff"),
  "ratio": rgb("#e7d9ff"),
  "length": rgb("#e7d9ff"),
  "angle": rgb("#e7d9ff"),
  "relative length": rgb("#e7d9ff"),
  "relative": rgb("#e7d9ff"),
  "fraction": rgb("#e7d9ff"),
  "symbol": default-type-color,
  "array": default-type-color,
  "dictionary": default-type-color,
  "dict": default-type-color,
  "arguments": default-type-color,
  "args": rgb("#4428c1"),
  "selector": default-type-color,
  "module": default-type-color,
  "stroke": default-type-color,
  "function": rgb("#f9dfff"),
  "image": rgb("#f9dfff"),
  "color": gradient-for-color-types,
  "gradient": gradient-for-color-types,
  "tiling": gradient-for-tiling,
  "signature-func-name": rgb("#4b69c6"),
)

#let mtype(type) = box(fill: colors.at(type), radius: 0.25em, inset: 0.25em, text(size: 0.8em, type))

#let typst-color = rgb(35, 157, 173)

#let render-box = showybox.with(
  title: align(center)[#text(fill: black)[*Rendering*]],
  title-style:(
    sep-thickness: 0pt,
  ),
  frame: (
    title-color: typst-color.lighten(75%),
    border-color: typst-color,
    body-color: typst-color.lighten(95%),
    thickness: (left: 2pt, rest: 0.5pt),
    radius: 2.55pt
  ),
  align: center,
  breakable: true
)

#let cmd(body) = [#text(size: 0.9em, fill: function-name-color)[\#*#body*()]]

#let cmd-(body) = [#text(size: 0.9em, fill: function-name-color)[\#*#body*]]

#let example-box(left, right, ncol: 2, lang: true, numbering: false, lang-color: teal, vspace: 0em, ..args) = grid(
  columns: (1fr,)*ncol,
  column-gutter: 1em,
  align: horizon,
  ..args,
  [
    #zebraw(numbering: numbering, left)
  ],
  [#v(vspace) #render-box[#right]],
)

#let example(code, ncol: 2, lang: true, numbering: false, lang-color: teal, vspace: 0em, ..args) = grid(
  columns: (1fr,)*ncol,
  column-gutter: 1em,
  align: horizon,
  ..args,
  [
    #zebraw(numbering: numbering, code)
  ],
  [
    #set par(first-line-indent: 0pt)
    #v(vspace)
    #render-box[#eval(code.text, mode: "markup")]
  ],
)

#let argument(name, default: none, type: none, body) = context {
  block(
    width: 100%,
    stroke: 0.5pt + colors.default.darken(25%),
    radius: 2pt,
    inset: (top: 6pt, rest: 7pt),
    above: 1.5em,
    [
      #let def = if default != none {[: ]} else {none}
      #place(top+left, dy: -15.5pt, dx: 5.75pt, box(inset: 5pt, fill:white, text(size: 1em, "Argument")))
      #v(5pt)
      #grid(
      columns: (1fr, 1fr),
      column-gutter: 1em,
      align: (left, right),
      [
        #set text(size: 0.85em)
        #set smartquote(enabled: false)
        #text(fill: colors.args)[#sym.chevron.l#name#sym.chevron.r]#def#text(fill: colors.default-param, default)
      ],
      [#type]
    )
    #body
    ]
  )
}

#let command(name, args, body: true) = [
  #cmd-(name)\(
  #set text(size: 0.85em)
  #let rendered(value) = {
    let rendered-value = repr(value)
    if rendered-value.starts-with("[") and rendered-value.ends-with("]") {
      rendered-value.slice(1, -1)
    } else {
      rendered-value
    }
  }
  #let n = args.len() - 1
  #if (n != 0) [#linebreak()] else [#h(-1.1em)]
  #for (i, (key, value)) in args.pairs().enumerate() [
    #set smartquote(enabled: false)
    #if value == "" [
      #h(1em) #text(fill: colors.args)[*#sym.chevron.l#key#sym.chevron.r*#if (i < n) [#text(fill: black)[*,*]]]
    ] else [
      #h(1em) #text(fill: colors.args)[*#sym.chevron.l#key#sym.chevron.r: *]
      #text(fill: colors.default-param)[*#rendered(value)*#if (i < n) [#text(fill: black)[*,*]]]
    ]
    #if (i < n) [#linebreak()]
  ]
  )#if body [[body]]
]

#let argument-(body) = block(
    width: 100%,
    stroke: 0.5pt + colors.default.darken(25%),
    radius: 2pt,
    inset: (top: 6pt, rest: 7pt),
    above: 1.5em,
    [
      #place(top+left, dy: -15.5pt, dx: 5.75pt, box(inset: 5pt, fill:white, text(size: 1em, "Argument")))
      #v(0.5em)
      #body
    ]
  )