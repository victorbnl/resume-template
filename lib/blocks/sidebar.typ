#import "../content/content.typ"

#let sidebar-block(fill: none, content) = block(
  width: 100%,
  inset: (x: 9%, y: 15pt),
  fill: fill,
  content
)

#let header(data, theme, img) = sidebar-block(
  fill: theme.sidebar.header.background,

  {
    let content = {
      set par(spacing: 0.6em)
      show heading: it => text(size: 0.8em, weight: "bold", it.body)
      content.header(data)
    }

    if img != none {
      grid(
        columns: (20%, 1fr),
        align: horizon,
        gutter: 12pt,

        block(clip: true, radius: 100%, img),

        content,
      )
    } else {
      content
    }
  }
)

#let contacts(data, theme) = sidebar-block(
  fill: theme.sidebar.contacts.background,

  list(
    indent: 0pt,
    body-indent: 0pt,
    marker: "",
    spacing: .8em,

    ..data.contacts.map(x => {
      let line = x.icon + "   " + x.text
      if x.keys().contains("link") {
        link(x.link, line)
      } else {
        line
      }
    }),
  )
)

#let infos(data) = sidebar-block(content.sidebar(data))

#let sidebar(data, theme, img) = block(
  height: 100%,

  fill: theme.sidebar.background,

  {
    set text(fill: theme.sidebar.foreground)
    set list(indent: 4pt, body-indent: .6em)

    stack(
      header(data, theme, img),
      contacts(data, theme),
      infos(data)
    )
  },
)
