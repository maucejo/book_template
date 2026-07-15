#import "../../src/bookly.typ": *

= Sample chapter -- Classic theme

#lorem(100)

#minitoc

#pagebreak()

== Goals
#lorem(100)

Equations @eq:1-classic and @eq:2-classic are very important.
$
integral_0^1 f(x) dif x = F(1) - F(0) "et voilà"
$ <eq:1-classic>

$
integral_0^1 f(x) dif x = F(1) - F(0) "et voilà"
$ <eq:2-classic>

#lorem(20)

== Code

Figure @fig:1-classic is a beautiful typst logo.

#figure(
image("../manual-images/typst-logo.svg", width: 75%),
caption: lorem(10),
) <fig:1-classic>

Figure @fig:subfig-classic the Typst logo. Figure @b-classic is a Typst logo.

#subfigure(
figure(image("../manual-images/typst-logo.svg"), caption: []),
figure(image("../manual-images/typst-logo.svg"), caption: []), <b-classic>,
columns: (1fr, 1fr),
caption: [(a) Left image and (b) Right image],
label: <fig:subfig-classic>,
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