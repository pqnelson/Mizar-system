FILE=img.mp
#FILES = img.mp classdiagram.mp
FILES = img.pdf classdiagram.pdf

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
