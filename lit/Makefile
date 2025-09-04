FILE=esmprocessor
TEX=pdftex
GALLEY=galley

all: labels
	weave -p $(FILE) - $(FILE)
	bash cleanindex.sh
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	cp labels.tex labels2.tex

# Transcribe one file at a time, then append the results to "esmprocessor.web"
galley: labels next
	@:

next: labels
	weave -p $(GALLEY) - $(GALLEY)
	bash cleanindex.sh
	$(TEX) $(GALLEY)
	$(TEX) $(GALLEY)

dvi: labels
	weave $(FILE) - $(FILE)
	bash cleanindex.sh
	tex $(FILE)
	tex $(FILE)

classic: dvi
	dvipdfmx $(FILE).dvi

twill: labels
	twill $(FILE).web - $(FILE)
	twill $(FILE).web - $(FILE)
	tex $(FILE)
	twill-refs < $(FILE).ref > $(FILE).sref
	tex $(FILE)

labels:
	touch labels.tex

clean:
	rm *.log CONTENTS.tex