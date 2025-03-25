#import "../content/content.typ"

#let body(data, theme) = block(inset: 16pt, {
  set list(indent: 8pt, body-indent: .8em)
  content.body(data)
})
