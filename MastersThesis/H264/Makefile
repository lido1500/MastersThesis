#!/usr/bin/make -f
PDFLATEX  = pdflatex -interaction=nonstopmode
BIBTEX = bibtex
FORMAT = fold -sw 80
LATEXDIFF = latexdiff

SOURCE = h264
BIB    = h264
DIFF = diff
REVFOLD = review/
REVFILE = h264_rev
REV = $(REVFOLD)$(REVFILE)
HTML = hevea -o html/

all: pdf

pdf:
	#$(FORMAT) $(SOURCE).tex > tmp.tex
	#mv tmp.tex $(SOURCE).tex
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

