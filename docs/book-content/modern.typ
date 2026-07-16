#import "../../src/bookly.typ": *

= Sample chapter -- Modern theme

#lorem(100)

#minitoc

#pagebreak()

== Goals
#lorem(100)

Equations @eq:1-modern and @eq:2-modern are very important.
$
integral_0^1 f(x) dif x = F(1) - F(0) "et voilà"
$ <eq:1-modern>

$
integral_0^1 f(x) dif x = F(1) - F(0) "et voilà"
$ <eq:2-modern>

$
  #boxeq($bold(y)_(k + 1) = bold(C) space.thin bold(x)_(k + 1)$)
$

#lorem(20)

== Code

Figure @fig:1-modern is a beautiful typst logo.

#figure(
image("../manual-images/typst-logo.svg", width: 75%),
caption: lorem(10),
) <fig:1-modern>

Figure @fig:subfig-modern the Typst logo. Figure @b-modern is a Typst logo.

#subfigure(
figure(image("../manual-images/typst-logo.svg"), caption: []),
figure(image("../manual-images/typst-logo.svg"), caption: []), <b-modern>,
columns: (1fr, 1fr),
caption: [(a) Left image and (b) Right image],
label: <fig:subfig-modern>,
)

#figure(
  table(
    columns: 3,
    table.header(
      [Substance],
      [Subcritical °C],
      [Supercritical °C],
    ),
    [Hydrochloric Acid],
    [12.0], [92.1],
    [Sodium Myreth Sulfate],
    [16.6], [104],
    [Potassium Hydroxide],
    table.cell(colspan: 2)[24.7],
  ), caption: [#lorem(4)]
)

== Boxes

#lorem(10)

=== Informations

#info-box[
  #lorem(10)
]

#tip-box[
  #lorem(10)
]

#warning-box[
  #lorem(10)
]

#important-box[
  #lorem(10)
]

#proof-box[
  #lorem(10)
]

#question-box[
  #lorem(10)
]

#code-box[
  #lorem(10)
]

#lorem(10)#footnote("This is a footnote")