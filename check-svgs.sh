#!/bin/sh

# this script acts as a crude linter to check if some SVG files deviate from the intended format

# Dependencies:
# https://github.com/BurntSushi/ripgrep

SVG_TAIL='z"/></svg>'

ICON_HEAD='<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M0 0h512v512H0z"/><path fill="#fff" d="'
rg --invert-match --count-matches "$ICON_HEAD(.*)$SVG_TAIL" **/*.svg | rg --invert-match 'badges/'

BADGE_HEAD='<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256"><circle cx="128" cy="128" r="128"/><circle stroke="#fff" stroke-width="18" cx="128" cy="128" r="101"/><path fill="#fff" d="'
rg --invert-match --count-matches "$BADGE_HEAD(.*)$SVG_TAIL" badges/*.svg | rg --invert-match 'blank'
