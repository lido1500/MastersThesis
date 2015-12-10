#!/usr/bin/make -f
PDFLATEX  = pdflatex -interaction=nonstopmode
BIBTEX = bibtex
LATEXDIFF = latexdiff

SOURCE = mcb
BIB    = mcb
DIFF = diff
REVFOLD = review/
REVFILE = mcb_rev
REV = $(REVFOLD)$(REVFILE)
HTML = hevea -o html/

all: pdf

pdf:
	$(PDFLATEX) $(SOURCE)
	$(BIBTEX) $(SOURCE)
	$(PDFLATEX) $(SOURCE)
	$(PDFLATEX) $(SOURCE)

clean:
	rm -fv *.aux *.bbl *.blg *.log *.lot *.toc *.lof *.out

rev:	pdf
	$(PDFLATEX) $(REV)
	$(BIBTEX) $(SOURCE)
	$(PDFLATEX) $(REV)
	$(PDFLATEX) $(REV)
	mv $(REVFILE).pdf $(REV).pdf	
	
diff:
	$(LATEXDIFF) $(SOURCE).tex $(REV).tex > $(DIFF).tex
	$(PDFLATEX) $(DIFF)
	$(BIBTEX) $(DIFF)
	$(PDFLATEX) $(DIFF)
	$(PDFLATEX)  $(DIFF)
	mv $(DIFF).pdf $(REVFOLD)$(DIFF).pdf
	
html: pdf
	$(HTML)$(SOURCE).html $(SOURCE).tex

