#let INDENT_WIDTH = .5em

#let resume(body) = {
  set list(indent: .5em)
  show list: set text(size: 0.92em)
  show link: underline
  show link: set underline(offset: 3pt)

  set page(
    paper: "us-letter",
    margin: (x: 0.5in, y: 0.5in)
  )

  set text(
    size: 10.5pt,
      font: "Cambria",
  )

  body
}

#let name_header(name) = {
  set text(size: 1.8em)
  [*#name*]
}

#let header(
  name: "Jake Ryan",
  phone: "123-456-7890",
  email: "jake@su.edu",
  linkedin: "linkedin.com/in/jake",
  site: "github.com/jake",
) = {
  align(center,
    block[
      #name_header(name) \
      #phone
      #h(0.4em) | #h(0.4em)
      #link("mailto:" + email)[#email]
      #h(0.4em) | #h(0.4em)
      #link("https://" + linkedin)[#linkedin]
      #h(0.4em) | #h(0.4em)
      #link("https://" + site)[#site]
    ]
  )
  v(5pt)
}

#let resume_heading(txt) = {
  show heading: set text(size: 0.92em, weight: "regular")

  block[
    = #smallcaps(txt)
    #v(-4pt)
    #line(length: 100%, stroke: 0.5pt + black)
  ]
}

#let edu_item(
  name: "Sample University",
  degree: "B.S in Bullshit",
  location: "Foo, BA",
  date: "Aug. 1600 - May 1750",
  courses: "Intro to Screaming, Advanced Crying",
  award: "Nothingburger, First Place"
) = {
  set block(above: 0.7em, below: 1em)
  pad(left: INDENT_WIDTH, right: INDENT_WIDTH, box[
    #grid(
      columns: (3fr, 1fr),
      align(left)[
        *#name* \
        _#degree _
      ],
      align(right)[
        #date \
        _#location _
      ]
    )
    #pad(top: -.3em, left: INDENT_WIDTH, [
      #list(
        [*Relevant coursework:* #courses],
        [*Awarded:* #award],
      )
    ])
  ])
}

#let pub_item(
  citation: "Citation of paper",
) = {
  set block(above: 0.7em, below: 1em)
  set text(size: 0.94em)
  pad(left: INDENT_WIDTH, right: INDENT_WIDTH, [
    #set par(hanging-indent: 1.5em)
    #citation
  ])
}


#let exp_item(
  name: "Sample Workplace",
  role: "Worker",
  date: "June 1837 - May 1845",
  location: "Foo, BA",
  ..points
) = {
    set block(above: 0.7em, below: 0.8em)
    pad(left: INDENT_WIDTH, right: INDENT_WIDTH, box[
      #grid(
        columns: (3fr, 1fr),
        align(left)[
          *#role* \
          _#name _
        ],
        align(right)[
          #date \
          _#location _
        ]
      )
      #list(..points)
    ])
}

#let project_item(
  name: "Example Project",
  skills: "Programming Language 1, Database3",
  date: "May 1234 - June 4321",
  ..points
) = {
  set block(above: 0.7em, below: 1em)
  pad(left: INDENT_WIDTH, right: INDENT_WIDTH, box[
    *#name* | _#skills _ #h(1fr) #date
    #list(..points)
  ])
}

#let skill_item(
  category: "Skills",
  skills: "Balling, Yoga, Valorant",
) = {
  set block(above: 0.7em)
  set text(size: 0.91em)
  pad(left: INDENT_WIDTH, right: INDENT_WIDTH, block[*#category*: #skills])
}
