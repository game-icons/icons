#!/bin/sh

# this script converts each SVG files in $OUT_ROOT_DIR directory to PNG with optimized size
# it implies that you previously executed ./colorize-svgs.sh at least once before (even for default white on black colors)

# Dependencies:
# https://github.com/sharkdp/fd
# https://github.com/RazrFalcon/resvg
# https://github.com/shssoichiro/oxipng

# final artifacts are created in this gitignored _out directory
OUT_ROOT_DIR='_out'

if test ! -d "$OUT_ROOT_DIR"; then
  echo "directory '$OUT_ROOT_DIR' does not exist"
  echo "run ./colorize-svgs.sh to create it and populate its content with colorized (or default) SVG files"
  exit 1
fi

i=0
for SVG in $(fd . "$OUT_ROOT_DIR" --extension svg); do
  PNG="$(dirname "$SVG")/$(basename "$SVG" .svg).png"
  if test ! -f "$PNG"; then
    i=$((i+1))
    echo "$i $PNG"
    resvg "$SVG" "$PNG"
    oxipng --opt 4 --interlace 1 --strip safe "$PNG"
  fi
done
