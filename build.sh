#!/bin/zsh

while [[ true ]]; do
    if [[ ! -f tutorial.nlo || ! -f tutorial.aux ]]; then
        xelatex tutorial.tex
    fi
    bibtex tutorial.aux
    makeindex tutorial.nlo -s nomencl.ist -o tutorial.nls
    xelatex tutorial.tex
    xelatex tutorial.tex
    if [[ -f tutorial.pdf ]]; then
        mv tutorial.pdf tutorial_newest.pdf
    fi
    sleep 10
done
