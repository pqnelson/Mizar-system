TEX=pdflatex
FILE=mizar

all: extract_tex
	$(TEX) $(FILE)
	$(TEX) $(FILE)

extract_tex: defs
	noweave -n -latex -indexfrom analyzer.defs src/analyzer.nw > tex/analyzer.tex
	noweave -n -latex -indexfrom analyzer.defs src/equalizer.nw > tex/equalizer.tex
defs:
	nodefs src/analyzer.nw src/equalizer.nw > analyzer.defs
	sort -u analyzer.defs | cpif analyzer.defs