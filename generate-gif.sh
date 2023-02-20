#!/bin/bash

set -o nounset  # (set -u) No unset variables
set -o errexit  # (set -e) Exit if any statement returns non-true value

OUTPUT_FILE="animation.gif"
OSCAD_SRC_FILE="Circles.scad"

#OSCAD_BINARY="openscad"  # Linux
OSCAD_BINARY="/c/Program Files/OpenSCAD/openscad.exe"  # Windows

TEMP_DIR="$(mktemp -d)"

function cleanup {
    echo "Removing $TEMP_DIR"
    rm -r "$TEMP_DIR"
}

trap cleanup EXIT

for i in {1..10}; do
    "$OSCAD_BINARY" -q -o "$TEMP_DIR/${i}.png" "$OSCAD_SRC_FILE"
done

magick convert -delay 10 -dispose previous $TEMP_DIR/*.png "$OUTPUT_FILE"
