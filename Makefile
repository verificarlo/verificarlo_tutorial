.PHONY : FORCE_MAKE
all: main-en.pdf
%.pdf: %.tex FORCE_MAKE
	latexmk -pdf $<

clean:
	latexmk -C
