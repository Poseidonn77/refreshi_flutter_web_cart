#!/bin/sh
# Renders the catalog SVG sources to the PNG assets the app loads.
# Requires rsvg-convert (brew install librsvg). Run from the repo root.
set -e
out=assets/images/products
mkdir -p "$out"
for f in tool/catalog_art/*.svg; do
  rsvg-convert -w 512 -h 512 "$f" -o "$out/$(basename "$f" .svg).png"
done
