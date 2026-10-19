// Horn and Reed Fugue — Score → Sound → Bigband
#set document(
  title: "Horn and Reed Fugue — Score → Sound",
  author: "NilsP",
  keywords: ("Horn and Reed Fugue", "Fugue", "LilyPond", "Suno"),
)

#let ink = rgb("#EDE6DC")
#let muted = rgb("#8E8790")
#let slate = rgb("#1C181F")
#let deep = rgb("#0B090C")
#let rule = rgb("#2E2832")
#let silver = rgb("#9AA8B5")
#let reed = rgb("#C4A06A")
#let paper = rgb("#110E14")

#let suno-album = "https://suno.com/album/08977bc9-f3ff-48ae-a48f-556f2e62fabf"
#let suno-profile = "https://suno.com/@cwzjtpwwwy"

#set page(
  width: 210mm,
  height: 280mm,
  margin: (x: 18mm, y: 18mm),
  fill: paper,
  numbering: none,
  footer: context {
    if counter(page).get().first() > 1 {
      set text(
        font: ("Helvetica Neue", "Helvetica", "Arial"),
        size: 8pt,
        fill: muted,
        tracking: 1pt,
      )
      align(center)[Horn and Reed Fugue · NilsP · #counter(page).display("1")]
    }
  },
)

#set text(font: ("Didot", "Baskerville", "Georgia", "Times New Roman"), size: 11pt, fill: ink, lang: "de")
#set par(leading: 0.85em, justify: true)
#show heading.where(level: 1): it => {
  set text(size: 22pt, fill: ink, weight: "regular", tracking: 0.5pt)
  block(above: 0pt, below: 14pt)[#it.body]
}
#show heading.where(level: 2): it => {
  set text(font: ("Helvetica Neue", "Helvetica", "Arial"), size: 9pt, fill: silver, weight: "regular", tracking: 2.2pt)
  block(above: 18pt, below: 8pt)[#upper(it.body)]
}
#show link: it => text(fill: reed, it)

#let sans(body) = text(font: ("Helvetica Neue", "Helvetica", "Arial"), size: 9pt, fill: muted, tracking: 0.4pt, body)

#let floor-rule(accent: silver) = {
  block(below: 12pt)[
    #stack(dir: ttb, spacing: 3.5pt,
      line(length: 100%, stroke: 0.35pt + rule),
      line(length: 36mm, stroke: 1.6pt + accent),
    )
  ]
}

#let meta-row(label, value) = {
  grid(columns: (34mm, 1fr), gutter: 6mm, align: (left, horizon),
    sans[#upper(label)], text(size: 10.5pt)[#value])
}

#let wave-card(title, subtitle, path, accent) = {
  block(width: 100%, inset: (x: 10pt, y: 12pt), fill: slate, stroke: 0.4pt + rule)[
    #grid(columns: (1fr, auto), text(size: 12pt)[#title], sans[#subtitle])
    #v(8pt)
    #line(length: 100%, stroke: 0.3pt + accent.lighten(15%))
    #v(8pt)
    #image(path, width: 100%)
  ]
}

#let stage(n, title, body) = {
  block(below: 14pt)[
    #grid(columns: (14mm, 1fr), gutter: 4mm,
      align(top)[#text(size: 20pt, fill: silver)[#n]],
      [#text(size: 13pt)[#title] #v(4pt) #text(size: 10pt, fill: muted)[#body]])
  ]
}

// COVER
#page(numbering: none, footer: none)[
  #place(top + left, dx: -18mm, dy: -18mm)[#rect(width: 210mm, height: 280mm, fill: deep)]
  #place(left, dx: 14mm, dy: 40mm)[
    #for i in range(5) {
      place(dy: i * 28mm)[
        #rect(width: 2mm, height: 20mm, fill: if i < 2 { silver.darken(30%) } else if i < 4 { rgb("#A89B88").darken(20%) } else { reed.darken(15%) })
      ]
    }
  ]
  #v(48mm)
  #align(center)[
    #sans[SCORE  ·  SOUND  ·  BIGBAND]
    #v(10mm)
    #text(size: 34pt, tracking: 0.5pt)[Horn and Reed Fugue]
    #v(6mm)
    #text(size: 13pt, fill: muted)[Vom Fugenthema zum Bigband-Arrangement]
    #v(14mm)
    #line(length: 42mm, stroke: 0.6pt + reed)
    #v(14mm)
    #sans[EIN ALBUM-DOKUMENT]
    #v(3mm)
    #text(size: 11pt)[NilsP]
  ]
  #place(bottom + center, dy: -22mm)[
    #sans[2026  ·  LILYPOND  ·  SUNO V6]
    #v(3mm)
    #sans[HÖRVERSION · index.html]
  ]
]

= Stimmen folgen

#floor-rule()

