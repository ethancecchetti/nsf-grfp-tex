# Switched this back to bibtex because the current version of crosstex
# seems to have a bug causing incorrect capitalization in the titles.

LATEX=pdflatex
TEXFLAGS=

TARGETS=statement.pdf

all: $(TARGETS:.pdf=.build)

statement: statement.build

%.build: %.tex
	$(LATEX) $(TEXFLAGS) $<
	bibtex $(basename $<)
	bibtex $(basename $<)
	$(LATEX) $(TEXFLAGS) $<
	$(LATEX) $(TEXFLAGS) $<

clean:
	rm -f $(TARGETS) *.log *.aux *.dvi *.bbl *.blg *.bcf
