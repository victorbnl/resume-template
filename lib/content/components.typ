#let skills(lst) = list(spacing: 8pt, ..lst.map(x => {
  text(x.title, weight: "bold")
  list(..x.values)
}))

#let github(repo) = link(
  "https://github.com/" + repo,
  "\u{f09b} " + repo
)

#let experience(exp) = {
  let ctxline = ("date", "place", "github")
    .map(key => {
      if exp.keys().contains("github") and key == "github" {
        github(exp.at(key))
      } else {
        exp.at(key, default: none)
      }
    })
    .filter(x => x != none)
    .join("  •  ")

  (
    text(exp.title, weight: "bold"),
    text(fill: luma(50%), ctxline),
    exp.at("desc", default: none),
    list(tight: true, ..exp.points.map(x => eval(x, mode: "markup"))),
  )
    .filter(x => x != none)
    .join("\n")
}

#let experience-list(lst) = list(spacing: 12pt, ..lst.map(experience))
