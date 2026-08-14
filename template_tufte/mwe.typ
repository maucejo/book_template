#import "../src/bookly.typ": *

#show: bookly.with(
  tufte: true,
  // config-options: (
  //   open-right: false,
  //   alt-margins: false,
  // )
)

#tableofcontents

#listoffigures

#listoftables

= Chapitre test

Du texte avec une note#note[Ceci est une note].

#figure(rect(), caption: [Une légende])

#notecite(<Smi21>)

#bibliography("bibliography/sample.bib")