Was entsteht, wenn ein Fugenthema zuerst symbolisch gesetzt wird — erkennbar, klar, nicht virtuos — und danach durch generative Transformation in ein Bigband-Arrangement wandert?

_Horn and Reed Fugue_ beginnt als D-Moll-Fuge für Solo-Klavier in LilyPond. Über eine Suno-Zwischenstufe wird daraus das Album-Finale: denselben kontrapunktischen Impuls, neu artikuliert.

#v(8pt)
#meta-row("Titel", [Horn and Reed Fugue])
#v(3pt)
#meta-row("Score", [Fugue in D Minor · Solo-Klavier])
#v(3pt)
#meta-row("Systemautor", [NilsP])
#v(3pt)
#meta-row("Score-Engine", [LilyPond 2.26 · Cursor])
#v(3pt)
#meta-row("Sound", [Suno V6])
#v(3pt)
#meta-row("Album", link(suno-album)[suno.com/album/…08977bc9])
#v(3pt)
#meta-row("Profil", link(suno-profile)[suno.com/\@cwzjtpwwwy])

== Der Impuls

Bachscher Fugengeist, ohne Stilkorsett der Virtuosität: Motiv gut erkennbar, mittlere Dichte, künstlerische Freiheit in Form und Fortspinnung.

#block(width: 100%, inset: 12pt, fill: slate, stroke: (left: 2pt + silver))[
  #set text(font: ("Helvetica Neue", "Helvetica", "Arial"), size: 8.4pt, fill: ink.darken(5%))
  #set par(leading: 0.7em)
  Komponiere ein Pianosolo im Stil einer Bach Fuge.\
  Das Fugenmotiv soll gut erkennbar sein — nicht zu virtuos, aber auch nicht zu schlicht.\
  Ansonsten jede künstlerische Freiheit.
]

#v(6pt)
#sans[Mensch = Systemautor: Verfahren setzen · hören · auswählen · veröffentlichen.]

#pagebreak()
= Eintritt 1 — Score

#floor-rule()

Drei Stimmen am Klavier. Thema in D-Moll: Quinte aufwärts, absteigende Wendung, Dominantschluss. Beantwortung, Zwischenspiel, Durchführung in G-Moll, Schlussdurchführung, Coda mit Dur-Schluss.

#v(4pt)
#grid(columns: (1fr, 1fr), gutter: 8mm,
  [#meta-row("Werk", [Fugue in D Minor])
   #v(2pt)
   #meta-row("Besetzung", [Solo-Klavier])
   #v(2pt)
   #meta-row("Tonart", [d-Moll])
   #v(2pt)
   #meta-row("Tempo", [Moderato ♩=76])],
  [#meta-row("Umfang", [29 Takte · ca. 1:35])
   #v(2pt)
   #meta-row("Komponist", [AI draft (test)])
   #v(2pt)
   #meta-row("Engine", [LilyPond 2.26])
   #v(2pt)
   #meta-row("Form", [Fugenexposition + Durchführung])])

#v(8pt)
#sans[Vollständiger Notensatz auf der folgenden Seite.]

#pagebreak()
#align(center)[
  #block(fill: rgb("#F4F0E8"), inset: 6pt, stroke: 0.4pt + rule)[
    #image("assets/score-preview.png", width: 88%)
  ]
]
#v(6pt)
#align(center)[#sans[Notensatz · LilyPond · Fugue in D Minor]]

#pagebreak()
= Eintritt 2 — Schnittstelle

#floor-rule()

LilyPond schreibt MIDI; FluidSynth und Soundfont erzeugen schlichtes Klavier-Audio; ffmpeg normalisiert. Die Stufe trägt Motiv und Stimmführung — nicht die Aura des Finales.

#v(6pt)
#stage("01", [LilyPond], [Partitur → PDF + MIDI. Thema und Kontrapunkt lesbar.])
#stage("02", [FluidSynth], [MIDI → WAV · MuseScore General. Nur Schnittstelle.])
#stage("03", [ffmpeg], [WAV → MP3 · Loudnorm −16 LUFS. Suno-tauglich.])

#v(6pt)
#wave-card([Ausgangs-MP3], [ca. 1:35 · LilyPond-Render], "assets/wave-01.png", silver)
#v(8pt)
#sans[Diese Hörstufe ist bewusst nüchtern: Symbol wird hörbar, Kunstwerk entsteht später.]

#pagebreak()
= Eintritt 3 — Zwischenstufe

#floor-rule(accent: rgb("#A89B88"))

Das Ausgangs-MP3 geht nach Suno. Daraus entsteht eine Zwischenfassung — noch nah am Klavier/Fugenimpuls, schon generativ geatmet.

#v(8pt)
#wave-card([fugue2 — Suno Zwischenstufe], [ca. 1:16 · Suno V6], "assets/wave-02.png", rgb("#A89B88"))

#v(12pt)
== Was sich ändert

