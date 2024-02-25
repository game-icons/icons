#!/bin/sh

# the SVG icons in this repository are white on black by default.
# this script goal is to generate new icons with custom colors.

# it accepts two optional positional arguments:
# - the foreground color in hexadecimal (default to #fff, white)
# - the background color in hexadecimal (default to #000, black) or the special value "transparent"

# examples of usage:
# red on black
# ./colorize-svgs.sh '#f00'
# greenish on transparent
# ./colorize-svgs.sh '#bada55' 'transparent'

# final artifacts are created in this gitignored _out directory
OUT_ROOT_DIR='_out'

DEFAULT_FOREGROUND='#fff'
DEFAULT_BACKGROUND='#000'
FOREGROUND="$DEFAULT_FOREGROUND"
BACKGROUND="$DEFAULT_BACKGROUND"

DIMENSIONS='1x1'

if test -n "$1"; then
  FOREGROUND="$1"
fi
if test -n "$2"; then
  BACKGROUND="$2"
fi

# helper
begins_with() { case $2 in "$1"*) true;; *) false;; esac; }

i=0
for SVG in $(fd --extension svg); do
  AUTHOR="$(dirname "$SVG")"

  # ignore SVGs previously generated
  if test "$AUTHOR" = "$OUT_DIR"; then
    continue
  fi

  if test "$AUTHOR" = badges; then
    continue
  fi

  # remove hexadecimal prefix
  FOREGROUND_DIR="$FOREGROUND"
  if begins_with '#' "$FOREGROUND_DIR"; then
    FOREGROUND_DIR="$(echo "$FOREGROUND_DIR" | cut -c 2-)"
  fi
  BACKGROUND_DIR="$BACKGROUND"
  if begins_with '#' "$BACKGROUND_DIR"; then
    BACKGROUND_DIR="$(echo "$BACKGROUND_DIR" | cut -c 2-)"
  fi

  # ensure 6 digits format
  if [ "${#FOREGROUND_DIR}" -lt 6 ]; then
    FOREGROUND_DIR="$FOREGROUND_DIR$FOREGROUND_DIR"
  fi
  if [ "${#BACKGROUND_DIR}" -lt 6 ]; then
    BACKGROUND_DIR="$BACKGROUND_DIR$BACKGROUND_DIR"
  fi

  # this path reflects the one currently on https://game-icons.net
  # e.g. https://game-icons.net/icons/ffffff/000000/1x1/lorc/glass-heart.svg
  OUT_DIR="$OUT_ROOT_DIR/$FOREGROUND_DIR/$BACKGROUND_DIR/$DIMENSIONS/$AUTHOR"
  mkdir -p "$OUT_DIR"

  OUT_FILE="$OUT_DIR/$(basename "$SVG")"
  cp "$SVG" "$OUT_FILE"

  if test "$FOREGROUND" != "$DEFAULT_FOREGROUND"; then
    sed -i "s/fill=\"$DEFAULT_FOREGROUND\"/fill=\"$FOREGROUND\"/g" "$OUT_FILE"
  fi

  if test "$BACKGROUND" != "$DEFAULT_BACKGROUND"; then
    # remove the square entirely
    if test "$BACKGROUND" = transparent; then
      sed -i "s/<path d=\"M0 0h512v512H0z\"\/>//g" "$OUT_FILE"
    else
      sed -i "s/<path d=\"M0 0h512v512H0z\"\/>/<path fill=\"$BACKGROUND\" d=\"M0 0h512v512H0z\"\/>/g" "$OUT_FILE"
    fi
  fi

  i=$((i+1))
  echo "$i $OUT_FILE"
done

