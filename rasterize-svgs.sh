#!/bin/sh

# this script converts each SVG files to PNG with optimized size

# Dependencies:
# https://github.com/sharkdp/fd
# https://github.com/RazrFalcon/resvg
# https://github.com/shssoichiro/oxipng

# gitignored
OUT_DIR='_out'

for SVG in $(fd --extension svg); do
  DIR="$OUT_DIR/$(dirname "$SVG")"
  PNG="$DIR/$(basename "$SVG" .svg).png"
  if test ! -f "$PNG"; then
    mkdir -p "$DIR"
    resvg "$SVG" "$PNG"
    oxipng --opt 4 --interlace 1 --strip safe "$PNG"
  fi
done
