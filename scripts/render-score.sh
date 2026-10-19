#!/usr/bin/env bash
# Render LilyPond score → PDF, PNG preview, MIDI, loudnorm MP3
# Convention: scores/<slug>/<slug>.ly  (+ all artifacts in that folder)
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SCORES="$ROOT/scores"
SF="${SOUNDFONT:-$HOME/.local/share/soundfonts/MuseScore_General.sf3}"

usage() {
  echo "Usage: $0 <slug> | scores/<slug>/<slug>.ly" >&2
  echo "  Creates/uses project folder scores/<slug>/" >&2
  exit 1
}

[[ $# -ge 1 ]] || usage

ARG="$1"

if [[ "$ARG" == *.ly ]]; then
  LY="$(cd "$(dirname "$ARG")" && pwd)/$(basename "$ARG")"
  DIR="$(dirname "$LY")"
  BASE="$(basename "$LY" .ly)"
  # If .ly sits flat under scores/, move into scores/<slug>/
  if [[ "$(dirname "$DIR")" == "$ROOT" && "$(basename "$DIR")" == "scores" ]]; then
    DEST="$SCORES/$BASE"
    mkdir -p "$DEST"
    if [[ "$LY" != "$DEST/$BASE.ly" ]]; then
      mv "$LY" "$DEST/$BASE.ly"
      # move sibling artifacts with same basename if present
      for ext in midi mid pdf mp3 wav; do
        [[ -f "$DIR/$BASE.$ext" ]] && mv "$DIR/$BASE.$ext" "$DEST/"
      done
      for f in "$DIR/$BASE-preview"*.png "$DIR/preview.png" "$DIR/preview-page"*.png; do
        [[ -e "$f" ]] && mv "$f" "$DEST/"
      done 2>/dev/null || true
      LY="$DEST/$BASE.ly"
      DIR="$DEST"
    fi
  fi
else
  # slug only
  BASE="$(echo "$ARG" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g')"
  DIR="$SCORES/$BASE"
  mkdir -p "$DIR"
  LY="$DIR/$BASE.ly"
  if [[ ! -f "$LY" ]]; then
    echo "Missing score: $LY" >&2
    exit 1
  fi
fi

if [[ ! -f "$SF" ]]; then
  echo "Soundfont missing: $SF" >&2
  exit 1
fi

cd "$DIR"

lilypond "$BASE.ly"
lilypond --png -dresolution=110 -o preview "$BASE.ly"
fluidsynth -ni -F "${BASE}.wav" -r 44100 -g 0.9 "$SF" "${BASE}.midi"
ffmpeg -y -i "${BASE}.wav" \
  -af loudnorm=I=-16:TP=-1.5:LRA=11 -ar 44100 \
  -codec:a libmp3lame -q:a 2 "${BASE}.mp3"
rm -f "${BASE}.wav" preview.midi

echo "OK: $DIR/"
echo "  $BASE.ly  $BASE.pdf  $BASE.midi  $BASE.mp3  preview*.png"
