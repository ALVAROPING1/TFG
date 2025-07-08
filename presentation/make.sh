#!/bin/bash

if [ "$1" == "-f" ] || [ "$2" == "-f" ]; then
    rm -rf build/
fi

mkdir -p build/parts

set -e

latexmk --output-directory=build -cd -shell-escape -pdflua presentation.tex

if [ "$1" == "-o" ] || [ "$2" == "-o" ]; then
    PDF_READER="okular"
    if ! pidof -qx "$PDF_READER"; then
        xdg-open build/presentation.pdf
    fi
fi
