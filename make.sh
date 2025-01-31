#!/bin/bash

if [ "$1" != "" ]; then
    rm -rf build/
fi

mkdir -p build/parts

set -e

latexmk --output-directory=build -cd -shell-escape -pdflua report.tex
makeglossaries -d build report
latexmk --output-directory=build -cd -shell-escape -pdflua report.tex

PDF_READER="okular"
if ! pidof -qx "$PDF_READER"; then
    xdg-open build/report.pdf
fi
