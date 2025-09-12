FILE=img.mp
#FILES = img.mp classdiagram.mp
FILES = img.pdf classdiagram.pdf statediagram.pdf

.SUFFIXES: 
.SUFFIXES: .mp .pdf
.PHONY=all
all: $(FILES)
	@:

# This will make $@ bound to "file.pdf" and $< bound to "file.mp"
$(FILES): %.pdf: %.mp
	mptopdf $<

pdf:
	mptopdf $(FILE)

class:
	mptopdf classdiagram.mp

state:
	mptopdf statediagram.mp