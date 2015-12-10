#!/usr/bin/make -f
PDFLATEX  = pdflatex -interaction=nonstopmode
BIBTEX = bibtex
LATEXDIFF = latexdiff

NAME = memoire
SOURCE = $(NAME)
BIB    = $(NAME)
HTML = hevea -o html/

all: pdf

bib:
	$(BIBTEX) $(SOURCE)

pdf:
	$(PDFLATEX) $(SOURCE)
	$(BIBTEX) $(SOURCE)
	$(PDFLATEX) $(SOURCE)
	$(PDFLATEX) $(SOURCE)

clean:
	rm -fv *.aux *.bbl *.blg *.log *.lot *.toc *.lof *.out
	
html: pdf
	$(HTML)$(SOURCE).html $(SOURCE).tex

