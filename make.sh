#!/bin/bash

if [ "$1" == "-f" ] || [ "$2" == "-f" ]; then
    rm -rf build/
fi

mkdir -p build/parts

set -e

latexmk --output-directory=build -cd -shell-escape -pdflua report.tex
makeglossaries -d build report
latexmk --output-directory=build -cd -shell-escape -pdflua report.tex

if [ "$1" == "-o" ] || [ "$2" == "-o" ]; then
    PDF_READER="okular"
    if ! pidof -qx "$PDF_READER"; then
        xdg-open build/report.pdf
    fi
fi
