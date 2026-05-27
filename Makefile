LATEXMK  ?= latexmk
TEXFILES := $(wildcard notations/*.tex) $(wildcard src/*.tex) $(wildcard src/*/*.tex)

all: thesis
thesis: thesis.pdf

watch:
	watchexec -e tex make

clean:
	$(LATEXMK) -C
	rm -fR _minted-main
	rm -f references.bbl references.brf references.ptb

%.pdf: %.tex $(TEXFILES) references.bib
	$(LATEXMK) -pdf -shell-escape -file-line-error $<

.PHONY: all clean thesis
