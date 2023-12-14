TEX=pdflatex
FILE=mizar

all: extract_tex
	$(TEX) $(FILE)
	$(TEX) $(FILE)

extract_tex: defs
	noweave -n -latex -indexfrom analyzer.defs src/analyzer.nw > tex/analyzer.tex

defs:
	nodefs src/analyzer.nw > analyzer.defs
	sort -u analyzer.defs | cpif analyzer.defs