#grid(columns: (1fr, 1fr), gutter: 8mm,
  [#text(size: 12pt)[Bleibt]
   #v(4pt)
   #sans[Erkennbares Thema · kontrapunktische Erinnerung · d-Moll-Farbe · ruhiger Moderato-Atem]],
  [#text(size: 12pt, fill: reed)[Wandelt sich]
   #v(4pt)
   #sans[Klangfarbe · zeitliche Proportion · Gestik · performative Dichte]])

#v(14pt)
#block(width: 100%, inset: 12pt, fill: slate)[
  #sans[SCORE bleibt Struktur. SOUND prüft, was die Struktur tragen kann — bevor das Bigband-Arrangement greift.]
]

#pagebreak()
= Eintritt 4 — Kaskade

#floor-rule(accent: reed)

Vom Score über die Zwischenstufe zur Auswahl: welche Transformation das Fugenthema als Bigband-Arrangement tragen darf.

#v(10pt)
#let bar(label, sub, fill, w) = {
  block(below: 6pt)[
    #rect(width: w, height: 11mm, fill: fill, inset: (x: 10pt, y: 0pt))[
      #align(horizon)[#text(size: 10pt, fill: ink)[#label] #h(1fr) #sans[#sub]]
    ]
  ]
}
#bar([Score · LilyPond-Fuge], [symbolisch], rgb("#2A2430"), 100%)
#bar([Render · Klavier-MP3], [Schnittstelle], rgb("#342E38"), 90%)
#bar([Suno · fugue2], [Zwischenstufe], rgb("#4A4038"), 80%)
#bar([Horn and Reed Fugue], [Album-Final], rgb("#5C4A2E"), 70%)

#v(12pt)
#text(size: 12pt)[Prinzip]
#v(4pt)
Jede Stufe erbt Erinnerung an die vorige. Der Mensch entscheidet nicht die Noten der ersten Seite neu, sondern welche Stimme weiterleben darf.

#pagebreak()
= Eintritt 5 — Finale

#floor-rule(accent: reed)

Finale Form: *Horn and Reed Fugue*. Weit vom schlichten LilyPond-Render — und doch vom gleichen Fugenthema getragen.

#v(8pt)
#wave-card([Horn and Reed Fugue — Final], [ca. 3:10 · Album-Track], "assets/wave-03.png", reed)

#v(12pt)
#grid(columns: (1fr, 1fr), gutter: 8mm,
  [#meta-row("Credits", [NilsP])
   #v(3pt)
   #meta-row("Profil", link(suno-profile)[\@cwzjtpwwwy])],
  [#meta-row("Album", link(suno-album)[Auf Suno öffnen])
   #v(3pt)
   #meta-row("Pfad", [Score → Sound → Bigband])])

#v(14pt)
== Drei Hörstufen

#table(
  columns: (32mm, 1fr, 22mm),
  stroke: none,
  inset: (x: 0pt, y: 6pt),
  align: (left, left, right),
  [#sans[STUFE]], [#sans[ROLLE]], [#sans[DAUER]],
  table.hline(stroke: 0.4pt + rule),
  [Render], [Schnittstelle · Klavier-Fuge], [1:35],
  table.hline(stroke: 0.3pt + rule),
  [fugue2], [Suno-Zwischenstufe], [1:16],
  table.hline(stroke: 0.3pt + rule),
  [#text(fill: reed)[Final]], [#text(fill: reed)[Horn and Reed Fugue]], [#text(fill: reed)[3:10]],
)

#pagebreak()
= Impressum der Stimmen

#floor-rule(accent: reed)

Dieses Dokument hält den Workflow fest — nicht jede verworfene Version. Der Wert liegt in der Kette: erkennbares Thema, gültiger Score, hörbare Schnittstelle, generative Transformation, menschliche Auswahl.

#v(10pt)
#meta-row("Werk", [Horn and Reed Fugue])
#v(3pt)
#meta-row("Score-Titel", [Fugue in D Minor])
#v(3pt)
#meta-row("Systemautor", [NilsP])
#v(3pt)
#meta-row("Score-Engine", [LilyPond 2.26 · FluidSynth · ffmpeg])
#v(3pt)
#meta-row("Sound-Engine", [Suno V6])
#v(3pt)
#meta-row("Profil", link(suno-profile)[suno.com/\@cwzjtpwwwy])
#v(3pt)
#meta-row("Album", link(suno-album)[suno.com/album/08977bc9-…])

#v(16mm)
#align(center)[
  #line(length: 36mm, stroke: 0.5pt + reed)
  #v(8mm)
  #text(size: 16pt)[Horn and Reed Fugue]
  #v(4mm)
  #sans[NILSP  ·  2026]
  #v(10mm)
  #sans[DAS THEMA BLEIBT. DIE STIMMEN WANDELN SICH.]
]
