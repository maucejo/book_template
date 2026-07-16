#import "../../src/bookly.typ": *

= Sample chapter -- Tufte layout

#lorem(100)

#minitoc
#pagebreak()

== Goals

#lorem(100)#note(lorem(10))

Equations @eq:1-tufte et @eq:2-tufte are very important.
$
integral_0^1 f(x) dif x = F(1) - F(0) "et voilà"
$ <eq:1-tufte>

$
integral_0^1 f(x) dif x = F(1) - F(0) "et voilà"
$ <eq:2-tufte>

#lorem(20)
== Code

Figure @fig:1-tufte is a beautiful typst logo.

#notefigure(
  image("../manual-images/typst-logo.svg"),
  caption: [#ls-caption([#lorem(10)], [#lorem(2)])],
  alignment: "baseline",
  dy: 4em,
)<fig:1-tufte>

#lorem(50)

Figure @fig:subfig-tufte shows the Typst logo. Figure @b-tufte is a Typst logo.
#subfigure(
figure(image("../manual-images/typst-logo.svg"), caption: []),
figure(image("../manual-images/typst-logo.svg"), caption: []), <b-tufte>,
columns: (1fr, 1fr),
caption: [(a) Left image and (b) Right image],
label: <fig:subfig-tufte>,
)

#lorem(50)
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

#lorem(50) #notecite(<Smi21>)