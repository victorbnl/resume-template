#import "blocks/sidebar.typ": sidebar
#import "blocks/body.typ": body

#let resume(data, theme, img: none) = {
  set document(title: "Curriculum Vitae")

  set page(margin: 0pt)

  set par(leading: .5em)
  set text(font: "LiterationSans Nerd Font", size: 10pt, lang: "fr", fallback: false)

  set list(marker: (
    text("•", size: 1.4em, baseline: .2em, top-edge: "bounds"),
    text("–", size: 0.8em, baseline: .4em, top-edge: "bounds"),
  ))

  show heading: it => block(
    width: 100%,

    inset: (top: 2pt, bottom: 4pt),

    above: 16pt,
    below: 10pt,

    stroke: (bottom: .5pt + luma(50%, 30%)),

    upper(text(it.body, size: .9em, weight: "black")),
  )

  grid(
    columns: (30%, auto),

    sidebar(data, theme, img),
    body(data, theme),
  )
}
