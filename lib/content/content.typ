#import "../content/components.typ": *

#let header(data) = [
  = #data.profile.name

  #data.profile.label
]

#let sidebar(data) = [
  == Qualités

  #skills(data.soft_skills)

  == Compétences

  #skills(data.skills)

  == Langues

  #list(..data.misc.languages)

  == Centres d'intérêt

  #list(..data.misc.interests)
]

#let body(data) = [
  == Profil

  #data.profile.summary

  == Études

  #experience-list(data.studies)

  == Expériences

  #experience-list(data.experiences)

  == Autres activités

  #experience-list(data.activities)

  == Programmation

  #experience-list(data.projects)
]
