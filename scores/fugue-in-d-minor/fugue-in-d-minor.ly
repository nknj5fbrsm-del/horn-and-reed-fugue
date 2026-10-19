\version "2.24.0"

\header {
  title = "Fugue in D Minor"
  subtitle = "for solo piano"
  composer = "AI draft (test)"
  tagline = ##f
}

globalKey = {
  \key d \minor
  \time 4/4
}

% ─── Material ───────────────────────────────────────────────

% Subject (D minor, alto register): rising fifth, descending turn, dominant close.
subj = {
  d'4 a'4 f'8( e' d' cis') |
  d'8( e' f' g') a'4 bes'8( a') |
  g'8( f' e' d') cis'( d' e' f') |
  e'8( d' cis' e') a'2 |
}

% Countersubject: thirds/sixths against the subject, invertible at the octave.
csOne = {
  f'2 a'4 f'4~ |
  f'8 g' a'4 c''4 d''4 |
  bes'4 g'4 a'4 g'4 |
  g'4 a'4 cis''2 |
}

subjLow = \transpose c c, \subj

% Episode 1 — circle of fifths: Dm Gm | C7 F | Bb E° | A7 D7
episodeOneSop = {
  f''8 e'' d'' e'' d'' c'' bes' c'' |
  bes'8 a' g' a' a' g' f' g' |
  f'8 e' d' e' g' f' e' f' |
  e'8 d' cis' d' a' g' fis' g' |
}

episodeOneAlt = {
  a'4 f'4 g'4 g'4 |
  e'4 c'4 c'4 a4 |
  bes4 bes4 bes4 g4 |
  a4 a4 d'4 d'4 |
}

episodeOneBass = {
  d2 g,2 |
  c2 f,2 |
  bes,2 e,2 |
  a,2 d,2 |
}

% ─── Voices ─────────────────────────────────────────────────

sop = {
  % 1–4 (alto subject alone)
  s1*4 |
  % 5–8 answer (A minor)
  \transpose d a \subj |
  % 9 codetta back toward D minor
  e''4 b'4 a'4 cis''4 |
  % 10–13 third entry (bass); soprano holds then rests
  d''1 |
  R1*3 |
  % 14–17 episode
  \episodeOneSop |
  % 18–21 subdominant entry (G minor), low register
  R1*4 |
  % 22–23 return to D minor
  c''2 bes'2 |
  d''2 cis''2 |
  % 24–27 final statement: subject in soprano
  \transpose c c' \subj |
  % 28–29 coda
  e''4 cis''4 e''4 cis''4 |
  d''1\fermata |
  \bar "|."
}

alt = {
  % 1–4 subject (D minor)
  \subj |
  % 5–8 countersubject under the answer
  \transpose d a, \csOne |
  % 9 codetta
  gis'4 e'4 cis'4 e'4 |
  % 10–13 countersubject above bass subject
  \csOne |
  % 14–17 episode
  \episodeOneAlt |
  % 18–21 G minor: countersubject down a fifth
  \transpose d g, \csOne |
  % 22–23
  fis'2 g'2 |
  f'2 a'2 |
  % 24–27 final statement
  \csOne |
  % 28–29 coda
  a'4 g'4 a'4 g'4 |
  <fis' a'>1 |
}

bass = {
  R1*8 |
  R1 |
  % 10–13 subject in the bass
  \subjLow |
  % 14–17 episode
  \episodeOneBass |
  % 18–21 G minor entry
  \transpose d g, \subjLow |
  % 22–23
  d2 g,2 |
  bes,2 a,2 |
  % 24–27 final statement: bass + soprano frame the countersubject
  \subjLow |
  % 28–29 coda
  a,2 a,2 |
  <d, d>1 |
}

dynamics = {
  s1\mp | s1*3 |
  s1\mf | s1*3 |
  s1\> |
  s1\mp | s1*3 |
  s1\mf | s1*2 | s1\> |
  s1\p | s1*3 |
  s1\mp\< | s1 |
  s1\f | s1*3 |
  s1\ff | s1\fff |
}

% ─── Score ──────────────────────────────────────────────────

\score {
  \new PianoStaff \with {
    instrumentName = "Piano"
  } <<
    \new Staff = "upper" \with {
      midiInstrument = "acoustic grand"
    } {
      \globalKey
      \tempo "Moderato" 4 = 76
      \clef treble
      <<
        \new Voice = "sop" { \voiceOne \sop }
        \new Voice = "alt" { \voiceTwo \alt }
      >>
    }
    \new Dynamics \dynamics
    \new Staff = "lower" \with {
      midiInstrument = "acoustic grand"
    } {
      \globalKey
      \clef bass
      \bass
    }
  >>
  \layout { }
  \midi { }
}
