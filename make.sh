#!/bin/bash

if [ "$1" != "" ]; then
    rm -rf build/
fi


mkdir build
mkdir build/parts

set -e

latexmk --output-directory=build -cd -shell-escape -pdflua report.tex
makeglossaries -d build report
latexmk --output-directory=build -cd -shell-escape -pdflua report.tex
xdg-open build/report.pdf
